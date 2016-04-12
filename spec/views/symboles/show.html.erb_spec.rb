require 'rails_helper'

RSpec.describe "symboles/show", type: :view do
  before(:each) do
    @symbole = assign(:symbole, Symbole.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
