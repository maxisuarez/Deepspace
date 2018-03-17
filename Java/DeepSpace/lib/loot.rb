#encoding:utf-8

class Loot
  attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals 
  
  def initialize(nSupplies, nWeapons, nShields, nHangars,nMedals)
    @nSupplies = nSupplies
    @nWeapons = nWeapons
    @nShields = nShields
    @nHangars = nHangars
    @nMedals = nMedals    
  end
  
  
end
