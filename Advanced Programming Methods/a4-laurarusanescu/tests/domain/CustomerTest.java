package domain;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class CustomerTest {

    @Test
    public void testGettersAndSetters() {
        Customer customer = new Customer(1, "John Doe", 123456789);

        Assertions.assertEquals(1, customer.getId());
        Assertions.assertEquals("John Doe", customer.getName());
        Assertions.assertEquals(123456789, customer.getPhoneNumber());

        customer.setId(2);
        customer.setName("Jane Doe");
        customer.setPhoneNumber(987654321);

        Assertions.assertEquals(2, customer.getId());
        Assertions.assertEquals("Jane Doe", customer.getName());
        Assertions.assertEquals(987654321, customer.getPhoneNumber());
    }

    @Test
    public void testEquals() {
        Customer customer1 = new Customer(1, "John Doe", 123456789);
        Customer customer2 = new Customer(1, "John Doe", 123456789);
        Customer customer3 = new Customer(2, "Jane Doe", 987654321);

        Assertions.assertTrue(customer1.equals(customer2));
        Assertions.assertFalse(customer1.equals(customer3));
    }

    @Test
    public void testToString() {
        Customer customer = new Customer(1, "John Doe", 123456789);
        String expected = "Customer{id=1, phoneNumber=123456789, name='John Doe'}";
        Assertions.assertEquals(expected, customer.toString());
    }

    @Test
    public void testHashCode() {
        Customer customer1 = new Customer(1, "John Doe", 123456789);
        Customer customer2 = new Customer(1, "John Doe", 123456789);

        Assertions.assertEquals(customer1.hashCode(), customer2.hashCode());
    }
}