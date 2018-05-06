import config.ConciseApi;

public class MenuFile extends ConciseApi {

    public void openMenuFile(){
        autoItX.mouseClick("left",21,39);
    }

    public void clickMenuItemExit(){
        openMenuFile();
        autoItX.mouseClick("left",60,129);
        autoItX.winWaitNoActive(appName);
    }

    public void clickMenuItemNew(){
        openMenuFile();
        autoItX.mouseClick("left",33,62);
    }

}
