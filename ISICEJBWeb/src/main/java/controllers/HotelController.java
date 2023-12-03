package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.hotel.IDaoLocale;
import entities.Hotel;
import entities.Ville;

/**
 * Servlet implementation class VilleController
 */
@WebServlet("/hotelController")
public class HotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IDaoLocale<Hotel> ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Create new city
            String nom = request.getParameter("hotel");
            String adresse = request.getParameter("hotel");
            String telephone = request.getParameter("hotel");
            ejb.create(new Hotel(nom,adresse,telephone));
        } else if ("delete".equals(action)) {
            // Delete city
            int hotelId = Integer.parseInt(request.getParameter("id"));
            Hotel hotelToDelete = ejb.findById(hotelId);
            ejb.delete(hotelToDelete);
        } else if ("update".equals(action)) {
            // Update city
            int hotelId = Integer.parseInt(request.getParameter("id"));
            String updatedNom = request.getParameter("updatedHotel");
            String updatedAdresse = request.getParameter("updatedHotel");
            String updatedTelephone = request.getParameter("updatedHotel");
            Hotel updatedHotel = new Hotel(updatedNom,updatedAdresse,updatedTelephone);
            updatedHotel.setId(hotelId);
            ejb.update(updatedHotel);
        }

        // Retrieve and display the list of cities
        request.setAttribute("hotels", ejb.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}