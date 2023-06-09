package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.DBConnection;
import sprint1.db.News;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/news")

public class NewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String key = req.getParameter("key");

        if (key!=null){
            ArrayList<News> news = DBConnection.searchNews("%"+ key +"%");
            req.setAttribute("news", news);
        } else {
            ArrayList<News> news = DBConnection.getNews();
            req.setAttribute("news", news);
        }



        req.getRequestDispatcher("news-sprint1.jsp").forward(req, resp);
    }
}
