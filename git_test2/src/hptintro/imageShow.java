package hptintro;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.sun.glass.ui.Application;

public class imageShow extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//System.out.println("잘넘어와용!!");
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		String mem_idx = req.getParameter("mem_idx");
		
		resp.sendRedirect("./imagemsg.jsp?mem_idx="+mem_idx);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.한글처리
		req.setCharacterEncoding("UTF-8");
		
		//String mem_idx = req.getAttribute("mem_idx").toString();

		//2.파일을 업로드할 서버의 물리적경로 얻어오기
		/*
		서버의 물리적경로가 필요한 이유는 윈도우와 리눅스 OS의
		경우 경로명이 서로 달라질수 있기 때문이다.
		*/
		String saveDirectory = getServletContext().getRealPath("/Upload");
		
		System.out.println("업로드 절대경로 : "+ saveDirectory);

		//3.업로드할 파일의 최대용량 설정(바이트단위)
		/*
		단, 파일을 여러개 업로드할 경우는 각각의 용량을 합친
		용량이 최대용량이 된다. Ex) 500Kb *2개 = 1000Kb
		*/
		int maxPostSize = 1024 * 5000;

		//4.인코딩 타입 설정
		String encoding = "UTF-8";

		//5.파일명 중복처리
		/*
		파일명이 중복되는 경우 자동인덱스를 부여하여 파일명을
		재정의 한다. FileRenamePolicy 객체를 이용해서 중복된
		파일의 인덱스가 자동으로 부여된다. Ex)apple.png,
		apple1.png, apple2.png~~~~~형태
		*/
		FileRenamePolicy policy = new DefaultFileRenamePolicy();

		MultipartRequest mr = null;
		String name = null;
		String title = null;
		StringBuffer inter = new StringBuffer();

		//저장된 파일명 변경을 위한 객체생성
		File oldFile = null;
		File newFile = null;
		String realFileName = null;
		
		String mem_img = null;
		String mem_idx = null;

		try{
			//6.파일업로드를 위한 MultipartRequest객체 생성
			/*
			절차2~5번까지 준비한 인자를 이용하여 MultipartRequest
			객체를 생성한다. 객체생성만으로 파일업로드가 진행된다.
			
			만약 예외가 발생한다면 MultipartRequest객체가 생성
			되지 못한것이고, 이유로는 최대용량 초과 혹은 디렉토리가
			없는 경우가 대부분이다.
			*/
			mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, policy);
			
			mem_img = mr.getFilesystemName("mem_img");
			mem_idx = mr.getParameter("mem_idx");
			
			introDAO dao = new introDAO();
			int affected = dao.imgUpdate(mem_idx, mem_img);
			
			if(affected==1) {
				req.getRequestDispatcher("../hptintro/hptintro.jsp").forward(req, resp);
			}
						
		}
		catch(Exception e){
			/*
			파일업로드시 예외가 발생되면 리퀘스트 영역에
			메세지를 저장하고 메인페이지로 포워드한다.
			*/
			req.setAttribute("errorMessage", "파일업로드오류");
			req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
		}
		
	}
	
}
