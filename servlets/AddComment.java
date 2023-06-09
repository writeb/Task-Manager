package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.Comment;
import sprint1.db.DBConnection;
import sprint1.db.News;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/add-comment")

public class AddComment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("currentUser");

        if (user!=null) {
            String text = req.getParameter("comment");
            int newsId = Integer.parseInt(req.getParameter("news_id"));

            News news = DBConnection.getNewsId(newsId);
            if (news!=null){
                Comment comment = new Comment();
                comment.setComment(text);
                comment.setUser(user);
                comment.setNews(news);

                DBConnection.addComment(comment);
                resp.sendRedirect("/news-details?id=" + newsId);

            } else {
                resp.sendRedirect("/home-sprint1");
            }

        } else {
            resp.sendRedirect("/login");
        }

    }
}
