package beans;

public class User {

    int userID,role,age;
    String userName,password,fullName;
    double height,weight;
    boolean sex;

    public User() {
    }

    public User(int userID, int role, int age, String userName, String password, String fullName, double height, double weight, boolean sex) {
        this.userID = userID;
        this.role = role;
        this.age = age;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.height = height;
        this.weight = weight;
        this.sex = sex;
    }



    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "User {" +
                "userid=" + userID +
                ", username='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", name='" + fullName + '\'' +
                ", age='" + age + '\'' +
                ", height=" + height +
                ", weight=" + weight +
                ", sex=" + sex +
                ", role=" + role +
                '}';
    }
}
