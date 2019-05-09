package com.xuecheng.manage_cms.dao;

import com.xuecheng.manage_cms.service.CmsPageService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class CmsPageServiceTest {

    @Autowired
    CmsPageService cmsPageService;

    @Test
    public void testGetPageHtml(){
        String pageHtml = cmsPageService.getPageHtml("5cd2de68595f742da8ffaa16");
        System.out.println(pageHtml);
    }
}
