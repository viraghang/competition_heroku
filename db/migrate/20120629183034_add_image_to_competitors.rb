class AddImageToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :image, :string

  end
end
