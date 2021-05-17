package main.java.se.kth.iv1351.musicschool.view;


/**
 * Defines all commands that can be performed by a user of the this application.
 */
public enum Command {

	 /**
     * List all rentable instruments.
     */
	LIST, 
    /**
     * Rent an available instruments with a specific student ID .
     */
    RENT, 
    /**
     * Terminate rental with specific student ID and instrument ID.
     */
    TERMINATE, 
    /**
     * Quit the application.
     */
    QUIT, 
    /**
     * Lists all commands and how to use them. 
     */
    HELP, 
    /**
     * None of the valid commands above was specified.
     */
    ILLEGAL_COMMAND

}
