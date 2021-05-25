package beans;

import com.google.gson.annotations.SerializedName;

public class Nutrients {
    private int nutritionID;
    private String nutritionName;
    private String source;
    private String benefit;
    private String advice;

    public Nutrients(int nutritionID, String nutritionName, String source, String benefit, String advice) {
        this.nutritionID = nutritionID;
        this.nutritionName = nutritionName;
        this.source = source;
        this.benefit = benefit;
        this.advice = advice;
    }

    public int getNutritionID() {
        return nutritionID;
    }

    public void setNutritionID(int nutritionID) {
        this.nutritionID = nutritionID;
    }

    public String getNutritionName() {
        return nutritionName;
    }

    public void setNutritionName(String nutritionName) {
        this.nutritionName = nutritionName;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getBenefit() {
        return benefit;
    }

    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    @Override
    public String toString() {
        return "Nutrients{" +
                "nutritionID=" + nutritionID +
                ", nutritionName='" + nutritionName + '\'' +
                ", source='" + source + '\'' +
                ", benefit='" + benefit + '\'' +
                ", advice='" + advice + '\'' +
                '}';
    }
}
