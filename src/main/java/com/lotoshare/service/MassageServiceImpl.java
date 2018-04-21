package com.lotoshare.service;

import com.lotoshare.entity.Massage;
import com.lotoshare.repository.MassageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MassageServiceImpl implements MassageService {
    private MassageRepository massageRepository;

    @Autowired
    public void setMassageRepository(MassageRepository massageRepository){
        this.massageRepository = massageRepository;
    }

    @Override
    public Massage getMassageById(Integer id) {
        return massageRepository.findOne(id);
    }
}
