package repository;

import domain.Identifiable;
import exceptions.DuplicateItemException;
import exceptions.ItemNotFound;


import java.util.HashMap;
import java.util.Map;
public class MemoryRepository<T extends Identifiable<?>, U> implements IRepository<T,U>  {
    private Map<U,T> listOfItems = new HashMap<>();

    public void addItem(T item){
        listOfItems.put((U) item.getID(), item);
    }

    public void deleteItemByID(U id) {
        if (listOfItems.containsKey(id)){
            listOfItems.remove(id);
            return;
        }
    }

    public void deleteItemById(U id) {
        if(listOfItems.containsKey(id)){
            listOfItems.remove(id);
        }
    }

    //@Override
    public T getItemById(U id){
        return listOfItems.get(id);
    }

    public void updateItemByID(U id, T newItem) {
        if(listOfItems.containsKey(id)){
            listOfItems.replace(id, newItem);
        }
    }

    public Iterable<T> getAllItems(){return listOfItems.values();}
}
