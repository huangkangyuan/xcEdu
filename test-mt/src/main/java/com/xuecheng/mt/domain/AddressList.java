package com.xuecheng.mt.domain;


import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@ToString
public class AddressList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long addressListId;

    @OneToMany(mappedBy = "addressList",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    private List<Person> personList;
}


