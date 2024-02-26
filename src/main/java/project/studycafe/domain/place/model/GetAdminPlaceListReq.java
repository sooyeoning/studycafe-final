package project.studycafe.domain.place.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GetAdminPlaceListReq {
    private String name;
    private String areaCode;    
    
}
