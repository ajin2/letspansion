package room;

import java.util.List;

import db.SqlMapClient;

public class RoomDBBean implements RoomDao {
	@Override
	public RoomDataBean getRoomArticle(int r_id) {
		return SqlMapClient.getSqlSession().selectOne("Room.getRoomArticle", r_id);
	}
	
	@Override
	public List<RoomPictureDataBean> getRoomPictureArticles(int r_id) {
		return SqlMapClient.getSqlSession().selectList("Room.getRoomPictureArticles", r_id);
	}
	
	@Override
	public void insertPicture(RoomPictureDataBean picDto) {
		SqlMapClient.getSqlSession().insert("Room.insertPicture", picDto);
	}
	
	@Override
	public int maxPicNum(int r_id) {
		return SqlMapClient.getSqlSession().selectOne("Room.maxPicNum", r_id);
	}
	
	@Override
	public int countPicNum(int r_id) {		
		return SqlMapClient.getSqlSession().selectOne("Room.countPicNum", r_id);
	}
	
	@Override
	public void updatePicture(RoomPictureDataBean picDto) {
		SqlMapClient.getSqlSession().update("Room.updatePicture", picDto);
	}
	
	@Override
	public int getCountPicture(int r_id) {
		return SqlMapClient.getSqlSession().selectOne("Room.getCountPicture", r_id);
	}
	
	@Override
	public List<RoomPictureDataBean> getRoomsPictureArticles() {
		return SqlMapClient.getSqlSession().selectList("Room.getRoomsPictureArticles");
	}
	
	@Override
	public List<RoomDataBean> getRoomsArticle() {
		return SqlMapClient.getSqlSession().selectList("Room.getRoomsArticle");
	}
	
	@Override
	public void roomUpdate(RoomDataBean roomDto) {
		SqlMapClient.getSqlSession().update("Room.roomUpdate", roomDto);
	}
}
