class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save(:title_case)

  def title_case
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
