package katas.datastructures;

import java.lang.reflect.Array;

public class RingBuffer<T> {
    private int capacity;
    private T[] elements;
    private int in = 0;
    private int out = 0;

    public RingBuffer(int capacity) {
        this.capacity = capacity;
    }

    public boolean isEmpty() {
        return in == out;
    }

    public void add(T element) {
        requireBuffer(element.getClass());
        if (isFull()) remove();
        this.elements[in] = element;
        in = next(in);
    }

    private boolean isFull() {
        return next(in) == out;
    }

    public T remove() {
        T result = this.elements[out];
        out = next(out);
        return result;
    }

    public int capacity() {
        return capacity;
    }

    @SuppressWarnings("unchecked")
    private void createBuffer(Class clazz) {
        elements = (T[]) Array.newInstance(clazz, capacity + 1);
    }

    private void requireBuffer(Class clazz) {
        if (elements == null) createBuffer(clazz);
    }

    private int next(int index) { return (index + 1) % (capacity + 1); }
}
