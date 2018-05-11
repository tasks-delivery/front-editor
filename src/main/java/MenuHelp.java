public class MenuHelp extends MenuCode {

    public String update = "Update";
    public String checkBoxTurnOff = "Turn off application";
    public String btnDownload = "Download";
    public String about = "About";
    public String btnOk = "OK";

    public void clickNotificationCheckBox(){
        autoItX.mouseClick("left",498,646);
    }

    public void openMenuHelp(){
        autoItX.mouseClick("left",126,39);
    }

    public void openAboutWindow(){
        openMenuHelp();
        autoItX.mouseClick("left",154,102);
        autoItX.winWaitActive(about);
    }

    public void openUpdateWindow(){
        openMenuHelp();
        autoItX.mouseClick("left",154,80);
        autoItX.winWaitActive(update);
    }

}
