package room;

import java.util.List;

public interface RoomDao {
	public RoomDataBean getRoomArticle(int r_id);
	public List<RoomPictureDataBean> getRoomPictureArticles(int r_id);	
	public int maxPicNum(int r_id);										// FileUploadContoller	
	public void insertPicture(RoomPictureDataBean picDto);				// FileUploadContoller
	public int countPicNum(int r_id);									// FileUploadContoller
	public void updatePicture(RoomPictureDataBean picDto);				// FileModifyController
}
