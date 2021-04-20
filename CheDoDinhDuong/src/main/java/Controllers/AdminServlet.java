package Controllers;

import Models.CategoryModel;
import Models.FoodModel;
import Utilties.ServletUtils;
import beans.Category;
import beans.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "AdminServlet", urlPatterns = "/Admin/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String path = request.getPathInfo();
        switch (path){
            case "/AddFood":
                addNewFood(request,response);
                break;
            case "/DeleteFood":
                deleteFood(request,response);
                break;
            case "/EditFood":
                editFood(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }

    private void addNewFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String foodName = request.getParameter("foodname");
        String catname = request.getParameter("catname");
        String glucozo = request.getParameter("glucozo");
        String kcal = request.getParameter("kcal");
        String lipit = request.getParameter("lipit");
        String protein = request.getParameter("protein");
        String vitaminA = request.getParameter("vitaminA");
        String vitaminB = request.getParameter("vitaminB");
        String vitaminC = request.getParameter("vitaminC");
        String vitaminD = request.getParameter("vitaminD");
        String vitaminE = request.getParameter("vitaminE");
        String kali = request.getParameter("kali");
        String fe = request.getParameter("fe");
        String natri = request.getParameter("natri");
//        System.out.println(CategoryModel.getCatIDByCatName(catname));
//        System.out.println(catname);
        String imgurl="";
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            //System.out.println(contentDisp);
            String[] items = contentDisp.split(";");
            for(String s : items){
                String tmp = s.trim();
                if (tmp.startsWith("filename")){
                    int idx = tmp.indexOf('=') + 2;
                    String filename = tmp.substring(idx, tmp.length() - 1);
                    String targetDir = this.getServletContext().getRealPath("Public/Imgs/Food");
                    String destination = targetDir + "/" + filename;
//                    System.out.println(destination);
                    part.write(destination);
                    imgurl ="/Public/Imgs/Food/"+ filename;
                }
            }
        }
//        String a= request.getContextPath();
//        System.out.println(a);
        FoodModel.addNewFood(foodName, CategoryModel.getCatIDByCatName(catname),glucozo,kcal,lipit,protein,
                vitaminA,vitaminB,vitaminC,vitaminD,vitaminE,kali,fe,natri,imgurl);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        FoodModel.deleteFood(foodID);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    private void editFood(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        String foodName = request.getParameter("foodname");
        String catname = request.getParameter("catname");
        String glucozo = request.getParameter("glucozo");
        String kcal = request.getParameter("kcal");
        String lipit = request.getParameter("lipit");
        String protein = request.getParameter("protein");
        String vitaminA = request.getParameter("vitaminA");
        String vitaminB = request.getParameter("vitaminB");
        String vitaminC = request.getParameter("vitaminC");
        String vitaminD = request.getParameter("vitaminD");
        String vitaminE = request.getParameter("vitaminE");
        String kali = request.getParameter("kali");
        String fe = request.getParameter("fe");
        String natri = request.getParameter("natri");
        String imgurl = request.getParameter("urlimg");
        FoodModel.updateFood(foodID,foodName,CategoryModel.getCatIDByCatName(catname),glucozo,kcal,lipit,protein,
                vitaminA,vitaminB,vitaminC,vitaminD,vitaminE,kali,fe,natri,imgurl);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Home";
        }
        switch (path){
            case "/Home":
                ServletUtils.forward("/Views/vwAdmin/index.jsp",request,response);
                break;
            case "/FoodManagement":
                List<Food> lstFood = FoodModel.getAll();
                request.setAttribute("lstFood", lstFood);
                List<Category> lstCat = CategoryModel.getAll();
                request.setAttribute("lstCat", lstCat);
                ServletUtils.forward("/Views/vwAdmin/foodmanagement.jsp",request,response);
                break;
            case "/MenuManagement":
                ServletUtils.forward("/Views/vwAdmin/menumanagement.jsp",request,response);
                break;
            case "/EditFood":
                List<Category> listCat = CategoryModel.getAll();
                int foodID = Integer.parseInt(request.getParameter("id"));
                Optional<Food> c = FoodModel.findByID(foodID);
                if (c.isPresent()) {
                    request.setAttribute("lstCat",listCat);
                    request.setAttribute("food", c.get());
                    ServletUtils.forward("/Views/vwAdmin/editfood.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/MenuManagement", request, response);
                }
                break;
            case "/NewFood":
                ServletUtils.forward("/Views/vwAdmin/newfood.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
