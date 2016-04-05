class AddAttibutesToSymboles < ActiveRecord::Migration
  def change
  	add_column :symboles, :symbole_type, :string
  	add_column :symboles, :css_class, :string
  end
end
