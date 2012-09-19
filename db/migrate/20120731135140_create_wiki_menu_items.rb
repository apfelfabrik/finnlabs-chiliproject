class CreateWikiMenuItems < ActiveRecord::Migration
  def self.up
    if table_exists? :wiki_tabs
      rename_table :wiki_tabs, :wiki_menu_items

      add_column :wiki_menu_items, :parent_id, :integer
      add_column :wiki_menu_items, :options, :text

      WikiMenuItem.all.each {|tab| tab.destroy unless tab.active}
      remove_column :wiki_menu_items, :active

      WikiMenuItem.reset_column_information
    else
      create_table :wiki_menu_items do |t|
        t.column :name, :string
        t.column :title, :string
        t.column :parent_id, :integer
        t.column :options, :text

        t.belongs_to :wiki
      end
    end
  end

  def self.down
    puts "You cannot safely undo this migration!"
  end
end