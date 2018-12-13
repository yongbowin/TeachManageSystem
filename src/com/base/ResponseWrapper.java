/**
 * 
 */
package com.base;

import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * @author Administrator
 *
 */
public class ResponseWrapper extends HttpServletResponseWrapper {
	private PrintWriter cachedWriter;
	private CharArrayWriter bufferedWriter;
	private ServletOutputStream out = null;

	public ResponseWrapper(HttpServletResponse response) throws IOException {
		super(response);
		// 这个是我们保存返回结果的地方
		bufferedWriter = new CharArrayWriter();
		out = new WapperedOutputStream(bufferedWriter);
		// 这个是包装PrintWriter的，让所有结果通过这个PrintWriter写入到bufferedWriter中
		cachedWriter = new PrintWriter(bufferedWriter);
	}

	// 重载父类获取writer的方法
	@Override
	public PrintWriter getWriter() throws UnsupportedEncodingException {
		return cachedWriter;
	}

	// 重载父类获取outputstream的方法
	@Override
	public ServletOutputStream getOutputStream() throws IOException {
		return out;
	}

	// 重载父类获取flushBuffer的方法
	@Override
	public void flushBuffer() throws IOException {
		if (out != null) {
			out.flush();
		}
		if (cachedWriter != null) {
			cachedWriter.flush();
		}
	}

	@Override
	public void reset() {
		bufferedWriter.reset();
	}

	/** * 获取原始的HTML页面内容。 * @return */
	public String getResult() throws IOException {
		flushBuffer();
		return bufferedWriter.toString();
	}

	// 内部类，对ServletOutputStream进行包装
	private class WapperedOutputStream extends ServletOutputStream {
		private CharArrayWriter bos = null;

		public WapperedOutputStream(CharArrayWriter stream) throws IOException {
			bos = stream;
		}

		@Override
		public void write(int b) throws IOException {
			bos.write(b);
		}
	}
}
