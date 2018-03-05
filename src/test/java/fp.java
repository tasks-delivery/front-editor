import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.winium.DesktopOptions;
import org.openqa.selenium.winium.WiniumDriver;
import org.testng.annotations.Test;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by morf on 05.03.2018.
 */
public class fp {

    @Test
    public void testMethodFirst() throws InterruptedException, MalformedURLException {
     //   C:\FM\Projects\Delphi\front-editor\driver\Winium.Desktop.Driver.exe
        WiniumDriver driver = null;
        String appPath = "Front_Editor.exe";
        DesktopOptions option = new DesktopOptions();
        option.setApplicationPath(appPath);
        option.setDebugConnectToRunningApp(false);
        option.setLaunchDelay(2);
        driver = new WiniumDriver(new URL("http://localhost:9999"),option);
        Thread.sleep(1000);
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

    }

}
