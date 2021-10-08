package com.wyu.service;

import com.wyu.domain.Uploadfile;
import com.wyu.mapper.UploadfileMapper;
import com.wyu.util.GetFilesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    private UploadfileMapper  uploadfileMapper;
    @Override
    public int insertFile(Uploadfile uploadfile) {
        int i=uploadfileMapper.insertSelective(uploadfile);
        return i;
    }

    //文件下载列表
    @Override
    public List<Uploadfile> selectFiles() {
        List<Uploadfile> file = GetFilesUtil.getFile("D://upload");
        return file;
    }
}
