package com.xuecheng.mt.domain;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@ToString
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long personId;

    @Column
    private String name;  //姓名

    @OneToMany(mappedBy = "person",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    private List<PhoneNumber> phoneNumberList; //电话列表

    @Column
    private String content; //备注

    @ManyToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH},optional=false)
    @JoinColumn(name="addressListId")
    private AddressList addressList;

}
