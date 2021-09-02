require 'rails_helper'

RSpec.describe "armazems/index", type: :view do
  before(:each) do
    assign(:armazems, [
      Armazem.create!(
        name: "Name",
        brand: "Brand",
        weight: 1.5,
        price: 4.7,
        description: "MyText",
        expiration: "2016-10-05"
      ),
      Armazem.create!(
        name: "Name",
        brand: "Brand",
        weight: 1.5,
        price: 4.7,
        description: "MyText",
        expiration: "2016-10-05"
      )
    ])
  end

  it "renders a list of armazems" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: 1.5.to_s, count: 2
    assert_select "tr>td", text: 4.7.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
