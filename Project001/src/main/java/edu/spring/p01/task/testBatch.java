package edu.spring.p01.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class testBatch {
	private static final Logger logger =
			LoggerFactory.getLogger(testBatch.class);
	
	/*
	 * @Scheduled(cron = "0 * * * * *") public void testMethod() throws Exception{
	 * logger.info("배치 실행 테스트...............");
	 * logger.info("----------------------------"); }
	 */
}
