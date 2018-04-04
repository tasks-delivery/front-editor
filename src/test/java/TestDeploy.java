import autoitx4java.AutoItX;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.LibraryLoader;
import org.testng.Assert;
import org.testng.annotations.Test;
import java.io.File;
import java.io.IOException;

public class TestDeploy {
    //jacob-1.18-x64.dll
    //jacob-1.18-x86.dll
    //jacob-1.17-x86.dll
    //jacob-1.16-M2-x64.dll

    @Test
    public void FirstTestDeploy() throws IOException {
        File file = new File("lib", "jacob-1.16-M2-x64.dll"); //path to the jacob dll
        System.setProperty(LibraryLoader.JACOB_DLL_PATH, file.getAbsolutePath());
        LibraryLoader.loadJacobLibrary();
        AutoItX x = new AutoItX();
     //   String notepad = "Untitled - Notepad";
     //   String testString = "this is a test.";
        x.run("Front_Editor.exe");

        /*
        _WinWaitActivate("Front-Editor","")
        MouseClick("left",359,64,1)
        _WinWaitActivate("Save file","&Имя файла:")
        MouseClick("left",565,14,1)
*/
        x.winWaitActive("Front-Editor");
        x.mouseClick("left",359,64);
        x.winWaitActive("Save file");
       x.mouseClick("left",564,14);
        x.winClose("Save file");

      //  x.mouseClick("left",361,73);
     //   x.mouseClick("left",564,12);

     //   x.winActivate(notepad);
     //   x.winWaitActive(notepad);
     //   x.send(testString);
     //   Assert.assertTrue(x.winExists(notepad, testString));
      //  x.winClose(notepad, testString);
      //  x.winWaitActive("Notepad");
      //  x.send("{ALT}n");
      //  Assert.assertFalse(x.winExists(notepad, testString));
    }

    @Test
    public void core() {
            File file = new File("./src/main/resources/jacob-1.18-x64.dll"); // path
            System.setProperty(LibraryLoader.JACOB_DLL_PATH, file.getAbsolutePath());
            AutoItX x = new AutoItX();
            String notepad = "Untitled - Notepad";
            String testString = "this is a test.";
            x.run("notepad", "C:/Windows/System32", AutoItX.SW_MAXIMIZE);
            x.winActivate(notepad);
            x.winWaitActive(notepad);
            x.send(testString);
            Assert.assertTrue(x.winExists(notepad, testString));
            x.winClose(notepad, testString);
            x.winWaitActive("Notepad");
            x.send("{ALT}n");
            Assert.assertFalse(x.winExists(notepad, testString));
        }

}
