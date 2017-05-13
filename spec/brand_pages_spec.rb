require 'spec_helper'

describe 'the shoe brand path', {:type => :feature} do
  it 'processes the user input to create a new shoe brand' do
    visit '/'
    click_link 'a shoe brand'
    fill_in 'brand_name', :with => 'vans'
    fill_in 'price', :with => '45'
    click_button 'Add'
    expect(page).to have_content 'Vans $45.00'
  end
  it 'allows the user to add a shoe brand  from the all_brands path' do
    visit '/all_brands'
    click_link 'here'
    fill_in 'brand_name', :with => 'vans'
    fill_in 'price', :with => '45'
    click_button 'Add'
    expect(page).to have_content 'Vans $45.00'
  end
  it 'allows the user to add a shoe brand to a shoe store' do
    visit '/'
    click_link 'a shoe store'
    fill_in 'store_name', :with => 'Toms Shoes'
    click_button 'Add'
    click_link 'Toms Shoes'
    click_link 'here'
    click_link 'here'
    fill_in 'brand_name', :with => 'Toms'
    fill_in 'price', :with => '48'
    click_button 'Add'
    click_button 'All Shoe Stores'
    click_link 'Toms Shoes'
    click_link 'here'
    check 'Toms'
    click_button 'Add'
    expect(page).to have_content 'Toms $48.00'
  end
end
