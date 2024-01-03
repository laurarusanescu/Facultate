import UI.UI;
import exceptions.DuplicateItemException;
import exceptions.ItemNotFound;
import repository.RepositoryCars;
import repository.RepositoryCustomers;
import service.Service;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) throws DuplicateItemException, ItemNotFound {
        RepositoryCars repositoryCars = new RepositoryCars();
        RepositoryCustomers repositoryCustomers= new RepositoryCustomers();
        Service service = new Service(repositoryCars, repositoryCustomers);
        UI ui = new UI(service);
        service.addCustomer(1, "Laura", 07743217);
        service.addCustomer(2, "Andrei", 07743227);
        service.addCustomer(3, "Vlad", 07743317);
        service.addCar("Dacia1", 5,2020, 250);
        service.addCar("Volskwagen", 4,2019, 200);
        service.addCar("Seat", 4,2021, 200);
        service.addCar("Dacia2", 5,2020, 250);
        service.addCar("Mini Cooper", 4, 2015, 200);
        ui.printMenu();
        ui.run();
    }
}