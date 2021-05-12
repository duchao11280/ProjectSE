package Models;

import Utilties.DBUtils;
import beans.CustomMenu;
import org.sql2o.Connection;

import java.util.List;

public class CustomMenuModel {
    public static void addCustomMenu(int userid,int foodid,String dtpk,int number) {
        String sql = "call add_custom_menu(:userid,:foodid,:dtpk,:number)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userid", userid)
                    .addParameter("foodid", foodid)
                    .addParameter("dtpk", dtpk)
                    .addParameter("number", number)
                    .executeUpdate();
        }
    }
    public static List<CustomMenu> getMenuFromNowByUserID(int userid){
        String sql =  "SELECT * from custommenu WHERE userID=:userid AND DATEDIFF(datetime,NOW())>0 ORDER BY datetime";
        try (Connection con =DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("userid",userid)
                    .executeAndFetch(CustomMenu.class);
        }

    }
}
