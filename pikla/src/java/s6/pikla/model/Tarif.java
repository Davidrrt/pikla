package s6.pikla.model;




public class Tarif {

   public long idTarif;

   public String typeTarif;

   public int prixTarifHeure;
   
   public Voiture voiture;

    public long getIdTarif() {
        return idTarif;
    }

    public void setIdTarif(long idTarif) {
        this.idTarif = idTarif;
    }

    public String getTypeTarif() {
        return typeTarif;
    }

    public void setTypeTarif(String typeTarif) {
        this.typeTarif = typeTarif;
    }

    public int getPrixTarifHeure() {
        return prixTarifHeure;
    }

    public void setPrixTarifHeure(int prixTarifHeure) {
        this.prixTarifHeure = prixTarifHeure;
    }

    public Voiture getVoiture() {
        return voiture;
    }

    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }

   
   
   
  

}