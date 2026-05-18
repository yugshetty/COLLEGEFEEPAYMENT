package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;

import dao.FeePaymentDAO;
import model.FeePayment;

public class AddFeePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        try {
            FeePayment f = new FeePayment();

            f.setStudentId(Integer.parseInt(req.getParameter("studentId")));
            f.setStudentName(req.getParameter("studentName"));

            String dateStr = req.getParameter("paymentDate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            f.setPaymentDate(sdf.parse(dateStr));

            double amount = Double.parseDouble(req.getParameter("amount"));

            if(amount < 0){
                res.getWriter().println("<h3 style='color:red'>Amount cannot be negative!</h3>");
                return;
            }

            f.setAmount(amount);
            f.setStatus(req.getParameter("status"));

            FeePaymentDAO dao = new FeePaymentDAO();
            dao.addPayment(f);

            res.sendRedirect("display");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
