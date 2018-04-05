package config;

import autoitx4java.AutoItX;
import com.jacob.com.LibraryLoader;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import java.io.File;

public abstract class ConciseApi {

   public AutoItX autoItX;
   public String appName = "Front-Editor";
   public String saveFileDialog = "Save file";

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
    }
}
