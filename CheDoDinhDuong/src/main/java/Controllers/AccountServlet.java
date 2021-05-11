package Controllers;

import Models.UserModel;
import Utilties.ServletUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.User;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                postRegister(request, response);
                break;
            case "/Login":
                postLogin(request, response);
                break;
            case "/Logout":
                postLogout(request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }

    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");
        if (url == null) url = "/Home";
        ServletUtils.redirect(url, request, response);

    }

    private void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usernamelogin = request.getParameter("emaillogin");
        String passwordlogin = request.getParameter("passwordlogin");

        Optional<User> user = UserModel.findByUserName(usernamelogin);

        if (user.isPresent()) {
            BCrypt.Result resultlogin = BCrypt.verifyer().verify(passwordlogin.toCharArray(), user.get().getPassword());
            if (resultlogin.verified) {

                HttpSession session = request.getSession();
                session.setAttribute("auth",true);
                session.setAttribute("authUser",user.get());

                String url = (String) session.getAttribute("retUrl");
                if(url ==null){
                    url = "/Home";
                }
                ServletUtils.redirect(url,request,response);

            }else {
                request.setAttribute("hasError",true);
                request.setAttribute("errorMessage","Invalid password");
                ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
            }
        }else {
            request.setAttribute("hasError",true);
            request.setAttribute("errorMessage","Invalid login");
            ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
        }
    }

    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());


        String username = request.getParameter("username");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));

        boolean sex ;
        String sexx =  (request.getParameter("sex"));
        if(sexx=="Female") {
            sex=true;
        }else
            sex=false;

        System.out.println(sex);
        System.out.println(sexx);
        double height = 0;
        double weight = 0;
        int role=1;
        User user = new User(-1,role,age,username,bcryptHashString,name,height,weight,sex);

        UserModel.add(user);
        ServletUtils.redirect("/Home",request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null){
            path="/Profile";
        }
        switch (path){
            case "/Profile":
                ServletUtils.forward("/Views/vwAccount/profile.jsp",request,response);
                break;
            case "/ProfileSetting":
                ServletUtils.forward("/Views/vwAccount/profilesetting.jsp",request,response);
                break;
            case "/Login":
                request.setAttribute("hasError", false);

                ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
                break;
            case "/Register":
                ServletUtils.forward("/Views/vwAccount/register.jsp",request,response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("user");
                Optional<User> user = UserModel.findByUserName(username);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(!user.isPresent());
                out.flush();
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
