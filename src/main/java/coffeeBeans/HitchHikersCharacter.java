/* Daniel Preller, 2 July 2026, Assignment 4
 * JavaBean representing a character from The Hitchhiker's Guide to the Galaxy
 */

package coffeeBeans;// Package named to match example in course videos to hopefully make it easier to test

import java.io.Serializable;

public class HitchHikersCharacter implements Serializable {
	private String name;
	private String homePlanet;
	private String species;
	private int heads;
	
	public HitchHikersCharacter() {
		name = "None";
		homePlanet = "None";
		species = "None";
		heads = 1;
	}
	
	public HitchHikersCharacter(String name, String homePlanet, String species, int heads) {
		this.name = name;
		this.homePlanet = homePlanet;
		this.species = species;
		this.heads = heads;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setHomePlanet(String homePlanet) {
		this.homePlanet = homePlanet;
	}
	
	public void setSpecies(String species) {
		this.species = species;
	}
	
	public void setHeads(int heads) {
		this.heads = heads;
	}
	
	public String getName() {
		return name;
	}
	
	public String getHomePlanet() {
		return homePlanet;
	}
	
	public String getSpecies() {
		return species;
	}
	
	public int getHeads() {
		return heads;
	}

}