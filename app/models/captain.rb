class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where("classifications.name = ?", "Catamaran").uniq
  end

  def self.sailors
    includes(boats: :classifications).where("classifications.name = ?", "Sailboat").uniq
  end

  def self.motorboaters
    includes(boats: :classifications).where("classifications.name = ?", "Motorboat").uniq
  end

  def self.talented_seamen
    sailors.where(id: motorboaters.ids)
  end

  def self.non_sailors
    all.where.not(id: sailors.ids)
  end
end
