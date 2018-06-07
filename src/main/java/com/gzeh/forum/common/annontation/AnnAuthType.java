package com.gzeh.forum.common.annontation;

public enum AnnAuthType {
	anon(),//不验证
	session(),//验证session
	sessionAndAuthc();//验证session和访问权限
}
