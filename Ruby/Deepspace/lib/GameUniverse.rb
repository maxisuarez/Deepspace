#encoding:utf-8
require_relative 'Dice'
require_relative 'GameUniverseToUI'

module Deepspace
class GameUniverse

  @@WIN = 10

  attr_reader :gameState

  def initialize
    @turns = 0
    @currentStationIndex = 0
    @dice = Dice.new
    @gameState = GameStateController.new
    @currentEnemy =  nil
    @spaceStations = []
    @currentStation = nil
  end

  def haveAWinner
    @currentStation.nMedals >= @@WIN
  end

  def getUIversion
    GameUniverseToUI.new(self)
  end

  def discardHangar
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardHangar
    end
  end

  def discardShieldBooster(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardShieldBooster(i)
    end
  end

  def discardShieldBoosterInHangar(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardShieldBoosterInHangar(i)
    end
  end

  def discardWeapon(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardWeapon(i)
    end
  end

  def discardWeaponInHangar(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardWeaponInHangar(i)
    end
  end

  def mountShieldBooster(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.mountShieldBooster(i)
    end
  end

  def mountWeapon(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.mountWeapon(i)
    end
  end

  #Proxima practica
  def init(names)

  end

  def nextTurn

  end

  def to_s
      return "\nIndex: #{@currentStationIndex} + Turns: #{@turns}"
   end

end
end
