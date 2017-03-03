
package s6.pikla.dao;

import java.util.List;
import s6.pikla.model.Location;


public interface LocationDao {

    void save(Location person) throws Exception;

    void update(Location person) throws Exception;

    void delete(Location person) throws Exception;

    List<Location> findAll() throws Exception;

    Location findByid(int id) throws Exception;
}
