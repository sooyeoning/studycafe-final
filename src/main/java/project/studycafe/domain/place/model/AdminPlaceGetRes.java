package project.studycafe.domain.place.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import project.studycafe.domain.place.dto.PlaceRateDTO;
import project.studycafe.domain.place.dto.PlaceServiceDTO;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AdminPlaceGetRes {
	private int id;
	private String name;
	private String address;
	private String areaCode;
	private String phone;

	private PlaceRateDTO placeRateDTO;
	
    private PlaceServiceDTO placeServiceDTO;
    
	private boolean locker;
	private boolean meetingRoom;
	private boolean parking;
	private boolean paidPrinter;
	private boolean paidScanner;

	private boolean blanket;
	private boolean bookstand;
	private boolean phoneCharger;
	private boolean lamp;
	private boolean cushion;
}
