class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.text :bio
      t.date :born_on
      t.string :image_url

      t.timestamps

    end
  end
end
