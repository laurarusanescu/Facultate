package domain;

import org.junit.jupiter.api.Assertions;

import static org.junit.jupiter.api.Assertions.*;
public class CarTest {

    @org.junit.jupiter.api.Test
    public void testGettersAndSetters() {
        Car car = new Car(1, "Toyota", 4, 2022, 100);

        Assertions.assertEquals(1, car.getID());
        Assertions.assertEquals("Toyota", car.getName());
        Assertions.assertEquals(4, car.getNumberStars());
        Assertions.assertEquals(2022, car.getYearOfFabrication());
        Assertions.assertEquals(100, car.getPricePerDay());

        car.setID(2);
        car.setName("Honda");
        car.setNumberStars(5);
        car.setYearOfFabrication(2021);
        car.setPricePerDay(120);

        Assertions.assertEquals(2, car.getID());
        Assertions.assertEquals("Honda", car.getName());
        Assertions.assertEquals(5, car.getNumberStars());
        Assertions.assertEquals(2021, car.getYearOfFabrication());
        Assertions.assertEquals(120, car.getPricePerDay());
    }

    @org.junit.jupiter.api.Test
    public void testToString() {
        Car car = new Car(1, "Toyota", 4, 2022, 100);
        String expected = "Car{id=1, name='Toyota', yearOfFabrication=2022, numberStars=4, pricePerDay=100}";
        Assertions.assertEquals(expected, car.toString());
    }

    @org.junit.jupiter.api.Test
    public void testEquals() {
        Car car1 = new Car(1, "Toyota", 4, 2022, 100);
        Car car2 = new Car(1, "Toyota", 4, 2022, 100);
        Car car3 = new Car(2, "Honda", 5, 2021, 120);

        Assertions.assertTrue(car1.equals(car2));
        Assertions.assertFalse(car1.equals(car3));
    }
}