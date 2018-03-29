/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
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
public class chat extends HttpServlet {

   static  Vector<jMessage> messages;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        messages=new Vector<jMessage>();
    }
   
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet chat</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet chat at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        response.setContentType("text/html");
          PrintWriter out = response.getWriter();
         String op=request.getParameter("getid");
       System.out.println(messages.size());
       out.println("<table>");
       for(int i=0;i<messages.size();i++){
        
         out.println("<tr> <td>"+messages.elementAt(i).user_name+" : "+ messages.elementAt(i).body+"<br></td></tr>");
        
         System.out.print(messages.elementAt(i).user_name+"and the messge is  "+ messages.elementAt(i).body);
       }
       out.println("</table>");

    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        System.out.println("recieved");
        String username=request.getParameter("userName");
        String message=request.getParameter("message");
        jMessage newmsg=new jMessage();
        newmsg.user_name=username;
        newmsg.body=message;
        newmsg.msg_id=messages.size()-1;
        messages.add(newmsg);
        System.out.println(username+"   "+message);
        
        
    }

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
