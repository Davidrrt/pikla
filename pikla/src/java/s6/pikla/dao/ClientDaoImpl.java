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
    private static final String SQL_INSERT_SAVE = "INSERT INTO client(nom_client, prenom_client, cin_client, adresse_client, tel_client, login, password, statut) VALUES ( ?, ?, ?, ?,?, ?, ?, ?)";
    private static final String SQL_UPDATE_UP = "UPDATE client SET  nom_client=?, prenom_client=?, cin_client=?, adresse_client=?,tel_client=?, login=?, password=?, statut=? WHERE idclient=?";
    private static final String SQL_DELETE_DEL = "DELETE FROM client WHERE idclient=?";
    private static final String SQL_SELECT_FIND_ALL = "SELECT idclient, nom_client, prenom_client, cin_client, adresse_client,tel_client, login, password, statut FROM client";
    private static final String SQL_SELECT_BY_ID = "SELECT idclient, nom_client, prenom_client, cin_client, adresse_client,tel_client, login, password, statut FROM client WHERE idclient=?";

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
     
                preparedStatement = initialisationRequetePreparee(connexion,SQL_SELECT_BY_ID, false,id);
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
        utilisateur.setIdClient(resultSet.getLong("idclient"));
        utilisateur.setNomClient(resultSet.getString("nom_client"));
        utilisateur.setPrenomClient(resultSet.getString("prenom_client"));
        utilisateur.setAdresseClient(resultSet.getString("adresse_client"));
        utilisateur.setCinClient(resultSet.getString("cin_client"));
        utilisateur.setTelClient(resultSet.getString("tel_client"));
        utilisateur.setLogin(resultSet.getString("login"));
        utilisateur.setPassword(resultSet.getString("password"));
        utilisateur.setStatut(resultSet.getBoolean("statut"));
        return utilisateur;
    }
}
