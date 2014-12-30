class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.string :description
      t.string :path

      t.timestamps
    end
  end
end
