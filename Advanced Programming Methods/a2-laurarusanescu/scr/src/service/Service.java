package service;

import domain.Car;
import domain.Customer;
import exceptions.DuplicateItemException;
import exceptions.ItemNotFound;
import repository.RepositoryCars;
import repository.RepositoryCustomers;

import java.util.ArrayList;
import java.util.List;

public class Service {
    private final RepositoryCars repositoryCars;
    private final RepositoryCustomers repositoryCustomers;

    public Service(RepositoryCars repositoryCars, RepositoryCustomers repositoryCustomers){
        this.repositoryCars = repositoryCars;
        this.repositoryCustomers = repositoryCustomers;
    }

    public int generateId() {
        int maxId = repositoryCars.getMaxId();
        return maxId + 1;
    }
    public int getMaxId(){
        int maxId1 = 1;

        for (Car car : repositoryCars.getAllCars()) {
            if (car.getID() > maxId1) {
                maxId1 = car.getID();
            }
        }

        return maxId1;
    }
    public void addCar(String name, int numberOfStars, int yearOfFabrication, int priceperHour) throws DuplicateItemException {
        int idGenerated = generateId();
        this.repositoryCars.addItem(new Car(idGenerated, name, numberOfStars, yearOfFabrication,priceperHour));

    }


    public ArrayList<Car> getAllCars(){
        return repositoryCars.getAllCars();
    }

    public void getCarByName(String name) {
        List<Car> cars = repositoryCars.getAllCars();

        for (Car car:cars){
            if(car.getName().equals(name)) {
                car.getCar();
                return;
            }
        }
    }
    public void getCarByID(int id) throws ItemNotFound{
        repositoryCars.getItemById(id);
    }

    public void updateCar(Integer id, String nameBefore, String nameUpdate, int numberOfStars, int yearOfFabrication, int priceperHour) {
        List<Car> cars = repositoryCars.getAllCars();
        for (Car car:cars){
            if(car.getName().equals(nameBefore)){
                car.setName(nameUpdate);
                car.setNumberStars(numberOfStars);
                car.setYearOfFabrication(yearOfFabrication);
                car.setPricePerDay(priceperHour);
                return;
            }
        }
    }

    public void deleteCarByName(String name) {
        List<Car> cars = repositoryCars.getAllCars();
        List<Car> carsToKeep = new ArrayList<>();

        for (Car car : cars) {
            if (!car.getName().equals(name)) {
                carsToKeep.add(car);
            }
        }

        // Replace the original list with the new list
        cars.clear();
        cars.addAll(carsToKeep);

    }
    public void deleteCarByID(int id) throws ItemNotFound{
        repositoryCars.deleteItemById(id);
    }

    public void returnCheapestCar(){
        repositoryCars.getCheapestCar();
    }

    public void returnExpensiveCar(){
        repositoryCars.getMostExpensiveCar();
    }

    public void returnFabricationCars(int year){
        if(year>1900 && year <2024) {
            repositoryCars.getCarsFabricatedYear(year);
        }
    }
    public void addCustomer(int id, String Name, int PhoneNumber){
        repositoryCustomers.addCustomer(new Customer(id, Name, PhoneNumber));
    }

    public void getAllCustomers(){
        for (Customer c: repositoryCustomers.customers){
            System.out.println(c.toString());
        }
    }
    public void getCustomerById(int id) throws ItemNotFound{
        this.repositoryCustomers.getItemById(id);
    }

    public void updateCustomer(int idUpdate, String nameUpdate, int phoneNumeberUpdate) throws ItemNotFound{
        Customer customerToUpdate = repositoryCustomers.getItemById(idUpdate);
        if (!nameUpdate.equals(customerToUpdate.getName()))
            customerToUpdate.setName(nameUpdate);
        if(phoneNumeberUpdate != customerToUpdate.getPhoneNumber())
            customerToUpdate.setPhoneNumber(phoneNumeberUpdate);
        this.repositoryCustomers.updateItemByID(idUpdate, customerToUpdate);
    }

    public void deleteCustomerByID(int idDelete) throws ItemNotFound{
        Customer customerToDelete = repositoryCustomers.getItemById(idDelete);
        this.repositoryCustomers.deleteItemByID(idDelete);
    }

    public void deleteAllCars(){
        List<Car> cars1 = repositoryCars.getAllCars();
        List<Car> carsToKeep1 = new ArrayList<>();
        cars1.clear();
    }

}
