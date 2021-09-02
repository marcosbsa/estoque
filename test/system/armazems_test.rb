require "application_system_test_case"

class ArmazemsTest < ApplicationSystemTestCase
  setup do
    @armazem = armazems(:one)
  end

  test "visiting the index" do
    visit armazems_url
    assert_selector "h1", text: "Armazems"
  end

  test "creating a Armazem" do
    visit armazems_url
    click_on "New Armazem"

    fill_in "Brand", with: @armazem.brand
    fill_in "Description", with: @armazem.description
    fill_in "Expiration", with: @armazem.expiration
    fill_in "Name", with: @armazem.name
    fill_in "Price", with: @armazem.price
    fill_in "Weight", with: @armazem.weight
    click_on "Create Armazem"

    assert_text "Armazem was successfully created"
    click_on "Back"
  end

  test "updating a Armazem" do
    visit armazems_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @armazem.brand
    fill_in "Description", with: @armazem.description
    fill_in "Expiration", with: @armazem.expiration
    fill_in "Name", with: @armazem.name
    fill_in "Price", with: @armazem.price
    fill_in "Weight", with: @armazem.weight
    click_on "Update Armazem"

    assert_text "Armazem was successfully updated"
    click_on "Back"
  end

  test "destroying a Armazem" do
    visit armazems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Armazem was successfully destroyed"
  end
end
