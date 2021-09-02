require 'rails_helper'

RSpec.describe "armazems/show", type: :view do
  before(:each) do
    @armazem = assign(:armazem, Armazem.create!(
        name: "Name",
        brand: "Brand",
        weight: 1.5,
        price: 4.7,
        description: "MyText",
        expiration: "2016-10-05"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/4.7/)
    expect(rendered).to match(/MyText/)
  end
end
