package repository;
import domain.Customer;
import org.junit.jupiter.api.Test;
import repository.CustomerRepository;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class CustomerRepositoryTest {

    @Test
    public void testAddCustomer() {
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = new Customer(1, "John Doe", 123456789);

        customerRepository.addCustomer(customer);

        ArrayList<Customer> customers = customerRepository.getAllCustomers();
        assert customers.size() == 1;
        assert customers.get(0).equals(customer);
    }

    @Test
    public void testGetCustomerByID() {
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = new Customer(1, "John Doe", 123456789);

        customerRepository.addCustomer(customer);

        Customer retrievedCustomer = customerRepository.getCustomerByID(1);

        assert retrievedCustomer != null;
        assert retrievedCustomer.equals(customer);
    }

    @Test
    public void testUpdateCustomer() {
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = new Customer(1, "John Doe", 123456789);

        customerRepository.addCustomer(customer);

        Customer updatedCustomer = new Customer(1, "Jane Doe", 987654321);
        customerRepository.updateCustomer(updatedCustomer);

        ArrayList<Customer> customers = customerRepository.getAllCustomers();
        assert customers.size() == 1;
        assert customers.get(0).equals(updatedCustomer);
    }

    @Test
    public void testDeleteCustomerByID() {
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = new Customer(1, "John Doe", 123456789);

        customerRepository.addCustomer(customer);

        customerRepository.deleteCustomerByID(1);

        ArrayList<Customer> customers = customerRepository.getAllCustomers();
        assert customers.isEmpty();
    }

}