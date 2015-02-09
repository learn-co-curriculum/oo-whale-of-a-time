class Whale

  attr_accessor :calves, :lbs_of_milk
  attr_reader :name
  
  def initialize(name)
    @name = name
    @calves = []
    @lbs_of_milk = 120
    @lbs_of_krill = 0
  end

  def hungry?
    lbs_of_krill < 2000
  end

  def feed_calf(calf)
    if self.lbs_of_milk > 50 && calf.hungry?
      self.lbs_of_milk -= 50
      calf.lbs_of_milk += 50
    end
  end

  def give_birth
    self.calves << Calf.new(self)
  end

  def adopt_calf(calf)
    calf.mother = self
    self.calves << calf
  end
  
end