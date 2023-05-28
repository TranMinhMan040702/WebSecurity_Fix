package com.mdk.filter;

import com.mdk.models.User;
import com.mdk.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.mdk.utils.AppConstant.*;

public class AuthorizationFilter implements Filter {
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;

        HttpServletResponse res = (HttpServletResponse)response;
        res.setHeader("X-Content-Type-Options", "nosniff");
        res.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self'; style-src 'self'; img-src https:");
        String url = req.getRequestURL().toString();
        if (url.contains("admin")) {
            checkAuthor(request, response, chain, ADMIN);
        } else if (url.contains("web") || url.contains("vendor")){
            checkAuthor(request, response, chain, USER);
        } else {
            chain.doFilter(request, response);
        }
    }

    protected void checkAuthor(ServletRequest request, ServletResponse response, FilterChain chain, String role) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User model = (User) SessionUtil.getInstance().getValue(req, USER_MODEL);
        if (model != null) {
            if (model.getRole().equals(role)) {
                chain.doFilter(request,response);
            } else {
                // no permission
                resp.sendRedirect(req.getContextPath() + "/login?message=login_no_permission");
            }
        } else {
            // request login
            resp.sendRedirect(req.getContextPath() + "/login?message=login_no");
        }
    }

    @Override
    public void destroy() {
    }
}
