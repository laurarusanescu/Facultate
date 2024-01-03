package domain;

public class Car implements Identifiable<Integer> {
    Integer id;
    private String name;

    private int yearOfFabrication, numberStars, pricePerDay;

    public Car(Integer id, String name, int number_stars, int year_of_fabrication, int price_per_day){
        this.id = id;
        this.name = name;
        this.numberStars = number_stars;
        this.yearOfFabrication = year_of_fabrication;
        this.pricePerDay = price_per_day;
    }

    public String getName() {
        return name;
    }

    public int getYearOfFabrication() {
        return yearOfFabrication;
    }

    public int getNumberStars() {
        return numberStars;
    }

    public int getPricePerDay() {
        return pricePerDay;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setYearOfFabrication(int yearOfFabrication) {
        this.yearOfFabrication = yearOfFabrication;
    }

    public void setNumberStars(int numberStars) {
        this.numberStars = numberStars;
    }

    public void setPricePerDay(int pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public String getCar(){
        return "Car{id= "+ id +
                "name= " + name +
                ", number of stars= " + numberStars +
                ", year of fabrication=" + yearOfFabrication +
                ", price per day=" + pricePerDay +
                "}";
    }

    public boolean equals(Object o){
        if (!(o instanceof Car))
            return false;
        Car d = (Car)o;
        if(((Car) o).id==this.id)
                return true;
        return false;
    }

    @Override
    public Integer getID() {
        return null;
    }

    @Override
    public void setID(Integer id) {

    }
}
