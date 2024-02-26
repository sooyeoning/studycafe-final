package project.studycafe.domain.place.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.studycafe.domain.place.dto.PlaceRateDTO;
import project.studycafe.domain.place.dto.PlaceServiceDTO;
import project.studycafe.domain.util.ImageDTO;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlaceGetRes {
    private int id;
    private String name;
    private String address;
    private String areaCode;
    private String phone;
    
    private List<PlaceServiceDTO> placeServiceDTOList;
  
    private List<PlaceRateDTO> placeRateDTOList;
        
    private ImageDTO imageDTO;
    
   // private String uploadFileName = "../images/noimage.jpg";
    
    private List<String> uploadFileNames;
}
