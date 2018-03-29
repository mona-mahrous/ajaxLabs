/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GHarieb
 */
public class chatServlet1 extends HttpServlet {

    static Vector<jMessage> messages;

    @Override
    public void init() throws ServletException {
        super.init();
        messages = new Vector<jMessage>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("in get method");
        //1. Get request parameters
        String username = request.getParameter("name");
        String message = request.getParameter("msg");
        // 2. make a new jMessage object
        jMessage newmsg = new jMessage();
        newmsg.user_name = username;
        newmsg.body = message;
        //3. add to the msgs vector 
        messages.add(newmsg);
        // 4. return done response
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print("done");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in post method");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        if(messages.size()!=0){
        Gson msgs = new Gson();
        out.print(msgs.toJson(messages));
        System.out.println(msgs.toJson(messages));
        }
        else 
            out.print("0");
            

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
