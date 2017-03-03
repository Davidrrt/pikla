package s6.pikla.dao;

import java.util.List;
import s6.pikla.model.Voiture;

public interface VoitureDao {

    void save(Voiture person) throws Exception;

    void update(Voiture person) throws Exception;

    void delete(Voiture person) throws Exception;

    List<Voiture> findAll() throws Exception;

    Voiture findByid(int id) throws Exception;
}
