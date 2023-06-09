package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.DBConnection;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/authors")

public class Author extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<sprint1.db.Author> authors = DBConnection.getAuthors();
        req.setAttribute("authors", authors);

        req.getRequestDispatcher("author-sprint1.jsp").forward(req, resp);
    }
}
