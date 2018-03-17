#encoding:utf-8

class Weapon
  attr_reader :name, :type, :uses
  def initialize(name, type, uses)
    @name = name
    @type = type
    @uses = uses     
  end
  
  def self.newCopy(copy)
    Weapon.new(copy.name, copy.type, copy.uses) 
  end
  
  def power
    return type.power
  end
  
  def useIt
    if @uses > 0
      @uses -= 1
      return power
    else
      return 1.0
    end
  end
end
