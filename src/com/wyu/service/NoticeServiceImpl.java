package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.Notice;
import com.wyu.domain.NoticeExample;
import com.wyu.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    //公告查询
    @Override
    public List<Notice> findNotice() {
        NoticeExample example=new NoticeExample();
        List<Notice> list=noticeMapper.selectByExampleWithBLOBs(example);
        list.forEach(li-> System.out.println("数据 ："+li));
        return list;
    }

    //公告总条数
    @Override
    public int getTotal() {
        NoticeExample example=new NoticeExample();
        int total=noticeMapper.countByExample(example);
        return total;
    }

    @Override
    public int insertNotice(Notice notice) {
        int i=noticeMapper.insertSelective(notice);
        return i;
    }

    //修改
    @Override
    public int updateNoticeById(Notice notice) {
        int i=noticeMapper.updateByPrimaryKeySelective(notice);
        return i;
    }

    //删除
    @Override
    public int deleteNoticeById(String id) {
        int id1=Integer.parseInt(id);
        int i=noticeMapper.deleteByPrimaryKey(id1);
        return i;
    }

    @Override
    public List<Notice> searchNotice(Notice notice) {
        NoticeExample  example=new NoticeExample();
        NoticeExample.Criteria criteria = example.createCriteria();
        if(notice.getName()!=null){
            criteria.andNameLike("%"+notice.getName()+"%");
        }
        if(notice.getTitle()!=null){
            criteria.andTitleLike("%"+notice.getTitle()+"%");
        }
        if(notice.getUserid()!=null){
            criteria.andUseridEqualTo(notice.getUserid());
        }
        List<Notice> list=noticeMapper.selectByExampleWithBLOBs(example);

        return list;
    }

    //查询首页5条公告
    @Override
    public List<Notice> findTop5Notice() {
        List<Notice> notices = noticeMapper.selectByTop5Notice();
        return notices;
    }
}
