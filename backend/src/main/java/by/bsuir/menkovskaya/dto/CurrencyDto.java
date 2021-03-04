package by.bsuir.menkovskaya.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CurrencyDto {
    @JsonProperty("Cur_ID")
    private Integer curId;
    @JsonProperty("Cur_Name")
    private String name;
    @JsonProperty("Cur_Scale")
    private Double scale;
    @JsonProperty("Cur_OfficialRate")
    private Double rate;
    @JsonProperty("Cur_Abbreviation")
    private String abbreviation;

    public Integer getCurId() {
        return curId;
    }

    public void setCurId(Integer curId) {
        this.curId = curId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getScale() {
        return scale;
    }

    public void setScale(Double scale) {
        this.scale = scale;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }
}
