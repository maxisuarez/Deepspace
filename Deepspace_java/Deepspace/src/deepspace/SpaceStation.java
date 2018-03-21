/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import java.util.ArrayList;
import java.util.function.Predicate;

/**
 *
 * @author victor
 */
public class SpaceStation {
    private static int MAXFUEL = 100; 
    private static float SHIELDLOSSPERUNITSHOT = 0.1f;
    
    private float ammoPower, fuelUnits, shieldPower;
    private int nMedals;
    private String name;
    private Damage pendingDamage;
    private ArrayList<Weapon> weapons;
    private ArrayList<ShieldBooster> shieldBoosters;
    private Hangar hangar;
    
    
    SpaceStation(String n, SuppliesPackage s) {
        name = n;
        ammoPower = s.getAmmoPower();
        fuelUnits = s.getFuelUnits();
        shieldPower = s.getShieldPower();
    }
    private void assignFuelValue(float f) {
      if(f<=  MAXFUEL)
        fuelUnits = f;
    } 
    
    
    private void cleanPendingDamage(){
        if(pendingDamage.hasNoEffect())
             pendingDamage = null;
    }
    
    SpaceStationToUI getUIversion() {
        return new SpaceStationToUI(this);
    }

    public float getAmmoPower() {
        return ammoPower;
    }

    public float getFuelUnits() {
        return fuelUnits;
    }

    public float getShieldPower() {
        return shieldPower;
    }

    public int getNMedals() {
        return nMedals;
    }

    public String getName() {
        return name;
    }

    public Damage getPendingDamage() {
        return pendingDamage;
    }

    public ArrayList<Weapon> getWeapons() {
        return weapons;
    }

    public ArrayList<ShieldBooster> getShieldBoosters() {
        return shieldBoosters;
    }

    public Hangar getHangar() {
        return hangar;
    }
       
    public void discardHangar() {
      hangar = null;             
    }
    
    public boolean receiveShieldBooster(ShieldBooster s) {
        if(hangar != null)
            return hangar.addShieldBooster(s);
               
        return false;
    }
    
    public boolean receiveWeapon(Weapon w) {
        if(hangar != null)
            return hangar.addWeapon(w);
               
        return false;
    }
    
    public void receiveHangar(Hangar h) {
        if(hangar != null)
            hangar = h;
    }
    
    public void receiveSupplies(SuppliesPackage s) {
        ammoPower += s.getAmmoPower();
        shieldPower += s.getShieldPower();
        if(fuelUnits + s.getFuelUnits() <= MAXFUEL)
            fuelUnits += s.getFuelUnits();
        else
             fuelUnits = MAXFUEL;
    }
    
    public void setPendingDamage(Damage d) {
        pendingDamage = d;
    }
    
    public void mountWeapon(int i) {
        if(hangar != null)
            weapons.add(hangar.removeWeapon(i));
    }
    
    public void mountShieldBooster(int i) {
        if(hangar != null)
            shieldBoosters.add(hangar.removeShieldBooster(i));
    }
    
    public void discardWeaponInHangar(int i) {
        if(hangar != null)
           hangar.removeWeapon(i);
    }
    
    public void discardShieldBoosterInHangar(int i) {
        if(hangar != null)
           hangar.removeShieldBooster(i);
    }
    
    public float getSpeed() {
        return fuelUnits / MAXFUEL;        
    }
    
    public void move() {
        fuelUnits -= getSpeed() * fuelUnits;
    }
    
    public boolean validState() {
        return pendingDamage == null || pendingDamage.hasNoEffect();
    }
    
    public void cleanUpMountedItems() {
      //ESTO PUEDE QUE NO FUNCIONE ASÍ
      Predicate<Weapon> weaponPredicate;
        weaponPredicate = (w-> w.getUses() == 0);
      weapons.removeIf(weaponPredicate);
      
      Predicate<ShieldBooster> shieldPredicate;
        shieldPredicate = (s-> s.getUses() == 0);
      shieldBoosters.removeIf(shieldPredicate);      
    }
    
    public float fire() { throw new UnsupportedOperationException(); }
    public float protection() { throw new UnsupportedOperationException(); }
    public ShotResult receiveShot(float shot) { throw new UnsupportedOperationException(); }
    public void setLoot(Loot loot) { throw new UnsupportedOperationException(); }
    public void discardWeapon(int i) { throw new UnsupportedOperationException(); }
    public void discardShieldBooster(int i) { throw new UnsupportedOperationException(); }
    
    
    
    
    
    
    
    
    
    
    
    
}
