/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.BorrowRecord;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author ADMIN
 */
public class BorrowDAO {

    public boolean borrowBook(int userId, int bookId) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String checkSql = "SELECT available_copies FROM books WHERE id = ?";
                PreparedStatement checkSt = cn.prepareStatement(checkSql);
                checkSt.setInt(1, bookId);
                ResultSet rs = checkSt.executeQuery();
                if (rs.next() && rs.getInt("available_copies") > 0) {
                    String sql = "INSERT INTO borrow_records (user_id, book_id, borrow_date, due_date, status) VALUES (?, ?, GETDATE(), DATEADD(day, 14, GETDATE()), 'borrowed')";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setInt(1, userId);
                    st.setInt(2, bookId);
                    int rows = st.executeUpdate();
                    if (rows > 0) {
                        String updateSql = "UPDATE books SET available_copies = available_copies - 1 WHERE id = ?";
                        PreparedStatement updateSt = cn.prepareStatement(updateSql);
                        updateSt.setInt(1, bookId);
                        updateSt.executeUpdate();
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean returnBook(int userId, int bookId) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE borrow_records "
                        + "SET return_date = GETDATE(), status = 'returned' "
                        + "WHERE user_id = ? AND book_id = ? AND status = 'borrowed'";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userId);
                st.setInt(2, bookId);
                int rows = st.executeUpdate();
                if (rows > 0) {
                    String updateSql = "UPDATE books "
                            + "SET available_copies = available_copies + 1 "
                            + "WHERE id = ?";
                    PreparedStatement updateSt = cn.prepareStatement(updateSql);
                    updateSt.setInt(1, bookId);
                    updateSt.executeUpdate();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public ArrayList<BorrowRecord> getBorrowHistory(int userId) {
        ArrayList<BorrowRecord> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT br.id, br.user_id, br.book_id, br.borrow_date, br.due_date, br.return_date, br.status, b.title "
                            + "FROM borrow_records br JOIN books b ON br.book_id = b.id "
                            + "WHERE br.user_id = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    BorrowRecord record = new BorrowRecord(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getDate("borrow_date"),
                        rs.getDate("due_date"),
                        rs.getDate("return_date"),
                        rs.getString("status")
                    );
                    result.add(record);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}