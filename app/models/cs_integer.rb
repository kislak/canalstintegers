class CsInteger < ActiveRecord::Base
  attr_accessible :celebrity_name, :celebrity_screen_name, :origin, :origin_url

  def description
    "A [adjective] integer \##{id} as used by #{celebrity_name} on #{origin}"
  end

end
