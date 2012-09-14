class CreateWikiMenuItemForExistingWikis < ActiveRecord::Migration
  def self.up
    Wiki.all.each do |wiki|
      next if wiki.respond_to?(:show_default_tab) and wiki.show_default_tab == false

      menu_item = WikiMenuItem.new
      menu_item.name = wiki.start_page
      menu_item.title = wiki.start_page
      menu_item.wiki_id = wiki.id
      menu_item.index_page = true
      menu_item.new_wiki_page = true

      menu_item.save!
    end

    unless Wiki.columns.select {|a| a.name.to_s == "show_default_tab"}.empty?
      change_table :wikis do |t|
        t.remove :show_default_tab
      end
    end
  end

  def self.down
    puts "You cannot safely undo this migration!"
  end
end
