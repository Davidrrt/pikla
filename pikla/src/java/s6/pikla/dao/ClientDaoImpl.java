package s6.pikla.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static s6.pikla.dao.DAOUtilitaire.fermeturesSilencieuses;
import static s6.pikla.dao.DAOUtilitaire.initialisationRequetePreparee;
import s6.pikla.model.Client;

public class ClientDaoImpl implements ClientDao {

    private DAOFactory daoFactory;
    private static final String SQL_INSERT_SAVE = "";
    private static final String SQL_UPDATE_UP = "";
    private static final String SQL_DELETE_DEL = "";
    private static final String SQL_SELECT_FIND_ALL = "";
    private static final String SQL_SELECT_BY_ID = "";

    public ClientDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void save(Client person) throws Exception {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT_SAVE, false,person.getNomClient(),person.getPrenomClient(),person.getAdresseClient(),person.getCinClient(),person.getTelClient(),person.getLogin(),person.getPassword());
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
    public void update(Client person) throws Exception {
            Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_UPDATE_UP, false,person.getNomClient(),person.getPrenomClient(),person.getAdresseClient(),person.getCinClient(),person.getTelClient(),person.getLogin(),person.getPassword());
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
    public void delete(Client person) throws Exception {
             Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion,SQL_DELETE_DEL, false,person.getNomClient(),person.getPrenomClient(),person.getAdresseClient(),person.getCinClient(),person.getTelClient(),person.getLogin(),person.getPassword());
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
    public List<Client> findAll() throws Exception {
      Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Client> tab = new ArrayList<>();
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
    public Client findByid(int id) throws Exception {
         Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Client tab = new Client();
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
  private static Client map(ResultSet resultSet) throws SQLException {
        Client utilisateur = new Client();
        utilisateur.setIdClient(resultSet.getLong(""));
        utilisateur.setNomClient(resultSet.getString(""));
        utilisateur.setPrenomClient(resultSet.getString(""));
        utilisateur.setAdresseClient(resultSet.getString(""));
        utilisateur.setCinClient(resultSet.getString(""));
        utilisateur.setTelClient(resultSet.getString(""));
        utilisateur.setLogin(resultSet.getString(""));
        utilisateur.setPassword(resultSet.getString(""));
        return utilisateur;
    }
}
