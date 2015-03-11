require 'spec_helper'
require_relative './helpers/new_client'

feature "Clients can create account" do


  scenario "when opening the home page they can sign up" do
    visit '/'
    expect(page).to have_content("Sign Up")
  end

  scenario "adding a new client creates the clients by 1" do
    visit '/'
    click_link "Sign Up"
    expect{ new_user }.to change(Client, :count).by(1)
  end

end

