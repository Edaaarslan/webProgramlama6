package model;

import java.util.*;

public class Catalog {
    private Map<String, Item> items = new HashMap<>();

    public Catalog() {
        items.put("1", new Item("1", "Ürün 1", 10.0, "Ürün 1 Açıklama"));
        items.put("2", new Item("2", "Ürün 2", 15.0, "Ürün 2 Açıklama"));
        items.put("3", new Item("3", "Ürün 3", 20.0, "Ürün 3 Açıklama"));
    }

    public Item getItem(String id) {
        return items.get(id);
    }

    public Collection<Item> getAllItems() {
        return items.values();
    }
}
