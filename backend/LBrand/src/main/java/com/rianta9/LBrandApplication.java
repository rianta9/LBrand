package com.rianta9;

import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.cksource.ckfinder.servlet.CKFinderServlet;

@SpringBootApplication
public class LBrandApplication implements ServletContextInitializer, WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(LBrandApplication.class, args);
	}

	@Override
	public void onStartup(ServletContext servletContext) {
		// Register the CKFinder's servlet.
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("ckfinder", new CKFinderServlet());
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/ckfinder/*");
		dispatcher.setInitParameter("scan-path", "com.rianta9.ckfinder");

		FilterRegistration.Dynamic filter = servletContext.addFilter("x-content-options", new Filter() {
			@Override
			public void init(FilterConfig filterConfig) {
			}

			@Override
			public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
					throws IOException, ServletException {
				((HttpServletResponse) response).setHeader("X-Content-Type-Options", "nosniff");
				chain.doFilter(request, response);
			}

			@Override
			public void destroy() {
			}
		});

		filter.addMappingForUrlPatterns(null, false, "/src/main/resources/static/uploads/*");

		String tempDirectory;

		try {
			tempDirectory = Files.createTempDirectory("ckfinder").toString();
		} catch (IOException e) {
			tempDirectory = null;
		}

		dispatcher.setMultipartConfig(new MultipartConfigElement(tempDirectory));
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// Configure the resource handler to serve files uploaded with CKFinder.
		String publicFilesDir = String.format("file:%s/src/main/resources/static/uploads/",
				System.getProperty("user.dir"));
		System.out.println("Public file dir:" + publicFilesDir);
		registry.addResourceHandler("/uploads/**").addResourceLocations(publicFilesDir);
	}

}
