package project.studycafe.domain.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
		
		// 장소 중복 여부 확인 - exception 처리 SQLIntegrityConstraintViolationException
		
		// dto -> entity
		//insertPlace 의 반환값이 place id
		PlaceEntity placeEntity = PlaceEntity.toEntity(placePostReq.getPlaceDTO());
		placeMapper.insertPlace(placeEntity);
		int placeId = placeEntity.getId();
		//placePostReq.setPlaceId(placeId); //imageDTO에 필요한 placeId

		for (PlaceRateDTO placeRateDTO : placePostReq.getPlaceRateDTOList()) {
			placeRateDTO.setPlaceId(placeId);
			PlaceRateEntity placeRateEntity = PlaceRateEntity.toEntity(placeRateDTO);
			placeMapper.insertRate(placeRateEntity);
		}
		for (PlaceServiceDTO placeServiceDTO : placePostReq.getPlaceServiceDTOList()) {
			placeServiceDTO.setPlaceId(placeId);
			PlaceServiceEntity placeServiceEntity = PlaceServiceEntity.toEntity(placeServiceDTO);
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
	public int updatePlace(UpdatePlaceModel updatePlaceModel) {
		int placeId = updatePlaceModel.getId();
		updatePlaceModel.getPlaceDTO().setId(placeId);
		
		PlaceEntity placeEntity = PlaceEntity.toEntity(updatePlaceModel.getPlaceDTO());
		int placeResult = placeMapper.updatePlace(placeEntity);

		for (PlaceRateDTO placeRateDTO : updatePlaceModel.getPlaceRateDTOList()) {
			placeRateDTO.setPlaceId(placeId);
			PlaceRateEntity placeRateEntity = PlaceRateEntity.toEntity(placeRateDTO);
			placeMapper.updateRate(placeRateEntity);
			log.info("placeRateEntity: {}", placeRateEntity.toString());
		}
		for (PlaceServiceDTO placeServiceDTO : updatePlaceModel.getPlaceServiceDTOList()) {
			placeServiceDTO.setPlaceId(placeId);
			PlaceServiceEntity placeServiceEntity = PlaceServiceEntity.toEntity(placeServiceDTO);
			log.info("placeServiceEntity: {}", placeServiceEntity.toString());
			placeMapper.updateService(placeServiceEntity);
		}

		int result = 0;
		if (placeResult > 0) {
			result = 1;
		}
		return result;

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

		if (placeServiceDTO.getFeeStatus() != null) {
			Integer serviceId = placeServiceDTO.getServiceId();
			if(serviceId == 14 || serviceId == 15 || serviceId == 16 ) {
				if (placeServiceDTO.getFeeStatus().equals("free")) {
					placeServiceDTO.setFeeStatus("");
				}
				if (placeServiceDTO.getFeeStatus().equals("N/A")) {
					placeServiceDTO.setFeeStatus("미제공");
				}
			} else {
				if (placeServiceDTO.getFeeStatus().equals("free")) {
					placeServiceDTO.setFeeStatus("무료");
				}
				if (placeServiceDTO.getFeeStatus().equals("paid")) {
					placeServiceDTO.setFeeStatus("유료");
				}
				if (placeServiceDTO.getFeeStatus().equals("N/A")) {
					placeServiceDTO.setFeeStatus("미제공");
				}
			}
			
		}

	}

	public List<GetPlacesByAreaCodeRes> getPlaceListForTicket(String areaCode) {
		return placeMapper.getPlacesByAreaCode(areaCode);
	}
	

}
