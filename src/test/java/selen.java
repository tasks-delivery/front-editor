import com.codeborne.selenide.Configuration;
import com.codeborne.selenide.WebDriverRunner;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.winium.DesktopOptions;
import org.openqa.selenium.winium.WiniumDriver;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class selen {

	public void startWinDriver() throws IOException, InterruptedException {
		final File batchFile = new File("Winium.Desktop.Driver.exe");
		final ProcessBuilder processBuilder = new ProcessBuilder(batchFile.getAbsolutePath());
		final Process process = processBuilder.start();
		final int exitStatus = process.waitFor();
		System.out.println("Processed finished with status: " + exitStatus);
	}

	@Test
	public void setUp() throws Exception {
	//	startWinDriver();
		WiniumDriver driver = null;
		String appPath = "Front_Editor.exe";
		DesktopOptions option = new DesktopOptions();
		option.setApplicationPath(appPath);
		option.setDebugConnectToRunningApp(false);
		option.setLaunchDelay(2);
		driver = new WiniumDriver(new URL("http://localhost:9999"),option);
		Thread.sleep(1000);
		/*
		WebElement window =  driver.findElementByClassName("CalcFrame");
		WebElement menuItem = window.findElement(By.id("MenuBar")).findElement(By.name("View"));
		menuItem.click();
		driver.findElementByName("Scientific").click();

		window.findElement(By.id("MenuBar")).findElement(By.name("View")).click();
		driver.findElementByName("History").click();

		window.findElement(By.id("MenuBar")).findElement(By.name("View")).click();
		driver.findElementByName("History").click();

		window.findElement(By.id("MenuBar")).findElement(By.name("View")).click();
		driver.findElementByName("Standard").click();

		driver.findElementByName("4").click();
		driver.findElementByName("Add").click();
		driver.findElementByName("5").click();
		driver.findElementByName("Equals").click();
		driver.close();
		*/
	}

}
