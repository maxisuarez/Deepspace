#encoding:utf-8

class SuppliesPackage
  attr_reader :ammoPower, :fuelUnits, :shieldPower
  
  def initialize(ammoPower, fuelUnits,shieldPower)
    @ammoPower = ammoPower
    @fuelUnits = fuelUnits
    @shieldPower = shieldPower
  end
  
  def self.newCopy(copy)
    SuppliesPackage.new(copy.ammoPower, copy.fuelUnits, copy.shieldPower) 
  end
end
