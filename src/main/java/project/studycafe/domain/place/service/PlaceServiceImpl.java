package project.studycafe.domain.place.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.studycafe.domain.place.dto.PlaceRateDTO;
import project.studycafe.domain.place.dto.PlaceServiceDTO;
import project.studycafe.domain.place.entity.PlaceEntity;
import project.studycafe.domain.place.entity.PlaceRateEntity;
import project.studycafe.domain.place.entity.PlaceServiceEntity;
import project.studycafe.domain.place.mapper.PlaceMapper;
import project.studycafe.domain.place.model.AdminPlaceGetRes;
import project.studycafe.domain.place.model.GetAdminPlaceListReq;
import project.studycafe.domain.place.model.GetPlaceOptionRes;
import project.studycafe.domain.place.model.GetPlacesByAreaCodeRes;
import project.studycafe.domain.place.model.PlaceGetListReq;
import project.studycafe.domain.place.model.PlaceGetOptionListReq;
import project.studycafe.domain.place.model.PlaceGetRes;
import project.studycafe.domain.place.model.PlacePostReq;
import project.studycafe.domain.place.model.UpdatePlaceModel;
import project.studycafe.domain.util.FileMapper;

@Service
@RequiredArgsConstructor
@Slf4j
public class PlaceServiceImpl implements PlaceService {

	private final PlaceMapper placeMapper;
	private final FileMapper fileMapper;

	@Override
	public PlaceGetRes getPlace(int id) {
		PlaceGetRes placeGetRes = placeMapper.getPlace(id);
		for(PlaceServiceDTO placeServiceDTO : placeGetRes.getPlaceServiceDTOList()) {
			changeFeeStatusEnToKr(placeServiceDTO);
		}
		
		List<String> uploadFileNames = fileMapper.selectPlaceImages(id);
		placeGetRes.setUploadFileNames(uploadFileNames);
		
		return placeGetRes;
	}

	/**
	 * @return insertPlace의 id값	
	 */
	@Override
	public int insertPlace(PlacePostReq placePostReq) {
				
		// dto -> entity
		//insertPlace 의 반환값이 place id
		PlaceEntity placeEntity = PlaceEntity.toEntity(placePostReq.getPlaceDTO());
		placeMapper.insertPlace(placeEntity);
		int placeId = placeEntity.getId();

		for (PlaceRateDTO placeRateDTO : placePostReq.getPlaceRateDTOList()) {
			PlaceRateEntity placeRateEntity = PlaceRateEntity.toEntity(placeRateDTO, placeId);
			placeMapper.insertRate(placeRateEntity);
		}
		for (PlaceServiceDTO placeServiceDTO : placePostReq.getPlaceServiceDTOList()) {
			PlaceServiceEntity placeServiceEntity = PlaceServiceEntity.toEntity(placeServiceDTO, placeId);
			placeMapper.insertService(placeServiceEntity);
		}

		return placeId;
	}

	@Override
	public List<PlaceGetRes> getPlaces(PlaceGetListReq placeGetListReq) {
		List<PlaceGetRes> res = placeMapper.getPlaces(placeGetListReq);
		for (PlaceGetRes placeGetRes : res) {
			for (PlaceServiceDTO placeServiceDTO : placeGetRes.getPlaceServiceDTOList()) {
				changeFeeStatusEnToKr(placeServiceDTO);
			}
		}
		return res;
	}

	@Override
	@Transactional
	public void updatePlace(UpdatePlaceModel updatePlaceModel) {
		int placeId = updatePlaceModel.getId();
		updatePlaceModel.getPlaceDTO().setId(placeId);
		
		PlaceEntity placeEntity = PlaceEntity.toEntity(updatePlaceModel.getPlaceDTO());
		placeMapper.updatePlace(placeEntity);

		for (PlaceRateDTO placeRateDTO : updatePlaceModel.getPlaceRateDTOList()) {
			PlaceRateEntity placeRateEntity = PlaceRateEntity.toEntity(placeRateDTO,placeId);
			placeMapper.updateRate(placeRateEntity);
		}
		for (PlaceServiceDTO placeServiceDTO : updatePlaceModel.getPlaceServiceDTOList()) {
			PlaceServiceEntity placeServiceEntity = PlaceServiceEntity.toEntity(placeServiceDTO, placeId);
			placeMapper.updateService(placeServiceEntity);
		}

	}

	@Override
	public int deletePlace(int id) {
		return placeMapper.deletePlace(id);
	}

	@Override
	public List<PlaceGetRes> getAdminPlaces(GetAdminPlaceListReq getAdminPlaceListReq) {
		List<PlaceGetRes> res = placeMapper.getAdminPlaces(getAdminPlaceListReq);
		for (PlaceGetRes placeGetRes : res) {
			for (PlaceServiceDTO placeServiceDTO : placeGetRes.getPlaceServiceDTOList()) {
				changeFeeStatusEnToKr(placeServiceDTO);
			}
		}
		return res;
	}

	@Override
	public AdminPlaceGetRes getAdminPlace(int id) {
		return placeMapper.getAdminPlace(id);
	}

	// 정보 수정시에 기존 정보 불러오기
	public UpdatePlaceModel getAdminPlaceById(int id) {
		log.info("getAdminPlaceById: {}", placeMapper.getAdminPlaceById(id).toString());
		
		return placeMapper.getAdminPlaceById(id);
	}

	public List<GetPlaceOptionRes> getAdminPlacesWithOptions(PlaceGetOptionListReq placeGetOptionListReq) {
		List<GetPlaceOptionRes> res = placeMapper.getAdminPlacesWithOptions(placeGetOptionListReq);
		for (GetPlaceOptionRes placeOptionRes : res) {
			for (PlaceServiceDTO placeServiceDTO : placeOptionRes.getPlaceServiceDTOList()) {
				changeFeeStatusEnToKr(placeServiceDTO);
			}
		}
		return res;
	};

	public int checkPlaceNameExist(String placeName) {
		return placeMapper.checkPlaceNameExist(placeName);
	}

	public void changeFeeStatusEnToKr(PlaceServiceDTO placeServiceDTO) {
		placeServiceDTO.changeFeeStatusEnToKr(placeServiceDTO);
	}

	public List<GetPlacesByAreaCodeRes> getPlaceListForTicket(String areaCode) {
		return placeMapper.getPlacesByAreaCode(areaCode);
	}
	

}
