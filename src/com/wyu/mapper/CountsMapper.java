package com.wyu.mapper;

import com.wyu.domain.Counts;

public interface CountsMapper {
    //查询各个表的数量
    Counts selectCounts();
}
