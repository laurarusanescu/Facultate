package repository;
import domain.Car;

import java.util.ArrayList;
import java.util.List;

public class RepositoryCars  extends MemoryRepository<Car, Integer>{
    public ArrayList<Car> cars = new ArrayList<>();

    public void addCar(Car c){
        cars.add(c);
    }

    public ArrayList<Car> getAllCars(){
        return this.cars;
    }
    public String getCheapestCar(){
        int minPricePerHour = 5000000;
        for (Car car:cars){
            if(minPricePerHour > car.getPricePerDay()){
                minPricePerHour = car.getPricePerDay();
            }
        }
        for(Car car:cars){
            if(minPricePerHour == car.getPricePerDay())
                return car.toString();
        }
        return null;
    }

    public String getMostExpensiveCar(){
        int maxPricePerHour = 0;
        for (Car car:cars){
            if(maxPricePerHour < car.getPricePerDay()){
                maxPricePerHour = car.getPricePerDay();
            }
        }
        for(Car car:cars){
            if(maxPricePerHour == car.getPricePerDay())
                return car.toString();
        }
        return null;
    }

    public ArrayList<Car> getCarsFabricatedYear(int year){
        List<Car> fabricatedInYear = new ArrayList<>();
        for (Car car:cars){
            if(car.getYearOfFabrication()==year){
                fabricatedInYear.add(car);
            }
        }
        return (ArrayList<Car>) fabricatedInYear;
    }

    public int getMaxId() {
        int maxId = 0;
        for (Car car : cars) { // Assuming cars is the collection of cars in your repository.
            if (car.getID() > maxId) {
                maxId = car.getID();
            }
        }
        return maxId;
    }

}
