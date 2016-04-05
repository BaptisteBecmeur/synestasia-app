require 'rails_helper'

RSpec.describe "symboles/new", type: :view do
  before(:each) do
    assign(:symbole, Symbole.new())
  end

  it "renders new symbole form" do
    render

    assert_select "form[action=?][method=?]", symboles_path, "post" do
    end
  end
end
