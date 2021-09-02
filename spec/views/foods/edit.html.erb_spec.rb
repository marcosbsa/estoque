require 'rails_helper'

RSpec.describe "foods/edit", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      titulo: "MyString",
      marca: "MyString",
      preco: 1.5,
      peso: "MyString"
    ))
  end

  it "renders the edit food form" do
    render

    assert_select "form[action=?][method=?]", food_path(@food), "post" do

      assert_select "input[name=?]", "food[titulo]"

      assert_select "input[name=?]", "food[marca]"

      assert_select "input[name=?]", "food[preco]"

      assert_select "input[name=?]", "food[peso]"
    end
  end
end
