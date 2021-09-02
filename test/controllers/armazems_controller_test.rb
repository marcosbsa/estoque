require "test_helper"

class ArmazemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armazem = armazems(:one)
  end

  test "should get index" do
    get armazems_url
    assert_response :success
  end

  test "should get new" do
    get new_armazem_url
    assert_response :success
  end

  test "should create armazem" do
    assert_difference('Armazem.count') do
      post armazems_url, params: { armazem: { brand: @armazem.brand, description: @armazem.description, expiration: @armazem.expiration, name: @armazem.name, price: @armazem.price, weight: @armazem.weight } }
    end

    assert_redirected_to armazem_url(Armazem.last)
  end

  test "should show armazem" do
    get armazem_url(@armazem)
    assert_response :success
  end

  test "should get edit" do
    get edit_armazem_url(@armazem)
    assert_response :success
  end

  test "should update armazem" do
    patch armazem_url(@armazem), params: { armazem: { brand: @armazem.brand, description: @armazem.description, expiration: @armazem.expiration, name: @armazem.name, price: @armazem.price, weight: @armazem.weight } }
    assert_redirected_to armazem_url(@armazem)
  end

  test "should destroy armazem" do
    assert_difference('Armazem.count', -1) do
      delete armazem_url(@armazem)
    end

    assert_redirected_to armazems_url
  end
end
