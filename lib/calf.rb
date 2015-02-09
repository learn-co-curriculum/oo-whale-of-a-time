class Calf

  attr_accessor :mother, :lbs_of_milk

  def initialize(mother)
    @mother = mother
    @lbs_of_milk = 0
  end

  def hungry?
    lbs_of_milk < 100
  end

  def drink_milk
    if mother.lbs_of_milk > 50 && hungry?
      mother.lbs_of_milk -= 50
      self.lbs_of_milk += 50
      "nom nom nom..."
    elsif hungry?
      "wish I could"
    else
      "No way I'm stuffed!"
    end
  end

end