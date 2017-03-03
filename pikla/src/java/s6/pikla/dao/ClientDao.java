package s6.pikla.dao;

import java.util.List;
import s6.pikla.model.Client;

public interface ClientDao {

    void save(Client person)throws Exception;

    void update(Client person)throws Exception;

    void delete(Client person)throws Exception;

    List<Client> findAll()throws Exception;

    Client findByid(int id)throws Exception;
}
