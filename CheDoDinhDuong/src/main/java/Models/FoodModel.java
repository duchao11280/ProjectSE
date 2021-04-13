package Models;

import beans.Food;
import org.sql2o.Connection;
import Utilties.DBUtils;

import java.util.List;
import java.util.Optional;

public class FoodModel {
    public static List<Food> getAll() {
        String sql = "select * from food";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Food.class);
        }
    }

    public static List<Food> findByCatID(int catID) {
        String sql = "select * from food where catID = :catID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID", catID)
                    .executeAndFetch(Food.class);
        }
    }
    public static List<Food> getFoodByString(String search) {
        final String sql = "select *"
                + " from food"
                + " where ( match(foodName) against (:search IN NATURAL LANGUAGE MODE) or foodName LIKE :search )"
                + " group by foodID";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("search","%"+ search + "%")
                    .executeAndFetch(Food.class);

        }
    }
    public static Optional<Food> findByID(int id) {
        String sql = "select * from food where foodID = :foodID";
        try (Connection con = DBUtils.getConnection()) {
            List<Food> list = con.createQuery(sql)
                    .addParameter("foodID", id)
                    .executeAndFetch(Food.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }
}
