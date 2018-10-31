package sr.unasat.entities;

public class Afdeling {

    private int id;
    private String naam;

    public Afdeling(int id, String naam) {
        this.id = id;
        this.naam = naam;
    }

    public Afdeling() {
    }

    public String getNaam() {
        return naam;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }
}
