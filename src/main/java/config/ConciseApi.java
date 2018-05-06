package config;

import autoitx4java.AutoItX;
import com.jacob.com.LibraryLoader;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import java.awt.*;
import java.io.File;

public abstract class ConciseApi {

    public String testJavaFile = "test.java";
    public String testHtmlFile = "test.html";
    public String testJsFile = "test.js";
    public String testXmlFile = "test.xml";
    public String testSqlFile = "test.sql";
    public String testCssFile = "test.css";
    public String testLessFile = "test.less";
    public String testHtmFile = "test.htm";
    public String toDo = "TODO:";

    public AutoItX autoItX;
    public String appName = "Front-Editor";
    public String saveFileDialog = "Save file";

    public void pressKey(int key) throws AWTException {
        Robot robot = new Robot();
        robot.keyPress(key);
        robot.keyRelease(key);
    }

    public void pressKeyInSameTime(int key1, int key2) throws AWTException {
        Robot rb = new Robot();
        rb.keyPress(key1);
        rb.keyPress(key2);
        rb.keyRelease(key1);
        rb.keyRelease(key2);
    }

    @BeforeClass
    public void setUp(){
        File file = new File("lib", "jacob-1.16-M2-x64.dll");
        System.setProperty(LibraryLoader.JACOB_DLL_PATH, file.getAbsolutePath());
        LibraryLoader.loadJacobLibrary();
        autoItX = new AutoItX();
        autoItX.run("Front_Editor.exe");
        autoItX.winWaitActive(appName);
    }

    @AfterClass
    public void closeApp(){
        autoItX.winClose(appName);
        autoItX.winWaitNoActive(appName);
    }

    public void openApp(){
        autoItX.run("Front_Editor.exe");
        autoItX.winWaitActive(appName);
    }

    public void restartApp(){
        closeApp();
        openApp();
    }

    public void closeWindow(String window){
        autoItX.winClose(window);
        autoItX.winWaitNoActive(window);
    }
}
