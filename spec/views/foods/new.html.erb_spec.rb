require 'rails_helper'

RSpec.describe "foods/new", type: :view do
  before(:each) do
    assign(:food, Food.new(
      titulo: "MyString",
      marca: "MyString",
      preco: 1.5,
      peso: "MyString"
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", foods_path, "post" do

      assert_select "input[name=?]", "food[titulo]"

      assert_select "input[name=?]", "food[marca]"

      assert_select "input[name=?]", "food[preco]"

      assert_select "input[name=?]", "food[peso]"
    end
  end
end
