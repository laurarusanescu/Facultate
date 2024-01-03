import UI.UI;
import domain.Car;
import domain.Customer;
import exceptions.DuplicateItemException;
import exceptions.ItemNotFound;
import repository.*;
import service.Service;

import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class Main {
public static <IRepository> void main(String[] args) {
    IRepository repoCar = null;
    IRepository repoCustomer = null;
    try (FileReader fr = new FileReader("settings.properties")) {
        Properties props = new Properties();
        props.load(fr);

        String repoType = props.getProperty("repositoryType");
        String sourceNameCars = props.getProperty("carRepositoryLocation");
        String sourceNameCustomer = props.getProperty("customerRepositoryLocation");
        switch (repoType) {
            case "inmemory":
                CarRepository repositoryCars = new CarRepository();
                CustomerRepository repositoryCustomers = new CustomerRepository();
                Service service = new Service(repositoryCars, repositoryCustomers);
                UI ui = new UI(service);
                service.addCustomer("Laura", 07743217);
                service.addCustomer("Andrei", 07743227);
                service.addCustomer("Vlad", 07743317);
                service.addCar("Dacia1", 5, 2020, 250);
                service.addCar("Volskwagen", 4, 2019, 200);
                service.addCar("Seat", 4, 2021, 200);
                service.addCar("Dacia2", 5, 2020, 250);
                service.addCar("Mini Cooper", 4, 2015, 200);
                ui.printMenu();
                ui.run();
            case "textfile":
                repoCar = (IRepository) new CarRepositoryTextFile(sourceNameCars);
                repoCustomer = (IRepository) new CustomerRepositoryTextFile(sourceNameCustomer);
                break;
            case "binaryfile":
                repoCar = (IRepository) new CarRepositoryBinaryFile(sourceNameCars);
                repoCustomer = (IRepository) new CustomerRepositoryBinaryFile(sourceNameCustomer);
                break;
        }
    } catch (IOException e) {
        throw new RuntimeException(e);
    } catch (exceptions.DuplicateItemException e) {
        throw new RuntimeException(e);
    } catch ( exceptions.ItemNotFound e) {
        throw new RuntimeException(e);
    }
}
}