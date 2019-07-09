package com.xuecheng.mt;

import com.xuecheng.mt.dao.AddressListRepository;
import com.xuecheng.mt.dao.PersonRepository;
import com.xuecheng.mt.domain.AddressList;
import com.xuecheng.mt.domain.Person;
import com.xuecheng.mt.domain.PhoneNumber;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestComponent;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestMtApplicationTests {

    @Test
    public void contextLoads() {
    }

    @Autowired
    AddressListRepository addressListRepository;

    @Autowired
    PersonRepository personRepository;

    @Test
    public void testAdd(){

        AddressList addressList = new AddressList();

        Person person = new Person();
        person.setName("黄康远33333");

        PhoneNumber phoneNumber1 = new PhoneNumber();
        phoneNumber1.setPhone("18078800425");
        phoneNumber1.setPerson(person);

        PhoneNumber phoneNumber2 = new PhoneNumber();
        phoneNumber2.setPhone("15679216506");
        phoneNumber2.setPerson(person);

        ArrayList<PhoneNumber> phoneNumberList = new ArrayList<>();
        phoneNumberList.add(phoneNumber1);
        phoneNumberList.add(phoneNumber2);
        person.setPhoneNumberList(phoneNumberList);

        person.setContent("这是xxxx亲戚");

        ArrayList<Person> personList = new ArrayList<>();
        personList.add(person);

        addressList.setPersonList(personList);
        person.setAddressList(addressList);
        addressListRepository.save(addressList);
        personRepository.save(person);
    }

    @Test
    public void testUpdate(){

        Person person = new Person();
        person.setPersonId(1L);
        person.setName("黄康远1");
        person.setContent("这是xxxx亲戚");
        person.setAddressList(null);

        Optional<Person> personOptional = personRepository.findById(person.getPersonId());
        if(personOptional.isPresent()){
            Person oldPerson = personOptional.get();
            oldPerson.setName(person.getName());
            oldPerson.setContent("这是xxxx亲戚");
            personRepository.save(oldPerson);
        }
    }

    @Test
    public void testFindAll(){
        List<Person> personList = personRepository.findAll();
        for (Person person : personList) {
            System.out.println(person.getName());
            System.out.println(person.getContent());
        }
    }

    @Test
    public void testDelete(){
        Long id = 1L;
        personRepository.deleteById(id);
    }

}
