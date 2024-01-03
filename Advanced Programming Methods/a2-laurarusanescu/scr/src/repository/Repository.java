package repository;

import domain.Customer;

import java.util.ArrayList;

public class Repository {
    public ArrayList<Customer> listOfCustomers = new ArrayList<>();

    public void addCustomer(Customer c){
        listOfCustomers.add(c);}

    public Customer getCustomerByID(int id){
        for(Customer customer: listOfCustomers){
            if(customer.getId()==id)
                return customer;
        }
        return null;
    }

    public void updateCustomer(Customer c){
        for(Customer customer: listOfCustomers){
            if(customer.getId()== c.getId()){
                listOfCustomers.set(listOfCustomers.indexOf(customer), c);
            }
        }
    }
    public ArrayList<Customer> getAllCustomers(){return this.listOfCustomers;}

    public void deleteCustomerByID(int id){
        for(Customer customer:listOfCustomers){
            if(customer.getId()==id){
                listOfCustomers.remove(customer);
                break;
            }
        }
    }
}
