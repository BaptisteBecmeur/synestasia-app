require 'rails_helper'

RSpec.describe "symboles/edit", type: :view do
  before(:each) do
    @symbole = assign(:symbole, Symbole.create!())
  end

  it "renders the edit symbole form" do
    render

    assert_select "form[action=?][method=?]", symbole_path(@symbole), "post" do
    end
  end
end
