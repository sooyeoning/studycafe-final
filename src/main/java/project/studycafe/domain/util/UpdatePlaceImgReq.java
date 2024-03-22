package project.studycafe.domain.util;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import project.studycafe.domain.place.model.Role;

@AllArgsConstructor
@Getter
public class UpdatePlaceImgReq {
	private MultipartFile file;
	private int placeId;
	private Role role;
}
