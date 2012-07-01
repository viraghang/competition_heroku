class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string "name", :limit => 100, :null => false
      t.string "email", :limit => 100, :null => false
      t.string "tender_name", :limit => 100, :null => false
      t.integer "telephone", :limit => 11, :null => false
      t.integer "zipcode", :limit => 4, :null => false
      t.string "address", :limit => 100, :null => false
      t.text "comments"
      t.timestamps
    end
  end
end
