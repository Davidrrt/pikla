/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package s6.pikla.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static s6.pikla.dao.DAOUtilitaire.fermeturesSilencieuses;
import static s6.pikla.dao.DAOUtilitaire.initialisationRequetePreparee;
import s6.pikla.model.Manager;

/**
 *
 * @author davra
 */
public class ManagerDaoImpl implements ManagerDao{

   private DAOFactory daoFactory;
    private static final String SQL_INSERT_SAVE = "";
    private static final String SQL_UPDATE_UP = "";
    private static final String SQL_DELETE_DEL = "";
    private static final String SQL_SELECT_FIND_ALL = "";
    private static final String SQL_SELECT_BY_ID = "";

    public ManagerDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void save(Manager person) throws Exception {
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
    public void update(Manager person) throws Exception {
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
    public void delete(Manager person) throws Exception {
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
    public List<Manager> findAll() throws Exception {
      Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Manager> tab = new ArrayList<>();
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
    public Manager findByid(int id) throws Exception {
         Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Manager tab = new Manager();
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
  private static Manager map(ResultSet resultSet) throws SQLException {
        Manager utilisateur = new Manager();
        utilisateur.setIdmanager(resultSet.getLong(""));
        utilisateur.setNomManager(resultSet.getString(""));
        utilisateur.setPrenomManager(resultSet.getString(""));
        utilisateur.setCinManager(resultSet.getString(""));
        utilisateur.setPermisMatricule(resultSet.getString(""));
        utilisateur.setLoginManager(resultSet.getString(""));
        utilisateur.setPasswordManager(resultSet.getString(""));
        return utilisateur;
    }
}
