class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    distinct("name")
  end

  def self.longest
    eager_load(:boats).order("boats.length desc").limit(2).uniq
  end
end
