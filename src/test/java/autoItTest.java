//import autoitx4java.AutoItX;
//import com.jacob.com.LibraryLoader;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.winium.DesktopOptions;
import org.openqa.selenium.winium.WiniumDriver;
import org.openqa.selenium.winium.WiniumDriverService;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

/**
 * Created by morf on 05.03.2018.
 */
//import com.cobra.ldtp;
public class autoItTest {


    private static RemoteWebDriver CalculatorSession = null;
    private static WebElement CalculatorResult = null;

    @Test
    public void testMethod() throws InterruptedException, MalformedURLException {
        File ft = new File("C:\\FM\\Projects\\Delphi\\front-editor\\driver\\Winium.Desktop.Driver.exe");
        DesktopOptions options = new DesktopOptions();
        options.setApplicationPath("C:\\Windows\\System32\\notepad.exe");
        WiniumDriver driver = new WiniumDriver(options);
     /*   WiniumDriverService service = new WiniumDriverService.Builder()
                .usingDriverExecutable(ft)
                .usingAnyFreePort()
                .withVerbose(true)
                .withSilent(false);
                .buildDesktopService();
                */

      //  WiniumDriver driver = new WiniumDriver(service, options);


        /*
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("app", "C:\\FM\\Projects\\Delphi\\front-editor\\Front_Editor.exe");
        capabilities.setCapability("platformName", "Windows");
        capabilities.setCapability("deviceName", "WindowsPC");
        CalculatorSession = new RemoteWebDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
        CalculatorSession.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);

        CalculatorSession.findElementByXPath("//Button[starts-with(@Name, \"Menu\")]").click();
        CalculatorSession.findElementByXPath("//ListItem[@Name=\"Standard Calculator\"]").click();

        CalculatorSession.findElementByName("Clear").click();
        CalculatorSession.findElementByName("Seven").click();
        CalculatorResult = CalculatorSession.findElementByName("Display is  7 ");
        Assert.assertNotNull(CalculatorResult);
        */
    }

}
