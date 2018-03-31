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
    GameUniverseToUI.new(@currentStation, @currentEnemy)
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
      state = @gameState.state

      if state == GameState::CANNOTPLAY
        dealer = CardDealer.getInstance

        for i in 1..names.length
          supplies = dealer.nextSuppliesPackage
          station = SpaceStation.new(names[i-1], supplies)
          nh = @dice.initWithNHangars
          nw = @dice.initWithNWeapons
          ns = @dice.initWithShields
          l = Loot.new(0, nw, ns, nh, 0)
          station.setLoot(l)
          @spaceStations.push(station)
        end

        @currentStationIndex = @dice.whoStarts(names.length)
        @currentStation = @spaceStations[@currentStationIndex]
        @currentEnemy = dealer.nextEnemy

        @gameState.next(@turns, @spaceStations.size)

        end
     end

    def nextTurn
      gameState = @gameState.state

      if gameState == GameState::AFTERCOMBAT
        stationState = @currentStation.validState
        if stationState
          @currentStationIndex = (@currentStationIndex+1) % @spaceStations.size
          @turns += 1

          @currentStation = @spaceStations[@currentStationIndex]
          @currentStation.cleanUpMountedItems
          dealer = CardDealer.new
          @currentEnemy = dealer.nextEnemy
          @gameState.next(@turns, @spaceStations.size)

          return true
        end
        return false
      end
      return false
    end

    def combat
      state = @gameState.state

      if state == GameState::BEFORECOMBAT || state == GameState::init
        combatGo(@currenStation, @currentEnemy)
        ch = @dice.firstShot
        if ch == GameCharacter::ENEMYSTARSHIP
          fire = @currentEnemy.fire
          result = @currentStation.receiveShot(fire)

          if result == ShotResult::RESIST
            fire = @currentStation.fire
            result = @currentEnemy.receiveShot(fire)
            enemyWins = (result == ShotResult::RESIST)
          else
            enemyWins = true
          end
        else
          fire = @currentStation.fire
          result = @currentEnemy.receiveShot(fire)
          enemyWins = (result == ShotResult::RESIST)
        end

        if enemyWins
          s = @currentStation.getSpeed
          moves = @dice.spaceStationMoves(s)
          if !moves
            damage = @currentEnemy.damage
            @currentStation.setPendingDamage(damage)
            combatResult = CombatResult::ENEMYWINS
          else
            @currentStation.move
            combatResult = CombatResult::STATIONSCAPES
          end
        else
          aLoot = @currentEnemy.loot
          @currentStation.setLoot(aLoot)
          combatResult = CombatResult::STATIONWINS
        end

        @gameState.next(@turns, @spaceStations.size)

        return combatResult
      else
        return CombatResult::NOCOMBAT
      end
    end

  def to_s
      return "\nIndex: #{@currentStationIndex} + Turns: #{@turns}"
   end

end
end
