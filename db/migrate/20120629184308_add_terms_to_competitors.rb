class AddTermsToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :terms, :string

  end
end
