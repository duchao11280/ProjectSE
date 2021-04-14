package Models;

import Utilties.DBUtils;
import beans.User;
import org.sql2o.Connection;

import java.util.List;
import java.util.Optional;

public class UserModel {

    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from user where userName = :username";
        try (Connection con = DBUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }

    public static void add(User user) {
        final String sql = "Call sp_addNewUser(:username,:password,:role,:name,:age,:height,:weight,:sex)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUserName())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getFullName())
                    .addParameter("role", user.getRole())
                    .addParameter("age", user.getAge())
                    .addParameter("height", user.getHeight())
                    .addParameter("weight", user.getWeight())
                    .addParameter("sex", user.isSex())
                    .executeUpdate();
        }
    }

}
