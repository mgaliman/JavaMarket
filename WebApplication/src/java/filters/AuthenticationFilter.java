/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mgaliman
 */
public class AuthenticationFilter implements Filter {

    private static final String[] LOGINREQUIREDURLS = {
        "/categoryEditor.jsp", "/checkout.jsp", "/history.jsp",
        "/paymentReceipt.jsp", "/productEditor.jsp", "/purchaseHistory.jsp",
        "/reviewPayment.jsp", "/deliveryInfo.jsp", "/CategoryServlet", "/CheckoutServlet", "/HistoryServlet",
        "/PaymentReceiptServlet", "/ProductServlet", "/PurchaseHistoryServlet",
        "/ReviewPaymentServlet", "/DeliveryServlet"
    };
    private HttpServletRequest httpRequest;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        httpRequest = (HttpServletRequest) request;

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("userAccount") != null);

        if (!isLoggedIn && isLoginRequired()) {
            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher("login");
            dispatcher.forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    private boolean isLoginRequired() {
        String requestURL = httpRequest.getRequestURL().toString();

        for (String loginRequiredURL : LOGINREQUIREDURLS) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }

        return false;
    }

    public AuthenticationFilter() {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }
}
