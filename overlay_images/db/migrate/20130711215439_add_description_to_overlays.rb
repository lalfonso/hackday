class AddDescriptionToOverlays < ActiveRecord::Migration
  def change
     add_column :overlays, :description, :string
  end
end
