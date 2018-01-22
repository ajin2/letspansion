package room;

import java.util.List;

public interface RoomDao {
	public RoomDataBean getRoomArticle(int r_id);
	public List<RoomPictureDataBean> getRoomPictureArticles(int r_id);	// AdminRoomDetailHandler
	public List<RoomPictureDataBean> getRoomsPictureArticles();			// AdminRoomListHandler
	public int getCountPicture(int r_id);								// AdminRoomDetailHandler
	public int maxPicNum(int r_id);										// FileUploadContoller	
	public void insertPicture(RoomPictureDataBean picDto);				// FileUploadContoller
	public int countPicNum(int r_id);									// FileUploadContoller
	public void updatePicture(RoomPictureDataBean picDto);				// FileModifyController
	public List<RoomDataBean> getRoomsArticle();						// AdminRoomListHandler
	public void roomUpdate(RoomDataBean roomDto);						// AdminRoomModifyDoneHandler
}
