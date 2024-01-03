import domain.CarTest;

import domain.CustomerTest;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import repository.CarRepositoryTest;
import repository.CustomerRepositoryTest;
import repository.MemoryRepositoryTest;


public class main {
        public static void main(String[] args) {
                Result result = JUnitCore.runClasses(CarTest.class, CustomerTest.class, CarRepositoryTest.class, CustomerRepositoryTest.class, MemoryRepositoryTest.class);
        }
}
