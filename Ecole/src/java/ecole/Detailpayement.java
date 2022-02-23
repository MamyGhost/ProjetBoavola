/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecole;

import java.util.Date;

/**
 *
 * @author BEST
 */
public class Detailpayement {
    private int id;
    private int idpayement;
    private Date datepayement;
    private int montant;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdpayement() {
        return idpayement;
    }

    public void setIdpayement(int idpayement) {
        this.idpayement = idpayement;
    }

    public Date getDatepayement() {
        return datepayement;
    }

    public void setDatepayement(Date datepayement) {
        this.datepayement = datepayement;
    }

    public int getMontant() {
        return montant;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }
}
