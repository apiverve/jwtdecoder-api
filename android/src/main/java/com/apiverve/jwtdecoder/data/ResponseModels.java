// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     JWTDecoderData data = Converter.fromJsonString(jsonString);

package com.apiverve.jwtdecoder.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static JWTDecoderData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(JWTDecoderData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(JWTDecoderData.class);
        writer = mapper.writerFor(JWTDecoderData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// JWTDecoderData.java

package com.apiverve.jwtdecoder.data;

import com.fasterxml.jackson.annotation.*;

public class JWTDecoderData {
    private Header header;
    private Payload payload;
    private String signature;
    private boolean isExpired;
    private Object expiresAt;
    private String warning;

    @JsonProperty("header")
    public Header getHeader() { return header; }
    @JsonProperty("header")
    public void setHeader(Header value) { this.header = value; }

    @JsonProperty("payload")
    public Payload getPayload() { return payload; }
    @JsonProperty("payload")
    public void setPayload(Payload value) { this.payload = value; }

    @JsonProperty("signature")
    public String getSignature() { return signature; }
    @JsonProperty("signature")
    public void setSignature(String value) { this.signature = value; }

    @JsonProperty("isExpired")
    public boolean getIsExpired() { return isExpired; }
    @JsonProperty("isExpired")
    public void setIsExpired(boolean value) { this.isExpired = value; }

    @JsonProperty("expiresAt")
    public Object getExpiresAt() { return expiresAt; }
    @JsonProperty("expiresAt")
    public void setExpiresAt(Object value) { this.expiresAt = value; }

    @JsonProperty("warning")
    public String getWarning() { return warning; }
    @JsonProperty("warning")
    public void setWarning(String value) { this.warning = value; }
}

// Header.java

package com.apiverve.jwtdecoder.data;

import com.fasterxml.jackson.annotation.*;

public class Header {
    private String alg;
    private String typ;

    @JsonProperty("alg")
    public String getAlg() { return alg; }
    @JsonProperty("alg")
    public void setAlg(String value) { this.alg = value; }

    @JsonProperty("typ")
    public String getTyp() { return typ; }
    @JsonProperty("typ")
    public void setTyp(String value) { this.typ = value; }
}

// Payload.java

package com.apiverve.jwtdecoder.data;

import com.fasterxml.jackson.annotation.*;

public class Payload {
    private String sub;
    private String name;
    private long iat;

    @JsonProperty("sub")
    public String getSub() { return sub; }
    @JsonProperty("sub")
    public void setSub(String value) { this.sub = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("iat")
    public long getIat() { return iat; }
    @JsonProperty("iat")
    public void setIat(long value) { this.iat = value; }
}