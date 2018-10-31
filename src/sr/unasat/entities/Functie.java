package sr.unasat.entities;

public class Functie {
    private int id;
    private String naam;

    public Functie(int id, String naam) {
        this.id = id;
        this.naam = naam;
    }

    public Functie() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }
}
