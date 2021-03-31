package com.Vlxdy.modelo;

import java.util.ArrayList;

/**
 *
 * @author Vlxdy Hishikawa
 */
public class LibroDAO {
    private int Correlativo;
    private ArrayList<Libro> libros;
    
    public LibroDAO(){
        libros = new ArrayList<Libro>();
    }

    public int getCorrelativo() {
        return Correlativo;
    }

    public void setCorrelativo(int Correlativo) {
        this.Correlativo = Correlativo;
    }

    public ArrayList<Libro> getLibros() {
        return libros;
    }

    public void setLibros(ArrayList<Libro> libros) {
        this.libros = libros;
    }
    
    
    public void insertar(Libro item){
        libros.add(item);
    }
    
    public void modificar(int Id, Libro item){
        int pos = posicion(Id);
        libros.set(pos, item);
    }
    
    public void eliminar(int Id){
        int pos = posicion(Id);
        libros.remove(pos);
    }    
    
    public int posicion(int Id){
        int i = -1;
        if(libros.size() > 0){
            for(Libro item : libros){
                i++;
                if(item.getId() == Id){
                    break;
                }
            }
        }
        return i;
    }
     
}
