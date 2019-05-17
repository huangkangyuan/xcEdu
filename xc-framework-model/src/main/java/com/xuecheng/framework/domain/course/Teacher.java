package com.xuecheng.framework.domain.course;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Teacher {

    private String id;
    private String coureId;
    private String name;
    private String description;
    private String teachStyle;
}
