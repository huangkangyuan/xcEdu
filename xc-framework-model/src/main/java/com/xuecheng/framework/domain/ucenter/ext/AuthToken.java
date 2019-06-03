package com.xuecheng.framework.domain.ucenter.ext;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class AuthToken {
    String access_token;//访问token(短令牌,用户的身份令牌)
    String refresh_token;//刷新token
    String jwt_token;//jwt令牌
}
