package by.bsuir.menkovskaya.service;


import by.bsuir.menkovskaya.entity.Coach;
import by.bsuir.menkovskaya.entity.Subscription;
import by.bsuir.menkovskaya.repository.CoachRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CoachServiceImpl implements CoachService {
    @Resource
    private CoachRepository coachRepository;

    @Override
    public Coach create(Coach coach) {
        return coachRepository.save(coach);
    }

    @Override
    public void deleteCoachById(int id) {
        coachRepository.delete(id);

    }

    @Override
    public Coach delete(int idCoach) throws Exception {
        if (coachRepository.exists(idCoach)) {
            Coach deleted = coachRepository.findOne(idCoach);
            coachRepository.delete(idCoach);
            return deleted;
        } else {
            throw new Exception("Not found");
        }
    }

    @Override
    public List<Coach> findAll() {
        return coachRepository.findAll();
    }

    @Override
    public Coach update(Coach coach) throws Exception {
        if (coachRepository.exists(coach.getIdCoach())) {
            Coach updated = coachRepository.findOne(coach.getIdCoach());
            updated.setFirst_name(coach.getFirst_name());
            updated.setLast_name(coach.getLast_name());
            updated.setSalary(coach.getSalary());
            return updated;
        }
        return null;
    }

    @Override
    public Coach findById(int idCoach) {
        return coachRepository.findOne(idCoach);
    }

   /* @Override
    public List<Subscription> findSubscriptionByIdCoach(int id) {
        return coachRepository.findSubscriptionByIdCoach(id);
    }*/
}
