import JDBC.CarDBRepository;
import JDBC.CustomerDBRepository;
import domain.Car;
import domain.Customer;
import exceptions.DuplicateItemException;
import exceptions.ItemNotFound;
import repository.*;
import service.Service;
import UI.UI;

import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class Main {
    public static void main(String[] args) throws SQLException {
        CustomerDBRepository customerRepo = new CustomerDBRepository("Customers");
        CarDBRepository carRepo = new CarDBRepository("Cars");
        customerRepo.addItem(new Customer(7, "aaaaaa", 0765456));
        carRepo.addItem(new Car(8, "AAAAAA", 4, 2023, 300));
        customerRepo.getAllItems();
        customerRepo.getAllItems();
    }

}
