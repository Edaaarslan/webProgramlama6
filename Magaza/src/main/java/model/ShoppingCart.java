package model;

import java.util.*;

public class ShoppingCart {
    private Map<String, Integer> cartItems = new HashMap<>();

    public void addItem(String id) {
        cartItems.put(id, cartItems.getOrDefault(id, 0) + 1);
    }

    public void removeItem(String id) {
        cartItems.remove(id);
    }

    public void updateItemQuantity(String id, int quantity) {
        if (quantity > 0) {
            cartItems.put(id, quantity);
        } else {
            cartItems.remove(id);
        }
    }

    public Map<String, Integer> getCartItems() {
        return cartItems;
    }
}
