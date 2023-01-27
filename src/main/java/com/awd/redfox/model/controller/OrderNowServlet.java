package com.awd.redfox.model.controller;

import com.awd.redfox.data.DbCon;
import com.awd.redfox.model.beans.Cart;
import com.awd.redfox.model.beans.Order;
import com.awd.redfox.model.beans.User;
import com.awd.redfox.model.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "OrderNowServlet", value = "/OrderNow")
public class OrderNowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");

            if (auth != null) {
                String movieId = request.getParameter("id");
                int mQuantity = 1;

                Order orderModel = new Order();
                orderModel.setOrderId(Integer.parseInt(movieId));
                orderModel.setUid(auth.getuID());
                orderModel.setQunatity(mQuantity);
                orderModel.setDate(formatter.format(date));

                OrderDAO orderDao = new OrderDAO(DbCon.getConnection());
                boolean result = OrderDAO.insertOrder(orderModel);
                if (result) {
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        for (Cart c : cart_list) {
                            if (c.getmID() == Integer.parseInt(movieId)) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("orders.jsp");
                } else {
                    out.println("order failed");
                }
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}