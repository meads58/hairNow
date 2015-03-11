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

  scenario "is automatically logged into account after creating one" do
    visit '/'
    click_link "Sign Up"
    new_user
    expect(page).to have_content("Jim")
  end

  scenario "log out of account" do
    visit('/')
    click_link "Sign Up"
    new_user
    click_on "Sign Out"
    expect(page).not_to have_content("Jim")
  end

  scenario "log into account after logging out" do
    visit('/')
    click_link "Sign Up"
    new_user
    click_on "Sign Out"
    click_link "Sign In"
    fill_in :email, :with => "jimbo@cool.com"
    fill_in :password, :with => "bart"
    click_on "Sign in"
    expect(page).to have_content("Jim")
  end

  scenario "book an appointment" do
    visit('/')
    click_link "Sign Up"
    new_user
    fill_in :start_time, :with => "12:30:00"
    # fill_in :date, :with => "12:30:00"
    expect{click_on "Book Appointment"}.to change(Appointment, :count).by(1)
  end


end

