package by.bsuir.menkovskaya.service;

import by.bsuir.menkovskaya.repository.GymRepository;
import by.bsuir.menkovskaya.entity.Gym;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GymServiceImpl implements GymService {
    @Resource
    private GymRepository gymRepository;

    @Override
    public Gym create(Gym gym) {
        return gymRepository.save(gym);
    }

    @Override
    public void  deleteGymById(int id){
        gymRepository.delete(id);
    }

    @Override
    public Gym delete(int idGym) throws Exception {
        if (gymRepository.exists(idGym)) {
            Gym deleted = gymRepository.findOne(idGym);
            gymRepository.delete(idGym);
            return deleted;
        } else {
            throw new Exception("Not found");
        }
    }

    @Override
    public List<Gym> findAll() {
        return gymRepository.findAll();
    }

    @Override
    public Gym update(Gym gym) {
        if (gymRepository.exists(gym.getIdGym())) {
            Gym updated = gymRepository.findOne(gym.getIdGym());
            updated.setGym_name(gym.getGym_name());
            gymRepository.save(updated);
            return updated;
        }
        return null;
    }

    @Override
    public Gym findById(int idGym) {
        return gymRepository.findOne(idGym);
    }
}
