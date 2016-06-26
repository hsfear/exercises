package katas.datastructures;

import java.util.ArrayList;
import java.util.EmptyStackException;
import java.util.List;

public class Stack<T> {
    List<T> elements = new ArrayList<>();

    public boolean empty() {
        return this.elements.isEmpty();
    }

    public void push(T element) {
        this.elements.add(element);
    }

    public T pop() {
        requireNonEmptyStack();
        int last = lastIndex();
        T result = this.elements.get(last);
        this.elements.remove(last);
        return result;
    }

    public T peek() {
        requireNonEmptyStack();
        return this.elements.get(lastIndex());
    }

    private int lastIndex() { return this.elements.size() - 1; }

    private void requireNonEmptyStack() {
        if (elements.isEmpty()) throw new EmptyStackException();
    }
}
