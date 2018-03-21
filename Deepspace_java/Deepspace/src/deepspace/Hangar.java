
package deepspace;
import java.util.ArrayList;

/**
 *
 * @author victor
 */
public class Hangar {
    private int maxElements;
    private ArrayList<ShieldBooster> shieldBoosters;
    private ArrayList<Weapon> weapons;
    
    Hangar(int capacity){
        maxElements=capacity;
    }
    
    Hangar(Hangar copy){
        maxElements = copy.maxElements;
        shieldBoosters = copy.shieldBoosters;
        weapons = copy.weapons;
    }

    public int getMaxElements() {
        return maxElements;
    }

    public ArrayList<ShieldBooster> getShieldBoosters() {
        return shieldBoosters;
    }

    public ArrayList<Weapon> getWeapons() {
        return weapons;
    }
    
    HangarToUI getUIversion(){
        return new HangarToUI(this);
    }
    
    private boolean spaceAvailable(){
        return shieldBoosters.size() + weapons.size() < maxElements;
    }
    
    public boolean addWeapon(Weapon w){
        if( spaceAvailable() ){
            weapons.add(w);
            return true;
        } else
            return false;              
    }
    
    public boolean addShieldBooster(ShieldBooster w){
        if( spaceAvailable() ){
            shieldBoosters.add(w);
            return true;
        } else
            return false;              
    }
    
   public Weapon removeWeapon(int w){
       return weapons.remove(w);          
    }
   
    public ShieldBooster removeShieldBooster(int s){
       return shieldBoosters.remove(s);
    }
   
    
   
    
}
