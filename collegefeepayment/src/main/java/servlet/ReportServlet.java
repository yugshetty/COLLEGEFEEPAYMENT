package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import dao.FeePaymentDAO;
import model.FeePayment;

public class ReportServlet extends HttpServlet {

    // ================= POST (ALL FILTERS) =================
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String type = req.getParameter("type");
            FeePaymentDAO dao = new FeePaymentDAO();

            // 🔹 SEARCH BY STUDENT ID
            if ("byid".equals(type)) {

                int studentId = Integer.parseInt(req.getParameter("studentId"));
                FeePayment f = dao.getByStudentId(studentId);

                req.setAttribute("single", f);
            }

            // 🔹 PAID STUDENTS
            else if ("paid".equals(type)) {

                List<FeePayment> list = dao.getPaidStudents();
                req.setAttribute("list", list);
            }

            // 🔹 PENDING STUDENTS
            else if ("pending".equals(type)) {

                List<FeePayment> list = dao.getPendingStudents();
                req.setAttribute("list", list);
            }

            // 🔹 OLD FEATURE: OVERDUE
            else if ("overdue".equals(type)) {

                List<FeePayment> list = dao.getOverduePayments();
                req.setAttribute("list", list);
            }

            // 🔹 OLD FEATURE: NOT PAID BETWEEN DATES
            else if ("notpaid".equals(type)) {

                String from = req.getParameter("fromDate");
                String to = req.getParameter("toDate");

                List<FeePayment> list = dao.getNotPaid(from, to);
                req.setAttribute("list", list);

                // pass dates to JSP
                req.setAttribute("fromDate", from);
                req.setAttribute("toDate", to);
            }

            req.setAttribute("type", type);

            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= GET (TOTAL COLLECTION) =================
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            FeePaymentDAO dao = new FeePaymentDAO();

            double total = dao.getTotalCollectionAll();

            req.setAttribute("type", "total");
            req.setAttribute("total", total);

            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }}
