package br.com.servelet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//@WebServlet("index.jsp")
@WebServlet("/index")
public class indexServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("products", products); // Will be available as ${products} in JSP
        request.getRequestDispatcher("/src/main/webapp/index.jsp").forward(request, response);
    }
}
