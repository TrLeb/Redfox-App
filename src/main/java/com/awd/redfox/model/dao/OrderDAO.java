package com.awd.redfox.model.dao;

import com.awd.redfox.model.beans.Movie;
import com.awd.redfox.model.beans.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private static Connection con;

    private static String query;
    private static PreparedStatement pst;
    private ResultSet rs;



    public OrderDAO(Connection con) {
        super();
        this.con = con;
    }

    public static boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (mID, uID,oDate,oQuantity ) values(?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setInt(1, model.getmID());
            pst.setInt(2, model.getUid());
            pst.setString(3, model.getDate());
            pst.setInt(4, model.getQunatity());

            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where uID=? order by orders.oID desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                MovieDAO movieDAO = new MovieDAO(this.con);
                int mID = rs.getInt("mID");
                Movie movie = movieDAO.getSingleMovie(mID);
                order.setOrderId(rs.getInt("o_id"));
                order.setmID(mID);
                order.setTitle(movie.getTitle());
                order.setGenre(movie.getGenre());
                order.setPrice(movie.getPrice());
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where oID=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
