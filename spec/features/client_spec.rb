require 'spec_helper'
require_relative './helpers/new_client'

feature "Client can" do

  scenario "open home page and then sign up" do
    visit '/'
    expect(page).to have_content("Sign Up")
  end

  scenario "sign up which then adds client to database" do
    visit '/'
    click_link "Sign Up"
    expect{ new_user }.to change(Client, :count).by(1)
  end

  scenario "log into account after creating one" do
    visit '/'
    click_link "Sign Up"
    new_user
    expect(page).to have_content("Jim")
  end


end

