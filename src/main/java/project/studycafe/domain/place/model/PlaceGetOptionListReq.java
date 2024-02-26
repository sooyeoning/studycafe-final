package project.studycafe.domain.place.model;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PlaceGetOptionListReq {
    private String name;
    private String areaCode;
    private String priceCategory;
    
    private boolean price;
    private boolean freeService;
    private boolean paidService;
}
