package by.bsuir.menkovskaya.service;

import by.bsuir.menkovskaya.repository.CalculationRepository;
import by.bsuir.menkovskaya.entity.Calculation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CalculationServiceImpl implements CalculationService {
    @Resource
    private CalculationRepository calculationRepository;

    @Override
    @Transactional
    public Calculation create(Calculation calculation) {
        return calculationRepository.save(calculation);
    }

    @Override
    @Transactional
    public void deleteCalculationById(int id) {
        calculationRepository.delete(id);
    }

    @Override
    @Transactional
    public Calculation delete(int id) throws Exception {
        Calculation deletedCalculation = calculationRepository.findOne(id);

        if (deletedCalculation == null)
            throw new Exception("Not found");

        calculationRepository.delete(deletedCalculation);
        return deletedCalculation;
    }

    @Override
    @Transactional
    public List<Calculation> findAll() {
        return calculationRepository.findAll();
    }

    @Override
    public List<Calculation> findByIdClient(int id) {
        return calculationRepository.findByidClient(id);
    }

    @Override
    @Transactional
    public Calculation update(Calculation calculation) throws Exception {
        Calculation updated = calculationRepository.findOne(calculation.getIdClient());
        updated.setIdSubscription(calculation.getIdSubscription());
        return updated; //TODO:
    }

    @Override
    public Calculation findById(int id) {
        return calculationRepository.findOne(id);
    }

    @Override
    public void findCalculationByIdClientAndIdSubscription(int idClient, int idSubscription){
        calculationRepository.delete(calculationRepository.findCalculationByIdClientAndIdSubscription(idClient,idSubscription).getIdCalculation());
    }

    @Override
    public  void deleteCalculationByIdClient(int idClient){
        calculationRepository.deleteCalculationByIdClient(idClient);
    }
}
