package beans;

import Models.UserModel;

public class Feedback {

    private int id,userID;
    private String title,content;

    public Feedback() {
    }

    public Feedback(int id, int userID, String title, String content) {
        this.id = id;
        this.userID = userID;
        this.title = title;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public String getUsername(){
        return UserModel.getUsernamebyID(this.userID);
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", userID=" + userID +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
