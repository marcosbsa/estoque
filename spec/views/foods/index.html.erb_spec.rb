require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        titulo: "Titulo",
        marca: "Marca",
        preco: 2.5,
        peso: "Peso"
      ),
      Food.create!(
        titulo: "Titulo",
        marca: "Marca",
        preco: 2.5,
        peso: "Peso"
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", text: "Titulo".to_s, count: 2
    assert_select "tr>td", text: "Marca".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "Peso".to_s, count: 2
  end
end
