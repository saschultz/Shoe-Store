require 'spec_helper'

describe Store do
  it { should have_and_belong_to_many(:brands) }
  it { is_expected.to callback(:title_case).before(:save)}

  it 'validates presence of name in a store' do
    test_store = Store.create name: 'SAS Shoes'
    expect(test_store.update(name: ' ')).to(eq(false))
  end

  it 'validates the store name is unique before saving it' do
    test_store = Store.create name: 'SAS Shoes'
    test_store2 = Store.create name: 'SAS Shoes'
    expect(test_store.save).to(eq(false))
  end

  it 'ensures the length of a store name is at most 100 characters' do
    test_store = Store.new( name: "a".*(101) )
    expect(test_store.save).to(eq false )
  end
end
