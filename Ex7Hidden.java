import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HiddenFormServlet")
public class HiddenFormServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String hiddenUsername = request.getParameter("hiddenUsername");
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Hidden Form Field</title>");
        out.println("<style>");
        out.println("body { margin:0; min-height:100vh; font-family:Arial; background:#EEF2F7; display:flex; justify-content:center; align-items:center; }");
        out.println(".box { width:520px; background:skyblue; padding:40px; border-radius:14px; box-shadow:0 8px 25px rgba(0,0,0,0.15); text-align:center; }");
        out.println("input { padding: 11px; width:250px; }");
        out.println("button { padding: 11px 22px; margin-top:15px; cursor:pointer; }");
        out.println("a { display:inline-block; margin-top:20px; text-decoration:none; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='box'>");
        out.println("<h1>Hidden Form Field</h1>");
        
        if (hiddenUsername != null && !hiddenUsername.trim().isEmpty()) {
            out.println("<h2>Hidden Data Retrieved</h2>");
            out.println("<p>Username:</p>");
            out.println("<h2>" + hiddenUsername + "</h2>");
            out.println("<p>The value was transferred using a hidden form field.</p>");
        } else if (username != null && !username.trim().isEmpty()) {
            out.println("<h2>Hidden Field Created</h2>");
            out.println("<p>Username: <b>" + username + "</b></p>");
            out.println("<form method='get' action='HiddenFormServlet'>");
            out.println("<input type='hidden' name='hiddenUsername' value='" + username + "'>");
            out.println("<p>The username is now stored inside a hidden field.</p>");
            out.println("<button type='submit'>Submit Hidden Data</button>");
            out.println("</form>");
        } else {
            out.println("<p>Enter username to create a hidden form field.</p>");
            out.println("<form method='get' action='HiddenFormServlet'>");
            out.println("<input type='text' name='username' placeholder='Enter username' required>");
            out.println("<br>");
            out.println("<button type='submit'>Continue</button>");
            out.println("</form>");
        }
        
        out.println("<br>");
        out.println("<a href='index.html'>Back to Home</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}
