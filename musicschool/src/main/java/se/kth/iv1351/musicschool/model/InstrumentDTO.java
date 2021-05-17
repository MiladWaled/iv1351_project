package main.java.se.kth.iv1351.musicschool.model;

/**
 * This class represents an instrument DTO
 * @author milad
 *
 */
public class InstrumentDTO {
	private int id;
	private int price;
	private String type;
	
	/**
	 * Instructor for the DTO. 
	 * @param id The instrument ID
	 * @param price The instrument price
	 * @param type The instrument type. 
	 */
	public InstrumentDTO(int id, int price, String type) {		
		
		this.id = id;
		this.price = price;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	
	public int getPrice() {
		return price;
	}

	public String getType() {
		return type;
	}
}
