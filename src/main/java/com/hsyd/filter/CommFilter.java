package com.hsyd.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/*
 *  公共处理过滤
 */
public class CommFilter implements Filter {
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest r = (HttpServletRequest) request;
        String uri = r.getRequestURI();
        System.out.println("请求路径:	" + uri);
        chain.doFilter(r, response);
    }
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
    }
}
