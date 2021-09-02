require 'rails_helper'

RSpec.describe "foods/show", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      titulo: "Titulo",
      marca: "Marca",
      preco: 2.5,
      peso: "Peso"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/Marca/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Peso/)
  end
end
