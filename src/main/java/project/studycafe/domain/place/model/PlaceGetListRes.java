package project.studycafe.domain.place.model;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceGetListRes {
    private List<PlaceGetRes> list;
}
