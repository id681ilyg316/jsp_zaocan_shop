package com.hr.Servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hr.dao.EASYBUY_PRODUCTDao;
import com.hr.dao.ESDao;
import com.hr.entity.EASYBUY_PRODUCT;
import com.hr.entity.EASYBUY_USER;
import com.hr.entity.eb_shop;

public class ShopAddServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		  es_id           NUMBER primary key not null,--id
//		  es_ep_file_name NVARCHAR2(30),--ͼƬ����
//		  es_ep_name      NVARCHAR2(30),--������
//		  es_ep_price     NUMBER,--��������
//		  es_eod_quantity NUMBER,--��������
//		  es_ep_stock     NUMBER,--�������
//		  es_ep_id        NUMBER,--����id
//		  es_EU_USER_ID   NVARCHAR2(30),--�û�id
//		  es_valid	  NUMBER --�Ƿ���ˣ�1δ���ˣ�2�ѽ���
		EASYBUY_PRODUCT p = null;
		String pid = req.getParameter("id");
		String count = req.getParameter("count");
		if(pid!=null){
			p = EASYBUY_PRODUCTDao.selectById(Integer.parseInt(pid));
		}
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		EASYBUY_USER user=(EASYBUY_USER)session.getAttribute("name");
		
		if(user!=null){
//			System.out.println("��¼����");
			EASYBUY_USER eu=(EASYBUY_USER)session.getAttribute("name");
			String id=(String)eu.getEU_USER_ID();
			ArrayList<eb_shop> list=ESDao.getShop(id);
			req.setAttribute("shoplist",list);
			//req.getRequestDispatcher("shopping.jsp").forward(req, resp);
		}else{
			out.print("<script>");
			out.print("alert('���ȵ�¼');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			out.close();
			return;
		}
		String uid = user.getEU_USER_ID();
		int valid = 1;
		eb_shop sp = new eb_shop(0, p.getEP_FILE_NAME(), p.getEP_NAME(), p.getEP_PRICE(), Integer.parseInt(count), p.getEP_STOCK(), p.getEP_ID(), uid, valid);
		ESDao.insert(sp);
		resp.sendRedirect("ShopSelect");
		//req.getRequestDispatcher("ShopSelect").forward(req, resp);
	}
}
