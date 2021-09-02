require 'rails_helper'

RSpec.describe "armazems/edit", type: :view do
  before(:each) do
    @armazem = assign(:armazem, Armazem.create!(
      name: "MyString",
      brand: "MyString",
      weight: 1.5,
      price: 4.7,
      description: "MyString",
      expiration: "2016-10-05"
    ))
  end

  it "renders the edit armazem form" do
    render

    assert_select "form[action=?][method=?]", armazem_path(@armazem), "post" do

      assert_select "input[name=?]", "armazem[name]"

      assert_select "input[name=?]", "armazem[brand]"

      assert_select "input[name=?]", "armazem[weight]"

      assert_select "input[name=?]", "armazem[price]"

    #   assert_select "input[name=?]", "armazem[description]"
    end
  end
end
