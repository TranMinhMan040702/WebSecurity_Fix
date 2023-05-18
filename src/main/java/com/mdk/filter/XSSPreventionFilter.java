package com.mdk.filter;

import com.mdk.utils.XSSUtil;

import java.io.IOException;
import java.text.Normalizer;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;


public class XSSPreventionFilter implements Filter {
    class XSSRequestWrapper extends HttpServletRequestWrapper {

        private Map<String, String[]> sanitizedQueryString;

        public XSSRequestWrapper(HttpServletRequest request) {
            super(request);
        }

        //QueryString overrides

        @Override
        public String getParameter(String name) {
            String parameter = null;
            String[] vals = getParameterMap().get(name);

            if (vals != null && vals.length > 0) {
                parameter = vals[0];
            }

            return parameter;
        }

        @Override
        public String[] getParameterValues(String name) {
            return getParameterMap().get(name);
        }

        @Override
        public Enumeration<String> getParameterNames() {
            return Collections.enumeration(getParameterMap().keySet());
        }

        @SuppressWarnings("unchecked")
        @Override
        public Map<String,String[]> getParameterMap() {
            if(sanitizedQueryString == null) {
                Map<String, String[]> res = new HashMap<String, String[]>();
                Map<String, String[]> originalQueryString = super.getParameterMap();
                if(originalQueryString!=null) {
                    for (String key : (Set<String>) originalQueryString.keySet()) {
                        String[] rawVals = originalQueryString.get(key);
                        String[] snzVals = new String[rawVals.length];
                        for (int i=0; i < rawVals.length; i++) {
                            snzVals[i] = XSSUtil.stripXSS(rawVals[i]);
                            System.out.println("Sanitized: " + rawVals[i] + " to " + snzVals[i]);
                        }
                        res.put(XSSUtil.stripXSS(key), snzVals);
                    }
                }
                sanitizedQueryString = res;
            }
            return sanitizedQueryString;
        }


    }

    @Override
    public void destroy() {
        System.out.println("XSSPreventionFilter: destroy()");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse)response;
        res.setHeader("X-Content-Type-Options", "nosniff");
        XSSRequestWrapper wrapper = new XSSRequestWrapper((HttpServletRequest)request);
        chain.doFilter(wrapper, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("XSSPreventionFilter: init()");
    }
}
