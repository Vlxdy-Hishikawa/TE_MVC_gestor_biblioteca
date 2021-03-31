package com.Vlxdy.modelo;

/**
 *
 * @author Vlxdy Hishikawa
 */
public class Libro {
    private int Id;
    private String Titulo;
    private String Autor;
    private int Estado;

    public Libro() {
        Id = 0;
        Titulo = "";
        Autor = "";
        Estado = 0;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getAutor() {
        return Autor;
    }

    public void setAutor(String Autor) {
        this.Autor = Autor;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
}
