package main.java.se.kth.iv1351.musicschool.view;

import java.util.List;
import java.util.Scanner;

import main.java.se.kth.iv1351.musicschool.controller.Controller;
import main.java.se.kth.iv1351.musicschool.model.InstrumentDTO;
/**
 * This class is based on Leif Lindbäck JDCB-bank example. 
 * The class reads and interprets user commands. This command interpreter is blocking, the user
 * interface does not react to user input while a command is being executed. 
 *
 */
public class BlockingInterpreter {
	private static final String PROMPT = "> ";
    private final Scanner console = new Scanner(System.in);
    private Controller ctrl;
    private boolean keepReceivingCmds = false;
    
    /**
     * Creates a new instance that uses the specified controller
     * for all operations. 
     * @param ctrl
     */
    public BlockingInterpreter (Controller ctrl) {
    	this.ctrl = ctrl;
    }
    
    /**
     * Stops the commend interpreter.
     */
    public void stop() {
        keepReceivingCmds = false;
    }
    
    /**
     * Interprets and performs user commands. This method will not return until the
     * UI has been stopped. The UI is stopped either when the user gives the "quit"
     * command, or when the method <code>stop()</code> is called.
     */
    public void handleCmds() {
    	keepReceivingCmds = true; 
    	while (keepReceivingCmds) {
    		try {
    			CmdLine cmdLine = new CmdLine(readNextLine());
    			switch (cmdLine.getCmd()) {
    			case HELP:
    				System.out.println("Available options: ");
    				System.out.println("**list can also be specified by type of instrument** ");
    				System.out.println("****************");

    				for (Command command : Command.values()) {
    					if (command == Command.ILLEGAL_COMMAND) {
    						continue;
    					}
    					System.out.println(command.toString().toLowerCase());
    				}
    				break;
    			case QUIT: 
    				keepReceivingCmds = false; 
    				break;
    			
    			case LIST: 
    				List <? extends InstrumentDTO> instruments = null;
    				if (cmdLine.getParameter(0).equals("")) {
    					instruments = ctrl.retriveRentableInstruments();
    				} else {
    					instruments = ctrl.retriveRentableInstrumentsByType(cmdLine.getParameter(0));
    				}
    				
    				for (InstrumentDTO instrument : instruments) {
    					System.out.println("Instrument type: " + instrument.getType() +", "
    							+ "Instrument ID: " + instrument.getId() + ", "
    							+ "Price: " + instrument.getPrice());
    				}
    				break;
    			
    			case RENT: 
    				System.out.println(ctrl.rentInstrumentByStudentID(Integer.parseInt(cmdLine.getParameter(0)), 
    						Integer.parseInt(cmdLine.getParameter(1))));
    				break;
    				
    			case TERMINATE: 
    				System.out.println(ctrl.terminateRental(Integer.parseInt(cmdLine.getParameter(0)), 
    						Integer.parseInt(cmdLine.getParameter(1))));
    			default: 
    				System.out.println("Illegal command");
    			}
    		} catch (Exception exc) {
    			System.out.println("Failed to perform the operation");
    			System.out.println(exc.getMessage());
    			exc.printStackTrace();
    		}
    	}
    }
    
    private String readNextLine() {
        System.out.print(PROMPT);
        return console.nextLine();
    }
}
