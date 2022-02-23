package ecole;

import java.util.Date;


public class Etudiant{
	private int id;
	private String matricule;
	private String nom;
	private String prenom;
	private Date dtn;
	private String contact;


	public void setId(int i){
		this.id = i;
	}
	public int getId(){
		return this.id;
	}
	public void setNom(String n){
		this.nom = n;
	}
	public String getNom(){
		return this.nom;
	}
	public void setPrenom(String p){
		this.prenom = p;
	}
	public String getPrenom(){
		return this.prenom;
	}
	public void setDate(Date d){
		this.dtn = d;
	}
	public Date getDate(){
		return this.dtn;
	}
	public void setContact(String c){
		this.contact = c;
	}
	public String getContact(){
		return this.contact;
	}
}