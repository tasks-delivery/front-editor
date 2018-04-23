import org.testng.annotations.Test;

import java.util.Locale;

/**
 * Created by compik on 23.04.2018.
 */
public class local {



    @Test
    public void first(){


    }

    @Test
    public String testStyleWindow(String testStyle){
        Locale lang = Locale.getDefault();
        if (lang.getLanguage() == "en"){
            String textStyle = "Font";
            System.out.println(lang);
        }
        if (lang.getLanguage() == "ru"){
            String textStyle = "Шрифт";
            System.out.println(lang);
        }

        return testStyle;
    }

}
