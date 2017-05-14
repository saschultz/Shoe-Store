require 'spec_helper'

describe Brand do
  it { should have_and_belong_to_many(:stores) }
  it { is_expected.to callback(:title_case).before(:save)}

  it 'validates presence of name in a brand' do
    test_brand = Brand.create name: 'Toms'
    expect(test_brand.update(name: ' ')).to(eq(false))
  end

  it 'validates the brand name is unique before saving it' do
    test_brand = Brand.new name: 'Vans'
    test_brand.save
    test_brand2 = Brand.new name: 'Vans'
    expect(test_brand2.save).to(eq(false))
  end

  it 'ensures the length of a brand name is at most 100 characters' do
    test_brand = Brand.new( name: "a".*(101) )
    expect(test_brand.save).to(eq false )
  end

  describe '#to_currency' do
    it 'ensures price input is in standard notation for American currancy and begins with a $ symbol' do
      test_brand = Brand.create( name: 'Toms', price: 32.5 )
      expect(test_brand.to_currency(test_brand.price)).to(eq('$32.50'))
    end
  end
end
