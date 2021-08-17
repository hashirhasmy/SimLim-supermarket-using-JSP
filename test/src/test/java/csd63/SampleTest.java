package csd63;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.hashir.test.SampleClass;

public class SampleTest {

	int num1 = 5;
	int num2 = 10;
	
	int expected = 15;
	
	
	public void setUp() {
		
	}
	
	@Test
	public void addTest() {
		SampleClass sampleClass = new SampleClass();
		
		int actual = sampleClass.add(num1,num2);
		
		assertEquals(expected, actual);
	}
	
	public void tearDown() {
		
	}
	
	
	
}
