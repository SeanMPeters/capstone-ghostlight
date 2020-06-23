package com.capt.inv;

import java.util.concurrent.TimeUnit;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

import io.github.bonigarcia.wdm.WebDriverManager;

public class WebDriverTests {

	static WebDriver driver;

	static String url = "http://localhost:4000/capstone";

	static String co_link = "COMPANY";

	@BeforeClass
	public static void openBrowser() {
		// System.setProperty("webdriver.ie.driver",
		// "C:\\ws\\drivers\\IEDriverServer.exe");
		// driver=new InternetExplorerDriver();
		WebDriverManager.chromedriver().setup();
//WebDriverManager.iedriver().setup();
		// System.setProperty("webdriver.chrome.driver",
		// "C:\\ws\\drivers\\chromedriver.exe");

		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);

	}

	@Test
	@Ignore
	public void test() throws InterruptedException {

		driver.get("https://login.yahoo.com/");
		Thread.sleep(3000);
		driver.findElement(By.name("username")).sendKeys("seanmichaelpeters25@gmail.com");
		//Thread.sleep(3000);
		driver.findElement(By.name("signin")).click();
		//Thread.sleep(3000);

	}

	@Test
	public void adminLogin() {
		login();
		driver.findElement(By.linkText("ADMIN")).click();
		driver.findElement(By.name("keyword")).sendKeys("Sean");
		
	}
	
	//@Test
	//@Ignore
	public void login() {
		driver.get(url + "/login");
		driver.findElement(By.name("email")).sendKeys("seanmichaelpeters25@gmail.com");
		//Thread.sleep(3000);
		driver.findElement(By.name("password")).sendKeys("1234");
		//Thread.sleep(3000);
		driver.findElement(By.id("submiter")).click();
		//Thread.sleep(3000);
		driver.getPageSource().contains("Dashboard");
		//driver.findElement(By.linkText("LOGOUT")).click();
		//driver.getPageSource().contains("You have been logged out");
		//Thread.sleep(3000);
	}

	public void logout() {
		driver.findElement(By.linkText("LOGOUT")).click();
		driver.getPageSource().contains("You have been logged out");
		
	}
	
	@Test
	@Ignore
	public void google() throws InterruptedException {
		driver.get("https://www.google.com/");
		Thread.sleep(300);
	}

	@Test
//@Ignore
	public void testheader() throws InterruptedException {
		testlink("home");
		Thread.sleep(30);
		testlink("about");
		Thread.sleep(30);
		testlink("contactus");

	}

	public synchronized void testlink(String page) throws InterruptedException {
		driver.get(url + "/" + page + "");
		driver.findElement(By.linkText("HOME")).click();

		hover(co_link);
		driver.findElement(By.linkText("CONTACT")).click();
		hover(co_link);
		driver.findElement(By.linkText("ABOUT US")).click();

		driver.findElement(By.linkText("LOGIN")).click();
		driver.get(url);
		driver.findElement(By.linkText("REGISTER")).click();
		driver.get(url);
		Thread.sleep(300);

	}

	@Test
	@Ignore
	public void testEmail() {
		driver.get(url + "/contact");
		driver.findElement(By.name("name")).sendKeys("George Omollo");
		driver.findElement(By.name("email")).sendKeys("xx@gmail.com");
		driver.findElement(By.name("subject")).sendKeys("WebDriver Test Email");
		driver.findElement(By.name("message")).sendKeys("This is a test email from Claim tutorials for Web Driver");
		driver.findElement(By.id("contact-submit")).click();

	}

	public void hover(String link) {
		Actions builder = new Actions(driver);
		WebElement element = driver.findElement(By.linkText(link));
		builder.moveToElement(element).build().perform();
	}

	@AfterClass
	public static void closeBrowser() {
		driver.quit();
	}

}