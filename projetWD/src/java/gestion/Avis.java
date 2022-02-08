/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

/**
 *
 * @author Mamitiana
 */
public class Avis {
    Integer id_Avis;
    Integer id_Hotel;
    Integer id_Visiteur;
    String commentaire;

    public Integer getId_Avis() {
        return id_Avis;
    }

    public void setId_Avis(Integer id_Avis) {
        this.id_Avis = id_Avis;
    }

    public Integer getId_Hotel() {
        return id_Hotel;
    }

    public void setId_Hotel(Integer id_Hotel) {
        this.id_Hotel = id_Hotel;
    }

    public Integer getId_Visiteur() {
        return id_Visiteur;
    }

    public void setId_Visiteur(Integer id_Visiteur) {
        this.id_Visiteur = id_Visiteur;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
    
    
}
