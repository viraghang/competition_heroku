class ChangeTelephoneToCompetitors < ActiveRecord::Migration
  def change
  	change_column :competitors, :telephone, :string, :limit => 12
  end
end
