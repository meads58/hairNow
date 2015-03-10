require 'spec_helper'
require_relative './helpers/new_client'

feature "Clients can create account" do


  scenario "when opening the home page they can sign up" do
    visit '/'
    expect(page).to have_content("sign up")
  end

  scenario "adding a new client creates the clients by 1" do
    visit '/'
    #click_on "sign_up"
    expect{ new_user }.to change(Client, :count).by(1)
  end

end

