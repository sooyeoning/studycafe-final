package project.studycafe.domain.place.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.studycafe.domain.place.entity.PlaceEntity;
import project.studycafe.domain.place.entity.PlaceRateEntity;
import project.studycafe.domain.place.entity.PlaceServiceEntity;
import project.studycafe.domain.place.model.AdminPlaceGetRes;
import project.studycafe.domain.place.model.GetAdminPlaceListReq;
import project.studycafe.domain.place.model.GetPlaceOptionRes;
import project.studycafe.domain.place.model.GetPlacesByAreaCodeRes;
import project.studycafe.domain.place.model.PlaceGetListReq;
import project.studycafe.domain.place.model.PlaceGetOptionListReq;
import project.studycafe.domain.place.model.PlaceGetRes;
import project.studycafe.domain.place.model.UpdatePlaceModel;

@Mapper
public interface PlaceMapper {
	PlaceGetRes getPlace(int id);

	int insertPlace(PlaceEntity placeEntity);

	int insertService(PlaceServiceEntity placeServiceEntity);

	int insertRate(PlaceRateEntity placeRateEntity);

	List<GetPlacesByAreaCodeRes> getPlacesByAreaCode(String areaCode);
	
	List<PlaceGetRes> getPlaces(PlaceGetListReq placeGetListReq);

	List<PlaceGetRes> getAdminPlaces(GetAdminPlaceListReq getAdminPlaceListReq);

	AdminPlaceGetRes getAdminPlace(int id);
	
	UpdatePlaceModel getAdminPlaceById(int id);
	
	int updatePlace(PlaceEntity placeEntity);

	int updateRate(PlaceRateEntity placeRateEntity);

	int updateService(PlaceServiceEntity placeServiceEntity);

	int deletePlace(int id);

	List<GetPlaceOptionRes> getAdminPlacesWithOptions(PlaceGetOptionListReq placeGetOptionListReq);
	
	int checkPlaceNameExist(String placeName);

	
}
