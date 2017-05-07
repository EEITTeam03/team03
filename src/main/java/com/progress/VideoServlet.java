package com.progress;

import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import com.memberinfo.model.MemberInfoVO;

//import com.github.sarxos.webcam.Webcam;


/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/VideoServlet")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ServletContext 權限控管Application = request.getServletContext();
		HttpSession 權限控管Session = request.getSession();
		
		/*其他地方會做的事情*/
		//當登入成功時可能會做的事情,一直都在即使跳頁 (15min or your setting)
//		權限控管Session.setAttribute("user", "黃大叔");
		權限控管Session.setAttribute("user", "張大媽");
		
		//今天輪到洗 張大媽 的車了~~~ (當時間到的時候,做的事情 ex:9:00)
		//Listener(ServletContext) 當啟動時那些時間要去做 
		//取得Application 的關鍵字 contextEvent.getServletContext();
		//排成的關鍵物件 ScheduledExecutorService
		//要做的事情? 到資料庫查詢目前正在處裡的使用者 將他寫入Application (如下)
//		權限控管Application.setAttribute("user", null);
//		權限控管Application.setAttribute("user", "黃大叔");
		
		/*此地方要做的事情*/
		//判斷 Session 使用者是不是現在有權限看的人
		String session使用者名稱 = (String)權限控管Session.getAttribute("user");
		String 目前有權限的人 = (String)權限控管Application.getAttribute("user");
		
		// set the proper content type for MJPG
		//設定ContentType以及時串流(multipart)的方式
		response.setContentType("multipart/x-mixed-replace; boundary=--BoundaryString");
		OutputStream out = response.getOutputStream();

		
		//String ip = ((Properties)request.getServletContext().getAttribute("prop")).getProperty("cameraIp");
		
		if(null != request.getParameter("cip")){
			request.getServletContext().setAttribute("cip",request.getParameter("cip"));
		}
		String ip = (String)request.getServletContext().getAttribute("cip");

		
		/*IP攝影機 手機版本*/
		MemberInfoVO menberInfo = (MemberInfoVO)request.getSession().getAttribute("memberInfo");
		while(null != menberInfo){
		//while(session使用者名稱.equals(目前有權限的人)){
			InputStream inputStream;
			try {
				HttpURLConnection urlConnection = (HttpURLConnection) new URL("http://"+ip+"/shot.jpg?username=sky&password=ray").openConnection();
				urlConnection.setConnectTimeout(3500);
				urlConnection.setReadTimeout(5000);
				inputStream = urlConnection.getInputStream();
			} catch (Exception e) {
				//若連線超過3.5秒，讀取時間超過5秒就跳出while
				break;
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(ImageIO.read(inputStream), "jpg", baos);
			if(!makeMJPEG(out,baos.toByteArray())){
				break;
			};
			目前有權限的人 = (String)權限控管Application.getAttribute("user");
		}
		
		ImageIcon icon = new ImageIcon(request.getServletContext().getRealPath("img/carWash.jpg"));
//		ImageIcon icon = new ImageIcon(application.getResource("../../../img/carWash.jpg"));
		BufferedImage bimage = new BufferedImage(icon.getImage().getWidth(null), icon.getImage().getHeight(null), BufferedImage.TYPE_INT_RGB);
		Graphics2D bGr = bimage.createGraphics();
		bGr.drawImage(icon.getImage(), 0, 0, null);
		bGr.dispose();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bimage, "jpg", baos);
		makeMJPEG(out,baos.toByteArray());
		out.close();
		
		return;
	}

	private boolean makeMJPEG(OutputStream outputStream,byte[] byteArray){
		try {
			// write the image and wrapper
			//將取得圖片的 byteArray 寫入當前的 response的 OutputStream
			outputStream.write((
				"--BoundaryString\r\n" +
				"Content-type: image/jpeg\r\n" +
				"Content-Length: " +
				byteArray.length +
				"\r\n\r\n").getBytes());
			outputStream.write(byteArray);
			outputStream.write("\r\n\r\n".getBytes());
			//將當前已寫入的OutputStream 先行傳送到網頁端
			outputStream.flush();			      

			// force sleep to not overwhelm the browser, simulate ~20 FPS
			// 圖片每隔多久傳送一次 越小影片會越順 但是網路流量會變大
			TimeUnit.MILLISECONDS.sleep(10);
			return true;
		}
		
		// If there is a problem with the connection (it likely closed), so return
		catch (Exception e) {
			return false;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
