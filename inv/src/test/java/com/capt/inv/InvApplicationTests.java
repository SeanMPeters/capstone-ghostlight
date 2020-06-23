package com.capt.inv;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
//import org.junit.platform.commons.logging.Logger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class InvApplicationTests {

	public final Logger log=LoggerFactory.getLogger(InvApplicationTests.class);

	@Test
	public void divide() {
		assertEquals(1, quotient(10,10));
		log.info("Divide {} ", quotient(10,10));
	}
	
	@Test
	public void calculate() {
		assertEquals(20, sum(10,10));
		log.info("Sum {} ", sum(10,10));
		assertEquals(100, product(10,10));
		log.info("Multiply {} ", product(10,10));
	}
	
	
	
	int sum(int a, int b) {
		return a+b;
	}
	
	int product(int a, int b) {
		return a*b;
	}
	
	int quotient(int a, int b) {
		return b/a;
	}
}
