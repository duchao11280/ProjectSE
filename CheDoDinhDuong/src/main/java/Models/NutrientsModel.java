package Models;

import Utilties.DBUtils;

import beans.Nutrients;
import org.sql2o.Connection;

import java.util.List;

public class NutrientsModel {
    public static List<Nutrients> getAll() {
        final String sql = "select * from nutrients";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Nutrients.class);
        }
    }
}
