package s6.pikla.dao;

import java.util.List;
import s6.pikla.model.Tarif;

public interface TarifDao {

    void save(Tarif person) throws Exception;

    void update(Tarif person) throws Exception;

    void delete(Tarif person) throws Exception;

    List<Tarif> findAll() throws Exception;

    Tarif findByid(int id) throws Exception;
}
