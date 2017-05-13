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
end
