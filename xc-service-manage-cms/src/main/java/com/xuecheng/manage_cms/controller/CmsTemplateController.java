package com.xuecheng.manage_cms.controller;

import com.xuecheng.api.cms.CmsPageControllerApi;
import com.xuecheng.api.cms.CmsTemplateControllerApi;
import com.xuecheng.framework.domain.cms.CmsPage;
import com.xuecheng.framework.domain.cms.request.QueryPageRequest;
import com.xuecheng.framework.domain.cms.response.CmsPageResult;
import com.xuecheng.framework.model.response.QueryResponseResult;
import com.xuecheng.framework.model.response.ResponseResult;
import com.xuecheng.manage_cms.service.CmsPageService;
import com.xuecheng.manage_cms.service.CmsTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cms/template")
public class CmsTemplateController implements CmsTemplateControllerApi {


    @Autowired
    CmsTemplateService cmsTemplateService;

    @Override
    @GetMapping("/list")
    public QueryResponseResult findTemplateList() {
        QueryResponseResult queryResponseResult = cmsTemplateService.findTemplateList();
        return queryResponseResult;
    }
}
