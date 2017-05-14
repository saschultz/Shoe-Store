class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  before_save(:title_case)
  validates(:name, :presence => true, :length => { :maximum => 100 } )
  validates(:name, uniqueness: { case_sensitive: false })
  def title_case
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
