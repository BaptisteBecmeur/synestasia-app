require 'rails_helper'

RSpec.describe "symboles/index", type: :view do
  before(:each) do
    assign(:symboles, [
      Symbole.create!(),
      Symbole.create!()
    ])
  end

  it "renders a list of symboles" do
    render
  end
end
