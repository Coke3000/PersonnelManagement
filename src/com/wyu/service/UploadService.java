package com.wyu.service;

import com.wyu.domain.Uploadfile;

import java.util.List;

public interface UploadService {
    int insertFile(Uploadfile uploadfile);

    List<Uploadfile> selectFiles();
}
