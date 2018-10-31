package sr.unasat.entities;

import java.util.List;

public class Werknemer {
    private int id;
    private String voornaam, achternaam, extensie, telefoon;
    private Afdeling afdeling;
    private Functie functie;
    private List<Rol> rol;

    public Werknemer(int id, String voornaam, String achternaam, String extensie, String telefoon, Afdeling afdeling, Functie functie, List<Rol> rol) {
        this.id = id;
        this.voornaam = voornaam;
        this.achternaam = achternaam;
        this.extensie = extensie;
        this.telefoon = telefoon;
        this.afdeling = afdeling;
        this.functie = functie;
        this.rol = rol;
    }

    public String getVoornaam() {
        return voornaam;
    }

    public void setVoornaam(String voornaam) {
        this.voornaam = voornaam;
    }

    public String getAchternaam() {
        return achternaam;
    }

    public void setAchternaam(String achternaam) {
        this.achternaam = achternaam;
    }

    public String getExtensie() {
        return extensie;
    }

    public void setExtensie(String extensie) {
        this.extensie = extensie;
    }

    public String getTelefoon() {
        return telefoon;
    }

    public void setTelefoon(String telefoon) {
        this.telefoon = telefoon;
    }

    public Afdeling getAfdeling() {
        return afdeling;
    }

    public void setAfdeling(Afdeling afdeling) {
        this.afdeling = afdeling;
    }

    public Functie getFunctie() {
        return functie;
    }

    public void setFunctie(Functie functie) {
        this.functie = functie;
    }

    public List<Rol> getRol() {
        return rol;
    }

    public void setRol(List<Rol> rol) {
        this.rol = rol;
    }
}
