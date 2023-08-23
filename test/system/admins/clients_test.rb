require "application_system_test_case"

class Admins::ClientsTest < ApplicationSystemTestCase
  setup do
    @admins_client = admins_clients(:one)
  end

  test "visiting the index" do
    visit admins_clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit admins_clients_url
    click_on "New client"

    fill_in "Extra fields", with: @admins_client.extra_fields
    fill_in "Name", with: @admins_client.name
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit admins_client_url(@admins_client)
    click_on "Edit this client", match: :first

    fill_in "Extra fields", with: @admins_client.extra_fields
    fill_in "Name", with: @admins_client.name
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit admins_client_url(@admins_client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
