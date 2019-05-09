package com.xuecheng.manage_cms.service;

import com.xuecheng.framework.domain.cms.CmsTemplate;
import com.xuecheng.framework.domain.cms.response.CmsCode;
import com.xuecheng.framework.exception.ExceptionCast;
import com.xuecheng.framework.model.response.CommonCode;
import com.xuecheng.framework.model.response.QueryResponseResult;
import com.xuecheng.framework.model.response.QueryResult;
import com.xuecheng.manage_cms.dao.CmsTemplateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CmsTemplateService {
    @Autowired
    CmsTemplateRepository cmsTemplateRepository;

    public QueryResponseResult findTemplateList() {
        List<CmsTemplate> cmsTemplateList = cmsTemplateRepository.findAll();

        if (cmsTemplateList.size() <0 && cmsTemplateList == null){
            ExceptionCast.cast(CmsCode.CMS_TEMPLATE_LIST);
        }

        QueryResult queryResult = new QueryResult();
        queryResult.setList(cmsTemplateList);//数据列表
        queryResult.setTotal(cmsTemplateList.size());//数据总记录数
        QueryResponseResult queryResponseResult = new QueryResponseResult(CommonCode.SUCCESS, queryResult);
        return queryResponseResult;
    }
}