require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        name: "Name",
        gender: "Male",
        kind: "Varejista",
        address: "Address",
        email: "example1@tol.com",
        cpf: 8991999999,
        rg: 9799992999,
        phone: 9993399999,
        birth: "2016-08-05",
        cnpj: 999799999

      ),
      Client.create!(
        name: "Name",
        gender: "Male",
        kind: "Varejista",
        address: "Address",
        email: "example1@tol.com",
        cpf: 8991999999,
        rg: 9799992999,
        phone: 9993399999,
        birth: "2016-08-05",
        cnpj: 999799999
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "example1@tol.com".to_s, count: 2
    assert_select "tr>td", text: 8991999999.0.to_s, count: 2
    assert_select "tr>td", text: 9799992999.0.to_s, count: 2
    assert_select "tr>td", text: 9993399999.0.to_s, count: 2
    assert_select "tr>td", text: "2016-08-05".to_s, count: 2
    assert_select "tr>td", text: 999799999.0.to_s, count: 2
    
  end
end
