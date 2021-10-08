package com.wyu.service;

import com.wyu.domain.Notice;
import com.wyu.domain.User;

import java.util.List;

public interface NoticeService {
    List<Notice> findNotice();

    int getTotal();

    int insertNotice(Notice notice);

    int updateNoticeById(Notice notice);

    int deleteNoticeById(String id);

    List<Notice> searchNotice(Notice notice);

    List<Notice> findTop5Notice();
}
