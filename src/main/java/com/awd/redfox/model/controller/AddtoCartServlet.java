package com.awd.redfox.model.controller;

import com.awd.redfox.model.beans.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "AddtoCartServlet", value = "/AddtoCart")
public class AddtoCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try(PrintWriter out = response.getWriter()) {
            ArrayList<Cart> cartList =new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            Cart cn = new Cart();
            cn.setmID(id);
            cn.setQuantity(1);

            //create a session
            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cart_list==null){
                cartList.add(cn);
                session.setAttribute("cart-list",cartList);
                response.sendRedirect("index.jsp");
            }else {
                cartList=cart_list;
                boolean exist = false;
                for (Cart c:cart_list){
                    if (c.getmID() == id){
                        exist = true;
                        out.println("<h3 style = 'color:crimson; text-align:center'>Item already exist in cart.<a href='cart.jsp'>GO TO CART</a></h3>");
                    }
                }
                if (!exist){
                    cartList.add(cn);
                    response.sendRedirect("index.jsp");

                }

            }


        }
    }
}
