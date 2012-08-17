class CsInteger < ActiveRecord::Base
  attr_accessible :celebrity_name, :celebrity_screen_name, :origin, :origin_url

  validates :celebrity_name, :presence => true
  validates :celebrity_screen_name, :presence => true
  validates :origin, :presence => true
  validates :origin_url, :presence => true
  validates_uniqueness_of :id

  def description
    "A [adjective] integer \##{id} as used by #{celebrity_name} on #{origin}"
  end

end
