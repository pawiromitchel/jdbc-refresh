package sr.unasat.app;

import sr.unasat.entities.Rol;
import sr.unasat.repo.RolRepo;

import java.util.List;

public class App {
    public static void main(String[] args) {
        RolRepo rolRepo = new RolRepo();
        rolRepo.selectAll().forEach(rol -> System.out.println(rol.getNaam()));
    }
}
