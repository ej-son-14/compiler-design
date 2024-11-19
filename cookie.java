import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.http.Cookie;


public class cookie extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String depart = request.getParameter("dept");


        Cookie nameCookie = new Cookie("name", name);
        nameCookie.setMaxAge(3600);
        response.addCookie(nameCookie);

        // Role cookie
        Cookie ageCookie = new Cookie("age", age);
        ageCookie.setMaxAge(3600);
        response.addCookie(ageCookie);

        // Preferences cookie
        Cookie deptCookie = new Cookie("department", depart);
        deptCookie.setMaxAge(3600);
        response.addCookie(deptCookie);

        response.sendRedirect("home.html");
	
    }
}