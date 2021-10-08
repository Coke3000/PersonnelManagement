package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.Job;
import com.wyu.domain.JobExample;
import com.wyu.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class JobServiceImpl implements JobService {
    @Autowired
    private JobMapper jobMapper;
    @Override
    public List<Job> findJob() {
        JobExample example=new JobExample();
        List<Job> list=jobMapper.selectByExample(example);
        return list;
    }

    //职位查询修改
    @Override
    public int updateJobByjid(Job job) {
        int i=jobMapper.updateByPrimaryKeySelective(job);
        return i;
    }

    //职位删除
    @Override
    public int deleteJobByjname(String jname) {
        JobExample example=new JobExample();
        JobExample.Criteria criteria = example.createCriteria();
        criteria.andJnameEqualTo(jname);
        int i=jobMapper.deleteByExample(example);
        return i;
    }

    //搜索功能
    @Override
    public List<Job> searchJob(Job job) {
        JobExample example=new JobExample();
        JobExample.Criteria criteria = example.createCriteria();
        if(job.getJid()!=null){
            criteria.andJidEqualTo(job.getJid());
        }
        if(job.getJname()!=null){
            criteria.andJnameLike("%"+job.getJname()+"%");
        }
        List<Job> list=jobMapper.selectByExample(example);
        return list;
    }

    @Override
    public int addJob(Job job) {
        int i=jobMapper.insertSelective(job);
        return i;
    }

    //查询条数
    @Override
    public int getTotal() {
        JobExample example=new JobExample();
        int total=jobMapper.countByExample(example);
        return total;
    }
}
