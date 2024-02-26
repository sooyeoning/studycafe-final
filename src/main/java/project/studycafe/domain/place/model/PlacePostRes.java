package project.studycafe.domain.place.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.studycafe.domain.place.dto.RateDTO;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlacePostRes {
    private String name;
    private String address;
    private String areaCode;
    private String phone;

    private int placeId;
    private RateDTO priceVO;
}
