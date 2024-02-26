package project.studycafe.domain.user.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FindIdRes {
    private String userId;
    private String errorMsg;

}
