class CreateWebPages < ActiveRecord::Migration[5.0]
  def change
    create_table :web_pages do |t|
      t.string :title
      t.string :description
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end
