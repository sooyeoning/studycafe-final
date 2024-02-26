package project.studycafe.domain.place.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PlaceGetListReq {
    private String name;
    private String areaCode;
    private String rateId;
    
    private List<Integer> placeServiceIdList;
    private int serviceIdtotalCount;
    
}
