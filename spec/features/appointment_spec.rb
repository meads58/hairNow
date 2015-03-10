require 'spec_helper'

feature "Client can see appointments" do

  scenario "when on the homepage the date picker is visible" do
    visit '/'
    expect(page).to have_css('div#calendar')
  end



end