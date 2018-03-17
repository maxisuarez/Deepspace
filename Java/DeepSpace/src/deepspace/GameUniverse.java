/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;
import java.util.ArrayList;

/**
 *
 * @author victor
 */
public class GameUniverse {
    private static int WIN = 10;
    private int currentStationIndex = 0;
    private int turns = 0;
    private Dice dice;
    private GameStateController gameState;
    private SpaceStation currentStation;
    private ArrayList<SpaceStation> spaceStations;
    private EnemyStarShip currentEnemy;
    
    public boolean haveAWinner() {
        return currentStation.getNMedals() >= WIN;
    }
    
    public void discardHangar() {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.discardHangar();
    }
    
    public void discardWeapon(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.discardWeapon(i);
    }
    
    public void discardShieldBooster(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.discardShieldBooster(i);
    }
    
    public void discardShieldBoosterInHangar(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.discardShieldBoosterInHangar(i);
    }
    
    public void discardWeaponInHangar(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.discardWeaponInHangar(i);
    }
    
    public void mountWeapon(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.mountWeapon(i);
    }
    
    public void mountShieldBooster(int i) {
       if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT)
        currentStation.mountShieldBooster(i);
    }
    
    public  void init(ArrayList<String> names){ throw new UnsupportedOperationException(); }
    public boolean nextTurn(){ throw new UnsupportedOperationException(); }
    public CombatResult combat(){ throw new UnsupportedOperationException(); }
    public CombatResult combat(SpaceStation station,EnemyStarShip enemy){ throw new UnsupportedOperationException(); }
    
    
    
    
}
