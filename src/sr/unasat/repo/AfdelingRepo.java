package sr.unasat.repo;

import sr.unasat.entities.Afdeling;
import sr.unasat.entities.Rol;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AfdelingRepo {
    private Connection connect;

    public AfdelingRepo() {
        initialize();
    }

    public void initialize() {
        try {
            // Onderstaande zoekt de juist class op uit de library en laad het in JVM
            Class.forName("com.mysql.jdbc.Driver");
            // De connectie wordt vervolgens gemaakt naar de database middels de juiste authenticatie
            connect = DriverManager.getConnection("jdbc:mysql://localhost/jdbc_refresh?user=root&password=");
        } catch (ClassNotFoundException e) {
            System.out.println("De class is niet gevonden!");
        } catch (SQLException e) {
            System.out.println("Er is een SQL fout ontstaan!");
            e.printStackTrace();
        }
    }

    public boolean isInitialised() {
        if (connect != null) {
            return true;
        }
        return false;
    }

    public List<Afdeling> selectAll() {

        List<Afdeling> outputList = new ArrayList();
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Construeer een statement voor het uitvoeren van een SQL Query
            statement = connect.createStatement();
            // Voer de SQL statement uit en verzamel de output in de resultset
            resultSet = statement.executeQuery("select * from afdeling");

            while (resultSet.next()) {

                int id = resultSet.getInt("id");
                String naam = resultSet.getString("naam");

                Afdeling afdeling = new Afdeling(id, naam);

                outputList.add(afdeling);
            }
        } catch (SQLException e) {
            System.out.println("Er is een SQL fout ontstaan tijdens de select * statement!");
        }

        return outputList;
    }

    public Afdeling selectRecord(int recordId) {

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Afdeling afdeling = new Afdeling();

        try {
            // Statements allow to issue SQL queries to the database
            preparedStatement = connect.prepareStatement("select * from afdeling where id = ?");
            // Result set get the result of the SQL query
            preparedStatement.setInt(1, recordId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                // It is possible to get the columns via name
                // also possible to get the columns via the column number
                // which starts at 1
                // e.g. resultSet.getSTring(2);

                int id = resultSet.getInt("id");
                String naam = resultSet.getString("naam");

                // Maak een student instantie en print deze instantie
                afdeling.setId(id);
                afdeling.setNaam(naam);

                System.out.println(afdeling);
            }
        } catch (SQLException e) {
            System.out.println("Er is een SQL fout ontstaan tijdens de select statement!");
        }

        return afdeling;
    }
}
