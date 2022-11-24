package com.bulletinboardpic.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet("/uploadFile.do")
public class UploadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String saveDirectory = "/images_uploaded"; // 上傳檔案的目的地目錄;
    // 將由底下的第26~30行用 java.io.File 於 ContextPath 之下, 自動建立目地目錄

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("Big5"); // 處理中文檔名
        res.setContentType("text/html; charset=Big5");
        PrintWriter out = res.getWriter();
        System.out.println("ContentType="+req.getContentType()); // 測試用

        String realPath = getServletContext().getRealPath(saveDirectory);
        System.out.println("realPath="+realPath); // 測試用
        File fsaveDirectory = new File(realPath);
        if (!fsaveDirectory.exists())
            fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄

        Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
        out.write("<h2> Total parts : " + parts.size() + "</h2>");

        for (Part part : parts) { // filename!= null 需要文字+圖片上傳用
            String filename = part.getSubmittedFileName();
            if (filename!= null && filename.length()!=0 && part.getContentType()!=null) {
                out.println("<PRE>");
                out.println("name: " + part.getName());
                out.println("filename: " + filename);
                out.println("ContentType: " + part.getContentType());
                out.println("size: " + part.getSize());

                File f = new File(fsaveDirectory, filename);
                out.println("File: " + f);

                // 利用File物件,寫入目地目錄,上傳成功
                part.write(f.toString());

                // 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
//				InputStream in = part.getInputStream();
//				byte[] buf = new byte[in.available()];   // byte[] buf = in.readAllBytes();  // Java 9 的新方法
//				in.read(buf);
//				in.close();
//				out.println("buffer length: " + buf.length);

                // 額外測試秀圖
                out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");

                out.println();
                out.println("</PRE>");
            }
        }
    }
}
