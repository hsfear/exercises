package katas.datastructures;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

public class RingBufferTest {
    RingBuffer<Object> buffer = new RingBuffer<>(2);

    @Test
    public void testARingBufferIsEmpty() {
        assertThat(buffer.isEmpty(), is(true));
    }

    @Test
    public void testCapacityReturnsTheCapacity() {
        assertThat(buffer.capacity(), is(2));
    }

    @Test
    public void testRingBufferIsNotEmptyAfterAnElementHasBeenAdded() {
        buffer.add(new Object());
        assertThat(buffer.isEmpty(), not(true));
    }

    @Test
    public void testRemoveReturnsOnlyElementInBuffer() {
        Object o = new Object();
        buffer.add(o);
        assertThat(buffer.remove(), sameInstance(o));
    }

    @Test
    public void testRemoveReturnsElementsInTheOrderAdded() {
        Object o1 = new Object();
        Object o2 = new Object();
        buffer.add(o1);
        buffer.add(o2);
        assertThat(buffer.remove(), sameInstance(o1));
        assertThat(buffer.remove(), sameInstance(o2));
    }

    @Test
    public void testRemoveAllElementsResultsInEmptyBuffer() {
        buffer.add(new Object());
        buffer.add(new Object());
        buffer.remove();
        buffer.remove();
        assertThat(buffer.isEmpty(), is(true));
    }

    @Test
    public void testAddingMoreThanCapacityElementsDropsInitialElements() {
        Object o1 = new Object();
        Object o2 = new Object();
        Object o3 = new Object();
        buffer.add(o1);
        buffer.add(o2);
        buffer.add(o3);
        assertThat(buffer.remove(), sameInstance(o2));
        assertThat(buffer.remove(), sameInstance(o3));
    }

    @Test
    public void testAddAndRemoveAroundTheCapacity() {
        Object o1 = new Object();
        Object o2 = new Object();
        Object o3 = new Object();
        Object o4 = new Object();
        buffer.add(o1);
        buffer.remove();
        buffer.add(o2);
        buffer.remove();
        buffer.add(o3);
        buffer.add(o4);
        assertThat(buffer.remove(), sameInstance(o3));
        assertThat(buffer.remove(), sameInstance(o4));
    }
}
