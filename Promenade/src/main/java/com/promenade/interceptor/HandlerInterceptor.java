package com.promenade.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sun.istack.internal.Nullable;



public class HandlerInterceptor extends HandlerInterceptorAdapter{

	private static Logger logger = LoggerFactory.getLogger(HandlerInterceptor.class);
	private long startTime = 0L;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		startTime = System.nanoTime();
		logger.info("[preHandle(Start))]==================================================[{}]", request.getRequestURI());
		logger.info("[remoteHost={}/remoteAddr={}]", request.getRemoteHost(), request.getRemoteAddr());
	
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,  @Nullable ModelAndView modelAndView) throws Exception {
		logger.info("[postHandle(servlet end)]=============================================[{}]", request.getRequestURI());
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		double elapsedTime = Math.round((System.nanoTime() - startTime) / 1000000.00);
		logger.debug("[Total elapsedTime : {}ms]", elapsedTime);
		logger.info("[afterCompletion(End)]===============================================[{}]", request.getRequestURI());
		super.afterCompletion(request, response, handler, ex);
	}

}
