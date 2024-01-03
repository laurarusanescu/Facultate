import java.util.ArrayList;
import java.util.List;

public class Pb1 {
    public Pb1(List<Integer> numbers) {
        this.numbers = numbers;
    }

    List<Integer> numbers;
    public List<Integer> primeNumbers() {
        List<Integer> primeNumber = new ArrayList<>();

        for (int number : numbers) {
            if (isPrime(number)) {
                primeNumber.add(number);
            }
        }

        return primeNumber;
    }

    private boolean isPrime(int number) {
        if (number <= 1) {
            return false;
        }
        for (int i = 2; i * i <= number; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }


    private int maximumValDouble() {
        int max =1;

        for (int number : numbers) {
            if (number > 9 && number < 100) {
                if (number > max) {
                    max = number;
                }
            }
        }

        return max;
    }

    private int greatestCommonDivisor(List<Integer> numbers){
        return greatestCommonDivisor(this.numbers);
    }
}
