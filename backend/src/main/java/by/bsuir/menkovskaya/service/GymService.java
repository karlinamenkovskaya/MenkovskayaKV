package by.bsuir.menkovskaya.service;

import by.bsuir.menkovskaya.entity.Gym;


import java.util.List;

public interface GymService {
    public Gym create(Gym gym);

    public void deleteGymById(int id);

    public Gym delete(int idGym) throws Exception;

    public List<Gym> findAll();

    public Gym update(Gym gym);

    public Gym findById(int idGym);
}
