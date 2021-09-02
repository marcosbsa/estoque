require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @food = assign(:client, Client.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/example1@tol.com/)
    expect(rendered).to match(/8991999999/)
    expect(rendered).to match(/9799992999/)
    expect(rendered).to match(/9993399999/)
    expect(rendered).to match(/2016-08-05/)
    expect(rendered).to match(/999799999/)
  end
end
