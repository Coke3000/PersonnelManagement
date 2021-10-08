package com.wyu.service;

import com.wyu.domain.Job;

import java.util.List;

public interface JobService {
    List<Job> findJob();

    int updateJobByjid(Job job);

    int deleteJobByjname(String jname);

    List<Job> searchJob(Job job);

    int addJob(Job job);

    int getTotal();
}
