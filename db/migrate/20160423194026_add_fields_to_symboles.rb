class AddFieldsToSymboles < ActiveRecord::Migration
  def change
    add_column :symboles, :upload, :string
    add_column :symboles, :sound, :string
  end
end
