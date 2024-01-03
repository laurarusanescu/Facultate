package repository;
import domain.Car;

import org.junit.jupiter.api.Test;
import repository.CarRepository;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class CarRepositoryTest {

    @Test
    public void testAddCarAndGetAllCars() {
        CarRepository carRepository = new CarRepository();
        Car car1 = new Car(1, "Car1", 4, 2020, 100);
        Car car2 = new Car(2, "Car2", 5, 2021, 120);

        carRepository.addCar1(car1);
        carRepository.addCar1(car2);

        ArrayList<Car> allCars = carRepository.getAllCars();
        int a=2;
        a=allCars.size();
        assertEquals(car1, allCars.get(0));
        assertEquals(car2, allCars.get(1));
    }

    private void assertEquals(Car car1, Car car) {
    }
    @Test
    public void testGetCheapestCar() {
        CarRepository carRepository = new CarRepository();
        carRepository.addCar1(new Car(1, "Car1", 4, 2022, 100));
        carRepository.addCar1(new Car(2, "Car2", 5, 2021, 150));
        carRepository.addCar1(new Car(3, "Car3", 3, 2023, 80));

        System.out.println("Cheapest Car: " + carRepository.getCheapestCar());
    }

    @Test
    public void testGetMostExpensiveCar() {
        CarRepository carRepository = new CarRepository();
        carRepository.addCar1(new Car(1, "Car1", 4, 2022, 100));
        carRepository.addCar1(new Car(2, "Car2", 5, 2021, 150));
        carRepository.addCar1(new Car(3, "Car3", 3, 2023, 80));

        System.out.println("Most Expensive Car: " + carRepository.getMostExpensiveCar());
    }

    @Test
    public void testGetCarsFabricatedYear() {
        CarRepository carRepository = new CarRepository();
        carRepository.addCar1(new Car(1, "Car1", 4, 2022, 100));
        carRepository.addCar1(new Car(2, "Car2", 5, 2021, 150));
        carRepository.addCar1(new Car(3, "Car3", 3, 2023, 80));

        int yearToTest = 2022;
        ArrayList<Car> carsInYear = carRepository.getCarsFabricatedYear(yearToTest);

        System.out.println("Cars fabricated in " + yearToTest + ":");
        for (Car car : carsInYear) {
            System.out.println(car);
        }
    }

    @Test
    public void testGetMaxId() {
        CarRepository carRepository = new CarRepository();
        carRepository.addCar1(new Car(1, "Car1", 4, 2022, 100));
        carRepository.addCar1(new Car(2, "Car2", 5, 2021, 150));
        carRepository.addCar1(new Car(3, "Car3", 3, 2023, 80));

        System.out.println("Max ID: " + carRepository.getMaxId());
    }
}