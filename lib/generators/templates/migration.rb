class CreateSeoFuel < ActiveRecord::Migration
  def self.up
    create_table :seo_tags do |t|
      t.string :title
      t.string :description
      t.text :keywords
      t.string :canonical
      t.text :open_graph
      t.string :path
      t.boolean :use_project_title
      t.boolean :noindex
      t.boolean :nofollow
      t.timestamps
    end
        
    add_index :seo_tags, :path
  end

  def self.down
    drop_table :seo_tags
  end
end
