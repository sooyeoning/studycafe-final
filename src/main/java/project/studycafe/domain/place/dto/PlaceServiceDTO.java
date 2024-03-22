package project.studycafe.domain.place.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PlaceServiceDTO {
	private int id;
	
	private int placeId;
	
	private int serviceId;

	private String feeStatus; //무료 유료
	
	private int pricePaid; //가격


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
	
}
