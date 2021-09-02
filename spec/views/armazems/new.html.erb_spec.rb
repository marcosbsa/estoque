require 'rails_helper'

RSpec.describe "armazems/new", type: :view do
  before(:each) do
    assign(:armazem, Armazem.new(
        name: "MyString",
        brand: "MyString",
        weight: 1.5,
        price: 4.7,
        description: "MyString",
        expiration: "2016-10-05"
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", armazems_path, "post" do

        assert_select "input[name=?]", "armazem[name]"

        assert_select "input[name=?]", "armazem[brand]"
  
        assert_select "input[name=?]", "armazem[weight]"
  
        assert_select "input[name=?]", "armazem[price]"
  
        # assert_select "input[name=?]", "armazem[description]"
    end
  end
end
