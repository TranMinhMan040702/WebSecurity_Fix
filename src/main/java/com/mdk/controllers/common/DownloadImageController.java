package com.mdk.controllers.common;

import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Paths;

import static com.mdk.utils.AppConstant.UPLOAD_PRODUCT_DIRECTORY;
import static com.mdk.utils.AppConstant.UPLOAD_STORE_DIRECTORY;
import static com.mdk.utils.AppConstant.UPLOAD_USER_DIRECTORY;

@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fname");
        String type = req.getParameter("type");
        String path = "";
        if (type.equals("store")){
            path = UPLOAD_STORE_DIRECTORY + "/";
        } else if (type.equals("product")) {
            path = UPLOAD_PRODUCT_DIRECTORY + "/";
        } else if (type.equals("user"))
        	path = UPLOAD_USER_DIRECTORY + "/";
        String safePath = path + sanitizePath(fileName);

        File file = new File(safePath);
        if (file.exists()) {
            resp.setContentType("image/*");
            IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
        }
        
    }
    public static String sanitizePath(String path) {
        String sanitizedPath = path.replaceAll("[^a-zA-Z0-9.]", "");
        return sanitizedPath;
    }
}
