package katas.datastructures;

import org.junit.Test;

import java.util.EmptyStackException;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.sameInstance;
import static org.junit.Assert.assertThat;

public class StackTest {
    Stack<Object> stack = new Stack<>();

    @Test
    public void testConstructorCreatesEmptyStack() {
        assertThat(stack.empty(), is(true));
    }

    @Test
    public void testPushingElementOntoStackResultsInNonEmptyStack() {
        stack.push(new Object());
        assertThat(stack.empty(), not(true));
    }

    @Test
    public void testPopReturnsLastElementPushedOntoStack() {
        Object o = new Object();
        stack.push(o);
        assertThat(stack.pop(), sameInstance(o));
    }

    @Test
    public void testPoppingOnlyElementMakesStackEmpty() {
        stack.push(new Object());
        stack.pop();
        assertThat(stack.empty(), is(true));
    }

    @Test
    public void testPushAndPopMultipleElementsReturnsElementsInReverseOrder() {
        Object o1 = new Object();
        Object o2 = new Object();

        stack.push(o1);
        stack.push(o2);

        assertThat(stack.pop(), sameInstance(o2));
        assertThat(stack.pop(), sameInstance(o1));
    }

    @Test
    public void testPopAllElementsLeavesStackEmpty() {
        stack.push(new Object());
        stack.push(new Object());
        stack.pop();
        stack.pop();
        assertThat(stack.empty(), is(true));
    }

    @Test
    public void testPopSomeElementsLeavesStackNotEmpty() {
        stack.push(new Object());
        stack.push(new Object());
        stack.pop();
        assertThat(stack.empty(), not(true));
    }

    @Test(expected = EmptyStackException.class)
    public void testPopFromEmptyStackThrowsEmptyStackException() {
        stack.pop();
    }

    @Test
    public void testPeekReturnsTopElement() {
        Object o1 = new Object();
        stack.push(o1);
        assertThat(stack.peek(), sameInstance(o1));
    }

    @Test
    public void testPeekDoesNotRemoveElement() {
        Object o1 = new Object();
        stack.push(o1);
        stack.peek();
        assertThat(stack.empty(), not(true));
        assertThat(stack.pop(), sameInstance(o1));
    }

    @Test(expected = EmptyStackException.class)
    public void testPeekFromEmptyStackThrowsEmptyStackException() {
        stack.peek();
    }
}
