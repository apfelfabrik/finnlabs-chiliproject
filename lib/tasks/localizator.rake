# Copyright (c) 2011 [Edoardo Serra]
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# code from: https://github.com/eserra/localizator
# slightly modified for OpenProject
#
# see USAGE below

namespace :localizator do
  desc "Generate a YAML file with missing translations"
  task :compare, [:locale, :base_locale] => :environment do |t, args|
    args.with_defaults(:locale => 'new_locale', :base_locale => I18n.default_locale.to_s)
    dl = args[:base_locale]
    tls = (args[:locale] == '*') ? I18n.available_locales : [args[:locale]]
    tls.each do |tl|
      puts "Comparing #{tl} against #{dl}"
      filename = "#{Rails.root}/config/locales/#{tl}-missing.yml"
      if File.exists?(filename)
        puts "File 'config/locales/#{tl}-missing.yml' exists."
        # we don't use the automatic merge feature at the moment
        # puts "Merge it first with 'rake localizer:merge[#{tl}]' or delete it"
      else
        translations = {}
        I18n.load_path.each do |file|
          tree = YAML::parse(File.open(file))
          translations.deep_merge!(tree.transform)
        end
        missing_translations = {tl => Localizator::Helpers::locale_diff(translations[dl], translations[tl])}
        if missing_translations[tl].any?
          File.open(filename, 'w') do |f|
            f.puts missing_translations.to_yaml
          end
          puts "Created 'config/locales/#{tl}-missing.yml' with missing translations."
          puts "Edit and merge it back" # with 'rake localizer:merge[#{tl}]'"
        else
          puts "All keys in locale '#{dl}' are translated!"
        end
      end
    end
  end

  desc "Merge translations into main locale file"
  task :merge , [:locale, :base_locale] => :environment do |t, args|
    raise NotImplementedError.new("please merge the missing translations manually")

    # we'll want that some day
    args.with_defaults(:locale => 'new_locale')
    tl = args[:locale]
    filename = "#{Rails.root}/config/locales/#{tl}-missing.yml"
    if File.exists?(filename)
      translations = {}
      I18n.load_path.each do |file|
        tree = YAML::parse(File.open(file))
        translations.deep_merge!(tree.transform)
      end
      final = {tl => translations[tl]}
      base = "#{Rails.root}/config/locales/#{tl}.yml"
      if File.exists?(base)
        puts "Backing up 'config/locales/#{tl}.yml' to 'config/locales/#{tl}.yml.bak'..."
        FileUtils.cp(base, "#{Rails.root}/config/locales/#{tl}.yml.bak")
      end
      File.open(base, 'w') do |f|
        f.puts final.to_yaml
      end
      puts "Removing 'config/locales/#{tl}-missing.yml'..."
      FileUtils.rm(filename)
      puts "Created 'config/locales/#{tl}.yml' with merged translations."
      puts "Please remove the backup file manually once you are satisfied with the results"
    else
      puts "File 'config/locales/#{tl}-missing.yml' does not exist."
      puts "Create it first with 'rake localizer:compare[#{tl}]'"
    end
  end
end

module Localizator
  module Helpers
    def self.locale_diff(a, b)
      diff = {}
      if b.nil? or (b.class != a.class)
        return a
      end
      if a.is_a? Hash
        a.keys.each do |key|
          ret = locale_diff(a[key], b[key])
          diff[key] = ret unless ret.is_a?(Hash) && ret.empty?
        end
      end
      diff
    end
  end
end

# README
#
# == Localizator
# This plugin provides two simple rake tasks to help keeping tranlations in
# sync with another locale.
#
# = Usage
# Start creating a new locale with:
#
#     [noglob]* rake localizator:compare[nl]
#
# It will generate a new file in 'config/locales/nl-missing.yml' with the
# keys in your default locale which need to be translated.
#
# If you don't want to compare against your default locale you can pass
# another in as the second parameter
#
#     [noglob] rake localizator:compare[nl,de] => Comparing nl against de
#
# It will generate a new file in 'config/locales/nl-missing.yml' with the
# missing keys which need to be translated.
#
# Open this file in your favourite text editor and translate it!
#
# Once done you can add the translatios into your main locale file
# ('config/locales/nl.yml')
#
# In order to compare all locales to a single base locale use an asterix as the source
#
#   [noglob] rake localizator:compare[*,en] => Comparing all locales against en
#
# ==== TODO ====
#
# The following might be available in the future:
#
#     [noglob] rake localizator:merge[nl]
#
# Since this is the first run, this will simply copy your translations to
# the main locale file.
#
# Now, every time you edit your main locale file you can run the samle compare
# task with:
#
#     [noglob] rake localizator:compare[nl]
#
# Then translate the missing keys in your 'config/locales/nl-missing.yml'
# file and merge them back into the main locale file.
#
# Happy localization!
#
# (* noglob is needed for zsh when using rake with parameters in square brackets)
