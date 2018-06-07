package com.gzeh.forum.base.annotation;

public enum AnnAuthType {
	anon("anon"),//不验证
	user("user");//验证访问权限
	
	private  String name;
	
	
	AnnAuthType(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
