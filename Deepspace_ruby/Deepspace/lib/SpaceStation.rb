#encoding:utf-8

require_relative 'SpaceStationToUI'

module Deepspace

class SpaceStation
  @@MAXFUEL=100
  @@SHIELDLOSSPERUNITSHOT=0.1

  attr_reader :ammoPower, :fuelUnits, :name, :nMedals, :shieldPower

  def initialize(n,s)
    @name = n
    @ammoPower = s.ammoPower
    @fuelUnits = s.fuelUnits
    @shieldPower = s.shieldPower
    @hangar = nil
    @weapons = []
    @shieldBoosters = []
    @pendingDamage = nil
    @nMedals = nil
  end

  def getUIversion
    SpaceStationToUI.new(self)
  end

  def receiveWeapon(w)
    if @hangar != nil
      @hangar.addWeapon(w)
    end
  end

  def receiveShieldBooster(s)
    if @hangar != nil
        @hangar.addShieldBooster(s)
    end
  end

  def receiveHangar(h)
    if @hangar == nil
      @hangar = h
    end
  end

  def discardHangar
    @hangar = nil
  end

  def receiveSupplies(s)
    @ammoPower += s.ammoPower
    @shieldPower += s.shieldPower
    if @fuelUnits + s.fuelUnits <= @@MAXFUEL
        @fuelUnits += s.fuelUnits
    else
        @fuelUnits = @@MAXFUEL
    end
  end

  def setPendingDamage(d)
    @pendingDamage = d.adjust(@weapons, @shieldBoosters)
  end

  def mountWeapon(i)
    if @hangar != nil
      rm = @hangar.removeWeapon(i)
      if rm != nil
        @weapons.push(rm)
      end
    end
  end

  def mountShieldBooster(i)
    if @hangar != nil
      rm = @hangar.removeShieldBooster(i)
      if rm != nil
        @shieldBoosters.push(rm)
      end
    end

  end

  def discardWeaponInHangar(i)
    if @hangar != nil
      @hangar.removeWeapon(i)
    end
  end

  def discardShieldBoosterInHangar(i)
    if @hangar != nil
      @hangar.removeShieldBooster(i)
    end

  end

  def getSpeed
    return @fuelUnits.to_f / @@MAXFUEL
  end

  def move
    @fuelUnits -= getSpeed * @fuelUnits.to_f 
  end

  def validState
    return @pendingDamage == nil || @pendingDamage.hasNoEffect
  end

  def cleanUpMountedItems
    #Guardamos los índices
    indices = []
    for i in 0...@weapons.length
      if @weapons[i].uses == 0
        indices.push(i)
      end
    end

    indices.sort.reverse

    for i in indices
      @weapons.delete_at(i)
    end

    indices = []

    for i in 0...@shieldBoosters.length
      if @shieldBoosters[i].uses == 0
        indices.push(i)
      end
    end

    indices.sort.reverse

    for i in indices
      @shieldBoosters.delete_at(i)
    end
  end

  #Para la siguiente práctica
  def fire

  end

  def protection

  end

  def receiveShot(shot)

  end

  def setLoot(loot)

  end

  def discardWeapon(i)

  end

  def discardShieldBooster(i)

  end

  def to_s
     return "Name #{@name} AmmoPower: #{@ammoPower} FuelUnits: #{@fuelUnits}
     ShieldPower: #{@shieldPower} Medals: #{@nMedals} Weapons: #{@weapons}
     ShieldBoosters: #{@shieldBoosters} Hangar: #{@hangar} PendingDamage: #{@pendingDamage}"
   end

  private
    def assignFuelValue(f)
      if f <= @@MAXFUEL
        @fuelsUnits = f
      end
    end

    def cleanPendingDamage
      if @pendingDamage.hasNoEffect
        @pendingDamage = nil
      end
    end


end
end
