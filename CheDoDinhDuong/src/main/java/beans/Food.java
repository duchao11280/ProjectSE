package beans;

public class Food {
    int foodID;
    String foodName,urlImage;
    int catID;
    float glucozo,kcal,lipit,protein,vitA,vitB,vitC,vitD,vitE,kali,fe,na;

    public Food(int foodID, String foodName, String urlImage, int catID, float glucozo, float kcal,
                float lipit, float protein, float vitA, float vitB, float vitC, float vitD, float vitE,
                float kali, float fe, float na) {
        this.foodID = foodID;
        this.foodName = foodName;
        this.urlImage = urlImage;
        this.catID = catID;
        this.glucozo = glucozo;
        this.kcal = kcal;
        this.lipit = lipit;
        this.protein = protein;
        this.vitA = vitA;
        this.vitB = vitB;
        this.vitC = vitC;
        this.vitD = vitD;
        this.vitE = vitE;
        this.kali = kali;
        this.fe = fe;
        this.na = na;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public float getGlucozo() {
        return glucozo;
    }

    public void setGlucozo(float glucozo) {
        this.glucozo = glucozo;
    }

    public float getKcal() {
        return kcal;
    }

    public void setKcal(float kcal) {
        this.kcal = kcal;
    }

    public float getLipit() {
        return lipit;
    }

    public void setLipit(float lipit) {
        this.lipit = lipit;
    }

    public float getProtein() {
        return protein;
    }

    public void setProtein(float protein) {
        this.protein = protein;
    }

    public float getVitA() {
        return vitA;
    }

    public void setVitA(float vitA) {
        this.vitA = vitA;
    }

    public float getVitB() {
        return vitB;
    }

    public void setVitB(float vitB) {
        this.vitB = vitB;
    }

    public float getVitC() {
        return vitC;
    }

    public void setVitC(float vitC) {
        this.vitC = vitC;
    }

    public float getVitD() {
        return vitD;
    }

    public void setVitD(float vitD) {
        this.vitD = vitD;
    }

    public float getVitE() {
        return vitE;
    }

    public void setVitE(float vitE) {
        this.vitE = vitE;
    }

    public float getKali() {
        return kali;
    }

    public void setKali(float kali) {
        this.kali = kali;
    }

    public float getFe() {
        return fe;
    }

    public void setFe(float fe) {
        this.fe = fe;
    }

    public float getNa() {
        return na;
    }

    public void setNa(float na) {
        this.na = na;
    }
}
