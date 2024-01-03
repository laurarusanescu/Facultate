package repository;
import domain.Identifiable;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import repository.MemoryRepository;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class MemoryRepositoryTest {
    private MemoryRepository<TestItem, Integer> repository;



    @Test
    void addItem_shouldAddItemToRepository() {
        TestItem item1 = new TestItem(1, "Item 1");
        TestItem item2 = new TestItem(2, "Item 2");

        repository.addItem(item1);
        repository.addItem(item2);

        Assertions.assertEquals(2, countItems(repository.getAllItems()));
        Assertions.assertTrue(containsItem(repository.getAllItems(), item1));
        Assertions.assertTrue(containsItem(repository.getAllItems(), item2));
    }

    @Test
    void removeItemByID_shouldRemoveItemFromRepository() {
        TestItem item1 = new TestItem(1, "Item 1");
        TestItem item2 = new TestItem(2, "Item 2");
        repository.addItem(item1);
        repository.addItem(item2);

        repository.removeItemByID(1);

        Assertions.assertEquals(1, countItems(repository.getAllItems()));
        Assertions.assertFalse(containsItem(repository.getAllItems(), item1));
        Assertions.assertTrue(containsItem(repository.getAllItems(), item2));
    }

    @Test
    void getItemById_shouldReturnCorrectItem() {
        TestItem item1 = new TestItem(1, "Item 1");
        TestItem item2 = new TestItem(2, "Item 2");
        repository.addItem(item1);
        repository.addItem(item2);

        Assertions.assertEquals(item1, repository.getItemById(1));
        Assertions.assertEquals(item2, repository.getItemById(2));
    }

    @Test
    void getAllItems_shouldReturnAllItems() {
        TestItem item1 = new TestItem(1, "Item 1");
        TestItem item2 = new TestItem(2, "Item 2");
        repository.addItem(item1);
        repository.addItem(item2);

        Iterable<TestItem> allItems = repository.getAllItems();

        Assertions.assertNotNull(allItems);
        List<TestItem> expectedItems = Arrays.asList(item1, item2);
        Assertions.assertIterableEquals(expectedItems, allItems);
    }

    private int countItems(Iterable<TestItem> items) {
        int count = 0;
        for (TestItem item : items) {
            count++;
        }
        return count;
    }

    private boolean containsItem(Iterable<TestItem> items, TestItem targetItem) {
        for (TestItem item : items) {
            if (item.equals(targetItem)) {
                return true;
            }
        }
        return false;
    }

    // Define your Identifiable implementation for testing
    static class TestItem implements Identifiable<Integer> {
        private final Integer id;
        private final String name;

        public TestItem(Integer id, String name) {
            this.id = id;
            this.name = name;
        }

        @Override
        public Integer getID() {
            return null;
        }

        @Override
        public void setID(Integer id) {

        }
    }
}