package main.java.se.kth.iv1351.musicschool.startup;
import main.java.se.kth.iv1351.musicschool.controller.Controller;
import main.java.se.kth.iv1351.musicschool.integration.RentalDBException;
import main.java.se.kth.iv1351.musicschool.view.BlockingInterpreter;

	/**
	 * This is where we start the client. 
	 *
	 */
public class Main {

	public static void main(String[] args) {
		 try {
		        new BlockingInterpreter(new Controller()).handleCmds();
		        } catch(RentalDBException bdbe) {
		            System.out.println("Failed to connect to the Rental db.");
		            bdbe.printStackTrace();
		        }
		    }

}
