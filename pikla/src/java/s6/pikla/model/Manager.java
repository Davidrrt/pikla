
package s6.pikla.model;


public class Manager {

    public long idmanager;
   
    public java.lang.String nomManager;
   
    public java.lang.String prenomManager;
   
    public java.lang.String cinManager;
  
   public java.lang.String loginManager;
  
   public java.lang.String passwordManager;
  
   public java.lang.String permisMatricule;
   
   public Voiture voiture;

    public long getIdmanager() {
        return idmanager;
    }

    public void setIdmanager(long idmanager) {
        this.idmanager = idmanager;
    }

    public String getNomManager() {
        return nomManager;
    }

    public void setNomManager(String nomManager) {
        this.nomManager = nomManager;
    }

    public String getPrenomManager() {
        return prenomManager;
    }

    public void setPrenomManager(String prenomManager) {
        this.prenomManager = prenomManager;
    }

    public String getCinManager() {
        return cinManager;
    }

    public void setCinManager(String cinManager) {
        this.cinManager = cinManager;
    }

    public String getLoginManager() {
        return loginManager;
    }

    public void setLoginManager(String loginManager) {
        this.loginManager = loginManager;
    }

    public String getPasswordManager() {
        return passwordManager;
    }

    public void setPasswordManager(String passwordManager) {
        this.passwordManager = passwordManager;
    }

    public String getPermisMatricule() {
        return permisMatricule;
    }

    public void setPermisMatricule(String permisMatricule) {
        this.permisMatricule = permisMatricule;
    }

    public Voiture getVoiture() {
        return voiture;
    }

    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }
   
   
   
}