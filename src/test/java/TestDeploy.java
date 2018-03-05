import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.Assert;
import org.testng.annotations.Test;
import java.io.IOException;
import java.net.URL;
import java.util.concurrent.TimeUnit;
//import io.appium.java_client.windows.WindowsDriver;
import static com.codeborne.selenide.Selenide.$;

public class TestDeploy {


   // private static WindowsDriver CalculatorSession = null;
   // private static WebElement CalculatorResult = null;


    @Test
    public void FirstTestDeploy() throws IOException {
        /*
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("app", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App");
        CalculatorSession = new WindowsDriver(new URL("http://127.0.0.1:4723"), capabilities);
        CalculatorSession.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);

        CalculatorResult = CalculatorSession.findElementByAccessibilityId("CalculatorResults");
        Assert.assertNotNull(CalculatorResult);
*/
/*
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("app", "Front_Editor.exe");
        capabilities.setCapability("platformName", "Windows");
        capabilities.setCapability("deviceName", "WindowsPC");

        CalculatorSession = new WindowsDriver<WindowsElement> (new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
        */
    //    CalculatorSession.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);

     //   CalculatorSession.findElementByXPath("//Button[starts-with(@Name, \"Menu\")]").click();
     //   CalculatorSession.findElementByXPath("//ListItem[@Name=\"Standard Calculator\"]").click();

      //  CalculatorSession.findElementByName("Clear").click();
     //   CalculatorSession.findElementByName("Seven").click();
     //   CalculatorResult = CalculatorSession.findElementByName("Display is  7 ");
      //  Assert.assertNotNull(CalculatorResult);


   //    driver = new WinAppDriver();
      //  Runtime.getRuntime().exec("Front_Editor.exe");

     //   TBitBtn9

        $(By.className("TBitBtn9")).click();


    }

}
