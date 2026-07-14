/* Daniel Preller, 14 July 2026, Assignment 7
 * JavaBean for accessing a library database, including table creation, population, and deletion
 * Also includes access methods such as returning all columns, returning a book by ID, and returning all book IDs
 */

package coffeeBeans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

public class DBBean implements Serializable {
	
	private String database;
	private String username;
	private String password;
	
	// Objects used for database interaction, created with methods external to the constructor
	private Connection connection;
	private Statement statement;
	
	// No argument constructor
	// Default values are default database values used for the assignment
	public DBBean() {
		database = "CSD430";
		username = "student1";
		password = "pass";
	}
	
	// Constructor to set all fields
	public DBBean(String database, String username, String password) {
		this.database = database;
		this.username = username;
		this.password = password;
	}
	
	// Set methods
	public void setDatabase(String database) {
		this.database = database;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	// Get methods
	public String getDatabase() {
		return database;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
	
	// Other methods
	
	// Returns a string that has had all HTML special characters replaced with HTML entities
	public String escapeHTML(String string) {
		return string.replace("&", "&amp").replace("<", "&lt").replace(">", "&gt").replace("'", "&#039").replace("\"", "&quot");
	}
	
	// Sets the specified string to null if it is empty; otherwise keeps it the same
	// Used for inserting blank strings as null values
	public String nullIfEmpty(String string) {
		if (string.isEmpty()) {
			return null;
		} else {
			return string;
		}
	}
	
	// Connects to database, setting the connection and statement objects in the process
	public String connectToDatabase() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost", username, password);
			statement = connection.createStatement();
			statement.executeUpdate("USE " + database);
			return "Connected to Database";
		} catch (Exception e) {
			return "Unable to connect to database";
		}
	}
	
	// Creates the table
	public String createTable() {
		String tableCreationString = """
				CREATE TABLE daniel_library_data (
					BookID int AUTO_INCREMENT PRIMARY KEY ,
					Title varchar(255) NOT NULL,
					Author varchar(255),
					Series varchar(255),
					ReleaseYear int -- int is used instead of year to allow books written before 1901
					);
				""";
		try {
			statement.executeUpdate("DROP TABLE IF EXISTS daniel_library_data;");
			statement.executeUpdate(tableCreationString);
			return "Table Created";
		} catch(Exception e) {
			return "An error occurred accessing the database";
		}
	}
	
	//Populates table from arrays
	public String populateTable() {
		String[] titles = {"The Hitchhiker\\'s Guide to the Galaxy", "The Restaurant at the End of the Universe", "Life, the Universe, and Everything",
				"So Long, and Thanks for All the Fish", "Mostly Harmless", "Twenty Thousand Leagues Under the Sea",
				"Harry Potter and the Sorcerer\\'s Stone", "Harry Potter and the Chamber of Secrets", "Harry Potter and the Prisoner of Azkaban",
				"Harry Potter and the Goblet of Fire", "Harry Potter and the Order of the Phoenix", "Harry Potter and the Half-Blood Prince",
				"Harry Potter and the Deathly Hallows"};
		String[] authors = {"Douglas Adams", "Douglas Adams", "Douglas Adams", "Douglas Adams", "Douglas Adams", "Jules Verne", "J.K. Rowling",
				"J.K. Rowling", "J.K. Rowling", "J.K. Rowling", "J.K. Rowling", "J.K. Rowling", "J.K. Rowling"};
		String[] series = {"The Hitchhiker\\'s Guide to the Galaxy", "The Hitchhiker\\'s Guide to the Galaxy", "The Hitchhiker\\'s Guide to the Galaxy",
				"The Hitchhiker\\'s Guide to the Galaxy", "The Hitchhiker\\'s Guide to the Galaxy", "Twenty Thousand Leagues Under the Sea", "Harry Potter",
				"Harry Potter", "Harry Potter", "Harry Potter", "Harry Potter", "Harry Potter", "Harry Potter"};
		int[] years = {1979, 1980, 1982, 1984, 1992, 1870, 1997, 1998, 1999, 2000, 2003, 2005, 2007};
		
		try {
			// Adds all books as a batch transaction
			for (int i = 0; i < titles.length; i++) {
				statement.addBatch("INSERT INTO daniel_library_data (Title, Author, Series, ReleaseYear) "
						+ "VALUES ('" + titles[i] + "', '" + authors[i] + "', '" + series[i] + "', " + years[i] + ");");
			}
			statement.executeBatch();
			return "Table populated";
		} catch (Exception e) {
			return "An error occurred accessing the database";
		}
	}
	
	// Drops the table
	public String dropTable() {
		try {
			statement.execute("DROP TABLE IF EXISTS daniel_library_data;");
			return "Table Dropped";
		} catch(Exception e) {
			return "An Error occurred accessing the database";
		}
	}
	
	// Returns a ResultSet containing all the book IDs in the table
	// Throws an SQLException if an SQL error occurs (such as table not created)
	public ResultSet getTableIDs() throws SQLException {
		return statement.executeQuery("SELECT BookID FROM daniel_library_data");
	}
	
	// Returns a ResultSet containing the information for one book based on the provided ID
	public ResultSet getBookByID(int id) throws SQLException {
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM daniel_library_data WHERE BookID = ?");
		preparedStatement.setInt(1, id);
		return preparedStatement.executeQuery();
	}
	
	// Returns a ResultSet containing all records in the table
	public ResultSet getAllBooks() throws SQLException {
		return statement.executeQuery("SELECT * FROM daniel_library_data;");
	}
	
	// Updates the table with a new book, taking all non-automatic columns as arguments
	// Throws an SQL exception if an SQL error occurs, such as invalid input
	public void addBook(String title, String author, String series, String releaseYear) throws SQLException, NumberFormatException {
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO daniel_library_data (Title, Author, Series, ReleaseYear) VALUES (?, ?, ?, ?);");
		preparedStatement.setString(1, nullIfEmpty(escapeHTML(title)));
		preparedStatement.setString(2, nullIfEmpty(escapeHTML(author)));
		preparedStatement.setString(3, nullIfEmpty(escapeHTML(series)));
		
		if (releaseYear.isBlank()) {// Inserts the year or a null column depending on whether the string is empty
			preparedStatement.setNull(4, Types.INTEGER);
		} else {
			preparedStatement.setInt(4, Integer.parseInt(releaseYear));
		}		
		
		preparedStatement.executeUpdate();
	}
}
