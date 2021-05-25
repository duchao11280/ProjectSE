package Models;

import Utilties.DBUtils;
import beans.Category;
import beans.Feedback;
import beans.User;
import org.sql2o.Connection;

import java.util.List;

public class FeedbackModel {

    public static void add(Feedback feedback) {
        final String sql = "insert into feedback (title,content,userID) VALUES(:title,:content,:userID)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("title", feedback.getTitle())
                    .addParameter("content", feedback.getContent())
                    .addParameter("userID", feedback.getUserID())
                    .executeUpdate();
        }
    }

    public static List<Feedback> getAllFeedback() {
        final String sql = "select * from feedback";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Feedback.class);
        }
    }

    public static void deleteFeed(int id){
        final String sql = "delete from feedback WHERE id=:cc";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("cc", id)
                    .executeUpdate();
        }
    }

}
