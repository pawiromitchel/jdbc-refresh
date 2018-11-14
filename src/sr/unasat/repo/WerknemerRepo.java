package sr.unasat.repo;
import sr.unasat.entities.Werknemer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WerknemerRepo {
    private Connection connect;

    public WerknemerRepo() {
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

    public List<Werknemer> selectAll() {
        List<Werknemer> outputList = new ArrayList();
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Construeer een statement voor het uitvoeren van een SQL Query
            statement = connect.createStatement();
            // Voer de SQL statement uit en verzamel de output in de resultset
            resultSet = statement.executeQuery("select * from werknemer");

            while (resultSet.next()) {
                Werknemer werknemer = new Werknemer();

                int id = resultSet.getInt("id");
                String voornaam = resultSet.getString("voornaam");
                String achternaam = resultSet.getString("achternaam");
                String extensie = resultSet.getString("extensie");
                String telefoon = resultSet.getString("telefoon");
                int afdeling = resultSet.getInt("afdeling");
                int functie = resultSet.getInt("functie");

                // Maak een student instantie en print deze instantie
                werknemer.setId(id);
                werknemer.setVoornaam(voornaam);
                werknemer.setAchternaam(achternaam);
                werknemer.setExtensie(extensie);
                werknemer.setTelefoon(telefoon);

                if(afdeling > 0){
                    werknemer.setAfdeling(new AfdelingRepo().selectRecord(afdeling));
                }

                if(functie > 0){
                    werknemer.setFunctie(new FunctieRepo().selectRecord(functie));
                }

                outputList.add(werknemer);
            }
        } catch (SQLException e) {
            System.out.println("Er is een SQL fout ontstaan tijdens de select * statement!");
        }

        return outputList;
    }
}
