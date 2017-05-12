class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save(:title_case)
  validates(:name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  
  def title_case
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end

  def to_currency(price)
    "$" + sprintf('%.2f', price)
  end
end
