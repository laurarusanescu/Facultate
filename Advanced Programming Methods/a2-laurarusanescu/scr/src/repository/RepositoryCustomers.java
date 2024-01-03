package repository;

import domain.Customer;

import java.util.ArrayList;

public class RepositoryCustomers extends MemoryRepository<Customer, Integer> {
    public ArrayList<Customer> customers = new ArrayList<>();

    public void addCustomer(Customer c){
        customers.add(c);
    }

    public ArrayList<Customer> getCustomers(){return this.customers;}

}
