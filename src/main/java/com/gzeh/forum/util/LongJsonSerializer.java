package com.gzeh.forum.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class LongJsonSerializer extends JsonSerializer<Long> {


	@Override
	public void serialize(Long value, JsonGenerator gen, SerializerProvider serializers)
			throws IOException, JsonProcessingException {
	 String text = (value == null ? null : String.valueOf(value));
        if (text != null) {
        	gen.writeString(text);
        }
	}

}
