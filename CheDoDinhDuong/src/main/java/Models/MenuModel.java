package Models;

import Utilties.DBUtils;
import beans.SuggestMenu;
import org.sql2o.Connection;

import java.util.List;

public class MenuModel {
    public static List<SuggestMenu> getSuggestMenuByDay(String conID, String day){
        final String sql = "select * from suggestmenu where conID=:conID and dayofweek=:day ";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("conID",conID)
                    .addParameter("day",day)
                    .executeAndFetch(SuggestMenu.class);
        }
    }
}
