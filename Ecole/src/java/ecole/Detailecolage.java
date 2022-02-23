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
public class Detailecolage {
    private int id;
    private int idecolage;
    private Date datelimite;
    private int total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdecolage() {
        return idecolage;
    }

    public void setIdecolage(int idecolage) {
        this.idecolage = idecolage;
    }

    public Date getDatelimite() {
        return datelimite;
    }

    public void setDatelimite(Date datelimite) {
        this.datelimite = datelimite;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getAnneescolaire() {
        return anneescolaire;
    }

    public void setAnneescolaire(int anneescolaire) {
        this.anneescolaire = anneescolaire;
    }
    private int anneescolaire;

}
