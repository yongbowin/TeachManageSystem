package com.admin;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownLoadAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String contentType;
	private long contentLength;
	private String contentDisposition;
	private InputStream inputStream;
	
	//实际为文件的名称
	private String filePath;
	
	@Override
	public String execute() throws Exception {
		
		filePath = new String(filePath.getBytes("ISO-8859-1"), "utf-8");
		
		//确定各个成员变量的值
		contentType = "text/plain";
		contentDisposition = "attachment;filename=" + new String(filePath.getBytes(), "ISO-8859-1");
		
		ServletContext servletContext = 
				ServletActionContext.getServletContext();
		String fileName = servletContext.getRealPath("/res_file/" + filePath);
		inputStream = new FileInputStream(fileName);
		contentLength = inputStream.available();
		
		return SUCCESS;
	}

	public String getFilePath() {
		
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

}
