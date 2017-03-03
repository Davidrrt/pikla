package s6.pikla.dao;

import java.util.List;
import s6.pikla.model.Manager;

public interface ManagerDao {

    void save(Manager person) throws Exception;

    void update(Manager person) throws Exception;

    void delete(Manager person) throws Exception;

    List<Manager> findAll() throws Exception;

    Manager findByid(int id) throws Exception;
}
