require 'spec_helper'

describe Brand do
  it { should have_and_belong_to_many(:stores) }
  it { is_expected.to callback(:title_case).before(:save)}

  it 'validates presence of name in a brand' do
    test_brand = Brand.create name: 'Toms'
    expect(test_brand.update(name: ' ')).to(eq(false))
  end
end
