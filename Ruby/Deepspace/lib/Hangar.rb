#encoding:utf-8
require_relative 'HangarToUI'

module Deepspace

class Hangar

  attr_reader :maxElements, :weapons, :shieldBoosters

  def initialize(capacity)
    @maxElements = capacity
    @weapons = Array.new
    @shieldBoosters = Array.new
  end

  def self.newCopy(copy)
    Hangar.new(copy.maxElements)
  end

  def getUIversion
    HangarToUI.new(self)
  end

  def addWeapon(w)
    if spaceAvailable
      @weapons.push(w)
    end
    spaceAvailable
  end

  def addShieldBooster(s)
    if spaceAvailable
      @shieldBoosters.push(s)
    end
    spaceAvailable
  end

  def removeWeapon(w)
     @weapons.delete_at(w)
  end

   def removeShieldBooster(s)
    @shieldBoosters.delete_at(s)
  end

  def to_s
      return "MaxElements: #{@maxElements} Weapons: #{@weapons.join(", ")} ShieldBoosters: #{@shieldBoosters.join(", ")}"
  end

  private
  def spaceAvailable
    return @weapons.length + @shieldBoosters.length < @maxElements
  end


end

end
