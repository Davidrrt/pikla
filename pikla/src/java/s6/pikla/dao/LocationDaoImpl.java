
package s6.pikla.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static s6.pikla.dao.DAOUtilitaire.fermeturesSilencieuses;
import static s6.pikla.dao.DAOUtilitaire.initialisationRequetePreparee;

import s6.pikla.model.Location;


public class LocationDaoImpl implements LocationDao {

    private DAOFactory daoFactory;
    private static final String SQL_INSERT_SAVE = "INSERT INTO location(idvoiture, idclient, depart, arrivee, duree, date_location)VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE_UP = "UPDATE location SET  idvoiture=?, idclient=?, depart=?, arrivee=?, duree=?,date_location=? WHERE idlocation=?";
    private static final String SQL_DELETE_DEL = "DELETE FROM location WHERE idlocation=?";
    private static final String SQL_SELECT_FIND_ALL = "";
    private static final String SQL_SELECT_BY_ID = "";

    public LocationDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void save(Location person) throws Exception {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT_SAVE, false);
            int statusPass = preparedStatement.executeUpdate();
            if (statusPass == 0) {
                throw new DAOException("Échec d'ajout dans la table.");
            }
            connexion.commit();
        } catch (SQLException | DAOException e) {
            connexion.rollback();
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(preparedStatement, connexion);
        }
    }

    @Override
    public void update(Location person) throws Exception {
            Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_UPDATE_UP, false);
            int statusPass = preparedStatement.executeUpdate();
            if (statusPass == 0) {
                throw new DAOException("Échec d'ajout dans la table.");
            }
            connexion.commit();
        } catch (SQLException | DAOException e) {
            connexion.rollback();
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(preparedStatement, connexion);
        }
    }

    @Override
    public void delete(Location person) throws Exception {
             Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion,SQL_DELETE_DEL, false);
            int statusPass = preparedStatement.executeUpdate();
            if (statusPass == 0) {
                throw new DAOException("Échec d'ajout dans la table.");
            }
            connexion.commit();
        } catch (SQLException | DAOException e) {
            connexion.rollback();
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(preparedStatement, connexion);
        }
    }

    @Override
    public List<Location> findAll() throws Exception {
      Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Location> tab = new ArrayList<>();
        try {
            connexion = daoFactory.getConnection();
     
                preparedStatement = initialisationRequetePreparee(connexion,SQL_SELECT_FIND_ALL, false);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                tab.add(map(resultSet));
            }
            return tab;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
    }

    @Override
    public Location findByid(int id) throws Exception {
         Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Location tab = new Location();
        try {
            connexion = daoFactory.getConnection();
     
                preparedStatement = initialisationRequetePreparee(connexion,SQL_SELECT_FIND_ALL, false,id);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                tab=map(resultSet);
            }
            return tab;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
    }
  private static Location map(ResultSet resultSet) throws SQLException {
        Location utilisateur = new Location();
        utilisateur.setIdLocation(resultSet.getLong(""));
        utilisateur.setArrivee(resultSet.getString(""));
        utilisateur.setDepart(resultSet.getString(""));
        utilisateur.setDuree(resultSet.getDate(""));
        utilisateur.setDateLocation(resultSet.getDate(""));
        return utilisateur;
    }
}
