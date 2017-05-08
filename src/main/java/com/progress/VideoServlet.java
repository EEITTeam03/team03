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
import java.util.Calendar;
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

import myutil.MyUtil;

//import com.github.sarxos.webcam.Webcam;


/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/VideoServlet")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public VideoServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//取得權限控管Application
		ServletContext sysApplication = request.getServletContext();
//		HttpSession 權限控管Session = request.getSession();
		
		// set the proper content type for MJPG
		//設定ContentType以及時串流(multipart)的方式
		response.setContentType("multipart/x-mixed-replace; boundary=--BoundaryString");
		OutputStream out = response.getOutputStream();

		/*	若ip從WEB-INF/properties/team03.properties讀取		*/
		//String ip = ((Properties)request.getServletContext().getAttribute("prop")).getProperty("cameraIp");
		
		/*	在VideoServlet網址列設定ip: ?cip=......	*/
		if(null != request.getParameter("cip")){
			request.getServletContext().setAttribute("cip",request.getParameter("cip"));
		}
		String ip = (String)request.getServletContext().getAttribute("cip");

		//測試用的記得拔
//		if(null != request.getParameter("nowApp")){
//			SetSystemSchedule s = new SetSystemSchedule();
//			s.TodayReservListDelete(sysApplication,"1330","10");
//			s.TodayReservListInsert(sysApplication,"1330","8");
//		}
		/*IP攝影機 手機版本*/
		/*檢查此會員是否為此時段有預約的會員*/
		System.out.println("!!!!!!!!!!!!VideoServlet當前時間(單位半小時)"+MyUtil.getNowTimeFormat());
		List<String> nowInServMember= (List<String>)sysApplication.getAttribute(MyUtil.getNowTimeFormat());
		MemberInfoVO menberInfo = (MemberInfoVO)request.getSession().getAttribute("memberInfo");
		//nowInServMember(目前正在進行美容服務的會員)有無包含現在這個session的memberNo
		while(null != menberInfo && nowInServMember.contains(""+menberInfo.getMemberNo())){
			//每三十分轉換
			nowInServMember= (List<String>)sysApplication.getAttribute(MyUtil.getNowTimeFormat());
			menberInfo = (MemberInfoVO)request.getSession().getAttribute("memberInfo");
	
		/*下兩行只檢查有無登入，是會員就有權限
		MemberInfoVO menberInfo = (MemberInfoVO)request.getSession().getAttribute("memberInfo");
		while(null != menberInfo){	*/
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
		}
		
		ImageIcon icon = new ImageIcon(request.getServletContext().getRealPath("img/carWash.jpg"));	//沒有權限時(監視器停止時)顯示給用戶的畫面
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
