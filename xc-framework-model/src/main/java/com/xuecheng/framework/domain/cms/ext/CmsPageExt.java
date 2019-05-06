package com.xuecheng.framework.domain.cms.ext;

import com.xuecheng.framework.domain.cms.CmsPage;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CmsPageExt extends CmsPage {
    private String htmlValue;

}
