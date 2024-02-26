package project.studycafe.domain.place.service;

import java.util.List;

import project.studycafe.domain.place.model.AdminPlaceGetRes;
import project.studycafe.domain.place.model.GetAdminPlaceListReq;
import project.studycafe.domain.place.model.PlaceGetListReq;
import project.studycafe.domain.place.model.PlaceGetRes;
import project.studycafe.domain.place.model.PlacePostReq;
import project.studycafe.domain.place.model.UpdatePlaceModel;

public interface PlaceService {
	PlaceGetRes getPlace(int id);

	int insertPlace(PlacePostReq placePostReq);

	List<PlaceGetRes> getPlaces(PlaceGetListReq placeGetListReq);

	List<PlaceGetRes> getAdminPlaces(GetAdminPlaceListReq getAdminPlaceListReq);

	int updatePlace(UpdatePlaceModel updatePlaceModel);
	
	AdminPlaceGetRes getAdminPlace(int id);

	int deletePlace(int id);

}
