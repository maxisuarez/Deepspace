#encoding: utf-8
require_relative "CombatResult"
require_relative "GameCharacter"
require_relative "Loot"
require_relative "ShieldBooster"
require_relative "ShotResult"
require_relative "SuppliesPackage"
require_relative "Weapon"
require_relative "WeaponType"
require_relative 'Dice'

module Deepspace
class TestP1
  def main
    #Loot
    l1 = Loot.new(1,2,3,4,5)
    puts "l1: #{l1}"
    #puts "Sup #{l1.nSupplies}, nWeapons #{l1.nWeapons}, nShields #{l1.nShields}" +
      #"nHangars #{l1.nHangars} ,nMedals #{l1.nMedals}"  
    l2 = Loot.new(1,2,1,2,1)
    puts "Sup #{l2.nSupplies}, nWeapons #{l2.nWeapons}, nShields #{l2.nShields}, nHangars #{l2.nHangars} ,nMedals #{l2.nMedals}"
  
     #ShieldBooster
     s1 = ShieldBooster.new("victor", 2.3, 5)
     s2 = ShieldBooster.new("Maxi",5, -9)
     puts "S1: #{s1}"
     puts "boost #{s2.boost}, uses #{s2.uses}"     
     puts "Useit boost #{s2.useIt}, uses #{s2.uses}"
     
    s3 =  ShieldBooster.newCopy(s1)
    puts "Copiad -> boost #{s3.boost}, uses #{s3.uses}"
    
    #SuppliesPackage
    puts "\nSuppliesPackage:"
    p1 = SuppliesPackage.new(1.1,2.2,3.3)
    p2 = SuppliesPackage.newCopy(p1)
    puts "ammoPower #{p1.ammoPower}, fuelUnits #{p1.fuelUnits}, shieldPower #{p1.shieldPower}"     
    puts "Copia -> ammoPower #{p2.ammoPower}, fuelUnits #{p2.fuelUnits}, shieldPower #{p2.shieldPower}"
  
    #Weapon 
    puts "\nWeapon:" 
    w1 = Weapon.new("hola", WeaponType::LASER, 5)
    w2 = Weapon.new("que", WeaponType::MISSILE, 6)
    w3 = Weapon.new("tal", WeaponType::PLASMA, 7)
    w4 = Weapon.newCopy(w3)
    puts "#{w1.type.power}"
    
    puts "Tipo #{w1.type} usos #{w1.uses}"
    puts "Tipo #{w2.type} usos #{w2.uses}" 
    puts "Tipo #{w3.type} usos #{w3.uses}"
    puts "Useit: #{w4.useIt}, usos #{w4.uses} "
    puts "Copia -> Tipo #{w4.type} usos #{w4.uses}"
    
    d1 = Dice.new
    hangars = 0
    weapons = [0,0,0]
    shields = 0
    
    10000.times do
      hangars += d1.initWithNHangars
      weapons[d1.initWithNWeapons - 1] += 1
      shields += d1.initWithShields      
    end
    
    puts "Shot: #{d1.firstShot}, WhoStarts: #{d1.whoStarts(8)}"
    
    puts "Hangars: #{hangars},weapons(1,2,3) #{weapons[0]}-#{weapons[1]}-#{weapons[2]}, shields #{shields} "
  end
end

d = TestP1.new
d.main

end
