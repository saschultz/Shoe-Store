require 'spec_helper'

describe 'the shoe store path', {:type => :feature} do
  it 'processes the user input to create a new shoe store' do
    visit '/'
    click_link 'a shoe store'
    fill_in 'store_name', :with => 'New store'
    click_button 'Add'
  end
  
end
