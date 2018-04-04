import autoitx4java.AutoItX;
import com.codeborne.selenide.Selenide;
import com.jacob.com.LibraryLoader;
import config.ConciseApi;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.File;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.testng.Assert.*;

public class TemplateTest extends ConciseApi {

    public void clickBtnJavaTemplate(){
        autoItX.mouseClick("left",359,64);
    }

    public void closeSaveDialog(){
        autoItX.winWaitActive("Save file");
        autoItX.winClose("Save file");
    }

    public void clickBtnClear(){
        autoItX.mouseClick("left",186,69);
    }

    @Test
    public void javaCodeShouldBeVisible(){
        clickBtnJavaTemplate();
       closeSaveDialog();
        clickBtnClear();
       //autoItX.controlShow("", "","");
        //autoItX.mouseClick("left",416,174);
      //  autoItX.controlShow(appName, "test","")
        autoItX.send("test");
       // autoItX.controlShow(appName, "test","TSynEdit");
        Selenide.sleep(1000);
     //   assertThat(autoItX.(appName, "test","TSynEdit1", "test"));
     //   autoItX.controlCommandFindString(appName, "test","TSynEdit1", "test"));
       // Assert.assertTrue(autoItX.controlEnable(appName, "test",""));
     //   Assert.assertTrue(autoItX.controlCommandIsEnabled(appName, "test", "TSynEdit1"));

      //  Assert.assertFalse(autoItX.controlShow(appName, "tset","TSynEdit1"));
      //  Assert.assertFalse(autoItX.winExists(appName, "public"));
       // Assert.assertFalse(x.controlGetText("","","pubsic"));
    }

}