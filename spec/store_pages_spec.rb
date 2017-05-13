require 'spec_helper'

describe 'the shoe store path', {:type => :feature} do
  it 'processes the user input to create a new shoe store' do
    visit '/'
    click_link 'a shoe store'
    fill_in 'store_name', :with => 'New store'
    click_button 'Add'
  end
  it 'allows the user to update the name of a store from the all_stores path' do
    visit '/all_stores'
    click_link 'here'
    fill_in 'store_name', :with => 'New store'
    click_button 'Add'
    click_link 'New Store'
    fill_in 'store_name', :with => 'Cool New Store'
    click_button 'Update'
    expect(page).to have_content 'Cool New Store'
  end
  it 'allows the user to delete a store' do
    visit '/all_stores'
    click_link 'here'
    fill_in 'store_name', :with => 'New store'
    click_button 'Add'
    click_link 'New Store'
    click_button 'Delete Store'
    page.has_xpath? 'add/store'
  end
end
