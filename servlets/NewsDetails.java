package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.Comment;
import sprint1.db.DBConnection;
import sprint1.db.News;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/news-details")


public class NewsDetails extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        News news = DBConnection.getNewsId(id);
        req.setAttribute("news", news);

        if (news!=null) {
            ArrayList<Comment> comments = DBConnection.getComments(news.getId());
            req.setAttribute("comments", comments);
        }

        req.getRequestDispatcher("news_details-sprint1.jsp").forward(req, resp);
    }
}
