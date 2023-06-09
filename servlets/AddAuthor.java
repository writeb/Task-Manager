package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.Author;
import sprint1.db.DBConnection;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/add-author")

public class AddAuthor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null) {
            if (user.getRole() == 1) {
                String first = req.getParameter("author_fname");
                String last = req.getParameter("author_lname");

                Author author = new Author();
                author.setFirst_name(first);
                author.setLast_name(last);

                DBConnection.addAuthor(author);
                resp.sendRedirect("authors");
            } else {
                req.getRequestDispatcher("403-sprint1.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("/login");
        }
    }
}
