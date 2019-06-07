package com.xuecheng.manage_course.exception;


import com.xuecheng.framework.exception.ExceptionCatch;
import com.xuecheng.framework.model.response.CommonCode;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;

/**课程管理自定义的异常类，其中定义异常类型所对应的错误代码
 **/
@ControllerAdvice//控制器增强
public class CustomExceptionCatch  extends ExceptionCatch {
    static {
        builder.put(AccessDeniedException.class, CommonCode.UNAUTHORISE);
    }
}
