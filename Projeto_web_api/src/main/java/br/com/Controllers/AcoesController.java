package br.com.Controllers;

import br.com.HandleApi.RequestAPI;
import br.com.model.Investimento;
import br.com.model.Resposta;
import com.google.gson.Gson;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/acoes")
public class AcoesController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RequestAPI requisicao = new RequestAPI();
            Gson gson = new Gson();
            JSONObject my_obj = new JSONObject(requisicao.getRequest());
            Resposta resposta = gson.fromJson(requisicao.getRequest(), Resposta.class);
            request.setAttribute("acoes", my_obj);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("SaquePersonalizado.jsp");
            requestDispatcher.forward(request, response);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
