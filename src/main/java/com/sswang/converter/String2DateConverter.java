package com.sswang.converter;

import javafx.scene.input.DataFormat;
import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class String2DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {

        if(s==null){
            throw new RuntimeException("需要转换成Date的String类型数据不能为空");
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Date date = sdf.parse(s);
            return date;
        }catch (Exception e){
            throw new RuntimeException("String类型数据转Date类型出错！");
        }

    }
}
