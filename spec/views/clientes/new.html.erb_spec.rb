require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
        name: "MyString",
        gender: "Male",
        kind: "Varejista",
        address: "MyString",
        email: "example@tol.com",
        cpf: 9991999999,
        rg: 9999992999,
        phone: 9999399999,
        birth: "2016-10-05",
        cnpj: 999999999
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[address]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[cpf]"

      assert_select "input[name=?]", "client[rg]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[cnpj]"
    end
  end
end
