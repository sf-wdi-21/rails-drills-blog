class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :tags, :articles
  end
end
