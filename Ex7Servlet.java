import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Cookie[] cookies = request.getCookies();
        String storedUsername = null;
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    storedUsername = cookie.getValue();
                }
            }
        }
        
        String newUsername = request.getParameter("username");
        if (newUsername != null && !newUsername.trim().isEmpty()) {
            Cookie cookie = new Cookie("username", newUsername);
            cookie.setMaxAge(60 * 60);
            response.addCookie(cookie);
            storedUsername = newUsername;
        }
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Cookie Tracking</title>");
        out.println("<style>");
        out.println("body { margin:0; min-height:100vh; font-family:Arial; background:#eef2f7; display:flex; justify-content:center; align-items:center; }");
        out.println(".box { width:520px; background:skyblue; padding:40px; border-radius:14px; box-shadow:0 8px 25px rgba(0,0,0,0.15); text-align:center; }");
        out.println("input { padding: 11px; width:250px; }");
        out.println("button { padding: 11px 22px; margin-top:15px; cursor:pointer; }");
        out.println("a { display:inline-block; margin-top:20px; text-decoration:none; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='box'>");
        out.println("<h1>Cookie Tracking</h1>");
        
        if (storedUsername == null) {
            out.println("<p>Enter a username to create a cookie.</p>");
            out.println("<form method='get' action='CookieServlet'>");
            out.println("<input type='text' name='username' placeholder='Enter username' required>");
            out.println("<br>");
            out.println("<button type='submit'>Create Cookie</button>");
            out.println("</form>");
        } else {
            out.println("<h2>Cookie Retrieved Successfully</h2>");
            out.println("<p>Stored Username:</p>");
            out.println("<h2>" + storedUsername + "</h2>");
            out.println("<p>The username was retrieved from the browser cookie.</p>");
            out.println("<a href='CookieServlet'>Read Cookie Again</a>");
        }
        
        out.println("<br>");
        out.println("<a href='index.html'>Back to Home</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}
