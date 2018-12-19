package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BandDao;
import web.dao.face.GenreDao;
import web.dao.face.MusicDao;
import web.dto.Band;
import web.service.face.BandService;

@Service
public class BandServiceImpl implements BandService {

	@Autowired BandDao bandDao;
	@Autowired MusicDao musicDao;
	@Autowired GenreDao genreDao;
	
	@Override
	public List bandList() {

		return bandDao.getList();
	}

	@Override
	public List bandCate(String cate) {
		
		return bandDao.getByCate(cate);
	}

	@Override
	public List genreList() {
		
		return genreDao.getGenre();
	}
	
	@Override
	public List getProPic() {
		List list = bandDao.getProPic();
		
		return list;
	}
	
//	@Override
//	public List getProPic() {
//
//		// 이용한 SFTP 접근
//		JSch jsch = new JSch();
//		Session session = null;
//		
//		List list = bandDao.getProPic();
//		
//		try {
//			session = jsch.getSession("root", "13.125.206.231", 22);
//			
//			// Auth
//			session.setConfig("StrictHostKeyChecking", "no");
//			
//			session.setPassword("password");
//			session.connect();
//			
//			Channel channel = session.openChannel("sftp");
//			channel.connect();
//			ChannelSftp sftpChannel = (ChannelSftp) channel;
//			sftpChannel.get("1.jsp");
//			
//			
//			list.add(sftpChannel.get("1.jsp"));
//			
//			sftpChannel.exit();
//			session.disconnect();
//			
//		} catch(JSchException e) {
//			e.printStackTrace();
//		} catch(SftpException e) {
//			e.printStackTrace();
//		}
//		
//		
//		
//		return list;
//	}
	
//	@Override
//	public List getProPic() {
//
//		List list = bandDao.getProPic();
//		HttpSession session = null;
//		
//		// FTP 접근
//		FTPClient client = null;
//		BufferedOutputStream bos = null;
//		File fpath = null;
//		File fDir = null;
//		File f = null;
//		
//		String url = PropertiesHandler.getValue("13.125.206.231"); // 서버 ip
//		String id = PropertiesHandler.getValue("root"); // ftp 접속 id
//		String pwd = PropertiesHandler.getValue("비번"); // ftp 접속 pw
//		String port = PropertiesHandler.getValue("22"); // ftp 포트
//		String downloadPath = request.getSession().getServletContext().getRealPath("/") + PropertiesHandler.getValue("FTP_PATH"); //다운로드 경로
//
//		int result = -1;
//		
//		
//		downloadPath = downloadPath + list.indexOf(1);
//		
//		
//		return null;
//	}
	
	@Override
	public Map bandView(int bandNo) {

		Map map = new HashMap();
		
		map.put("info", bandDao.getInfo(bandNo));
		map.put("member", bandDao.getMember(bandNo));
		
		return map;
	}

	@Override
	public void bandEdit(Band band) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List bandSchedule(String bandName) {
		// TODO Auto-generated method stub
		return null;
	}
}
