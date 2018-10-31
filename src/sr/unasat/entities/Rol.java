package sr.unasat.entities;

public class Rol {
    private int id;
    private String naam;

    public Rol(int id, String naam) {
        this.id = id;
        this.naam = naam;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }
}
