class CreateOverlays < ActiveRecord::Migration
  def change
    create_table :overlays do |t|
      t.string :image
      t.datetime :date_from
      t.datetime :date_to
      t.string :position

      t.timestamps
    end
  end
end
