require 'spec_helper'

describe Store do
  it { should have_and_belong_to_many(:brands) }
  it { is_expected.to callback(:title_case).before(:save)}
end
