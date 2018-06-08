package com.web.service;

import com.web.bean.Application;
import com.web.dao.ApplicationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationService {
    private final ApplicationMapper applicationMapper;

    @Autowired
    public ApplicationService(ApplicationMapper applicationMapper) {
        this.applicationMapper = applicationMapper;
    }

    public void insertApplication(Application application) {
        applicationMapper.insertSelective(application);
    }

    public List<Application> selectAll() {
        return applicationMapper.selectAll();
    }

    public Application getApplication(Integer applicationId) {
        return applicationMapper.selectByPrimaryKey(applicationId);
    }
}
