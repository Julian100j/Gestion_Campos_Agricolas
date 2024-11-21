/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Mundo;

// Julian Ceballos y Juan Zambrano

import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class GestionarCampos {
    private NodoSimple cabezaSimple;
    private NodoDoble cabezaDoble;
    private ListaCircular listaCertificados;
    private static final String RUTA_ARCHIVO_SIMPLE = Paths.get("narino.txt").toString();
    private static final String RUTA_ARCHIVO_DOBLE = Paths.get("cauca.txt").toString();
    private static final String RUTA_ARCHIVO_CERTIFICADOS = Paths.get("certificados.ser").toString();

    public GestionarCampos() {
        cabezaSimple = null;
        cabezaDoble = null;
        listaCertificados = new ListaCircular();
        try {
            cargarDesdeArchivo(false); // Para cargar la lista simple (Nariño)
            cargarDesdeArchivo(true);  // Para cargar la lista doble (Cauca)
            cargarCertificados(); // Para cargar la lista circular de certificados
        } catch (ExcepcionArchivo | IOException | ClassNotFoundException e) {
            System.out.println("Error al cargar los archivos: " + e.getMessage());
            e.printStackTrace(); // Opcional
        }
    }

   

    

    // Método para agregar un campo agrícola
    public void agregarCampo(String nombre, String propietario, String ubicacion, double altitud, String tipoSemilla, int produccion, String imagen, boolean esDoble) {
        CampoAgricola nuevoCampo = new CampoAgricola(nombre, propietario, ubicacion, altitud, tipoSemilla, produccion, imagen);

        if (esDoble) {
            // Agregar a la lista doble
            NodoDoble nuevoNodo = new NodoDoble(nuevoCampo);
            if (cabezaDoble == null) {
                cabezaDoble = nuevoNodo; // Primer nodo
            } else {
                NodoDoble temp = cabezaDoble;
                while (temp.getSiguiente() != null) {
                    temp = temp.getSiguiente(); // Navegar hasta el último nodo
                }
                temp.setSiguiente(nuevoNodo); // Añadir el nuevo nodo al final
                nuevoNodo.setAnterior(temp); // Establecer el nodo anterior
            }
        } else {
            // Agregar a la lista simple
            NodoSimple nuevoNodo = new NodoSimple(nuevoCampo);
            if (cabezaSimple == null) {
                cabezaSimple = nuevoNodo; // Primer nodo
            } else {
                NodoSimple temp = cabezaSimple;
                while (temp.getSiguiente() != null) {
                    temp = temp.getSiguiente(); // Navegar hasta el último nodo
                }
                temp.setSiguiente(nuevoNodo); // Añadir el nuevo nodo al final
            }
        }
    }

    // Método para obtener la lista de campos agrícolas
    public List<CampoAgricola> obtenerLista(boolean esDoble) {
        List<CampoAgricola> lista = new ArrayList<>();
        if (esDoble) {
            NodoDoble temp = cabezaDoble;
            while (temp != null) {
                lista.add(temp.getCampo()); // Agregar el campo a la lista
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        } else {
            NodoSimple temp = cabezaSimple;
            while (temp != null) {
                lista.add(temp.getCampo()); // Agregar el campo a la lista
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        }
        return lista;
    }

    // Método para editar un campo agrícola
    public void editarCampo(String nombreOriginal, String nombre, String propietario, String ubicacion, double altitud, String tipoSemilla, int produccion, String imagen, boolean esDoble) {
        if (esDoble) {
            NodoDoble temp = cabezaDoble;
            while (temp != null) {
                if (temp.getCampo().getNombre().equals(nombreOriginal)) {
                    // Actualizar el campo
                    temp.getCampo().setNombre(nombre);
                    temp.getCampo().setPropietario(propietario);
                    temp.getCampo().setUbicacion(ubicacion);
                    temp.getCampo().setAltitud(altitud);
                    temp.getCampo().setTipoSemilla(tipoSemilla);
                    temp.getCampo().setProduccion(produccion);
                    temp.getCampo().setImagen(imagen);
                    return;
                }
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        } else {
            NodoSimple temp = cabezaSimple;
            while (temp != null) {
                if (temp.getCampo().getNombre().equals(nombreOriginal)) {
                    // Actualizar el campo
                    temp.getCampo().setNombre(nombre);
                    temp.getCampo().setPropietario(propietario);
                    temp.getCampo().setUbicacion(ubicacion);
                    temp.getCampo().setAltitud(altitud);
                    temp.getCampo().setTipoSemilla(tipoSemilla);
                    temp.getCampo().setProduccion(produccion);
                    temp.getCampo().setImagen(imagen);
                    return;
                }
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        }
    }

    // Método para eliminar un campo agrícola
    public void eliminarCampo(String nombre, boolean esDoble) {
        if (esDoble) {
            NodoDoble actual = cabezaDoble;
            while (actual != null) {
                if (actual.getCampo().getNombre().equals(nombre)) {
                    if (actual == cabezaDoble) {
                        cabezaDoble = actual.getSiguiente();
                        if (cabezaDoble != null) {
                            cabezaDoble.setAnterior(null);
                        }
                    } else if (actual.getSiguiente() == null) {
                        actual.getAnterior().setSiguiente(null);
                    } else {
                        actual.getAnterior().setSiguiente(actual.getSiguiente());
                        actual.getSiguiente().setAnterior(actual.getAnterior());
                    }
                    return;
                }
                actual = actual.getSiguiente();
            }
        } else {
            NodoSimple temp = cabezaSimple;
            NodoSimple prev = null;

            while (temp != null) {
                if (temp.getCampo().getNombre().equals(nombre)) {
                    if (prev == null) {
                        cabezaSimple = temp.getSiguiente();
                    } else {
                        prev.setSiguiente(temp.getSiguiente());
                    }
                    return;
                }
                prev = temp;
                temp = temp.getSiguiente();
            }
        }
    }

    // Método para obtener un campo específico
    public CampoAgricola obtenerCampo(String nombre, boolean esDoble) throws ExcepcionCampoNoEncontrado {
        if (esDoble) {
            NodoDoble temp = cabezaDoble;
            while (temp != null) {
                if (temp.getCampo().getNombre().equals(nombre)) {
                    return temp.getCampo(); // Retornar el campo encontrado
                }
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        } else {
            NodoSimple temp = cabezaSimple;
            while (temp != null) {
                if (temp.getCampo().getNombre().equals(nombre)) {
                    return temp.getCampo(); // Retornar el campo encontrado
                }
                temp = temp.getSiguiente(); // Navegar al siguiente nodo
            }
        }
        throw new ExcepcionCampoNoEncontrado("El campo con nombre '" + nombre + "' no se encontró.");
    }

    // Método para guardar los datos en un archivo TXT
    public void guardarEnArchivo(boolean esDoble) throws IOException {
        String rutaArchivo = esDoble ? RUTA_ARCHIVO_DOBLE : RUTA_ARCHIVO_SIMPLE;
        BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivo));
        if (esDoble) {
            NodoDoble temp = cabezaDoble;
            while (temp != null) {
                writer.write(temp.getCampo().toString());
                writer.newLine();
                temp = temp.getSiguiente();
            }
        } else {
            NodoSimple temp = cabezaSimple;
            while (temp != null) {
                writer.write(temp.getCampo().toString());
                writer.newLine();
                temp = temp.getSiguiente();
            }
        }
        writer.close();
    }

    // Método para obtener los campos agrícolas de un propietario específico
    public List<CampoAgricola> obtenerCamposPorPropietario(String propietario) {
        List<CampoAgricola> camposDelPropietario = new ArrayList<>();

        // Recorrer la lista simple (Nariño)
        NodoSimple tempSimple = cabezaSimple;
        while (tempSimple != null) {
            if (tempSimple.getCampo().getPropietario().equals(propietario)) {
                camposDelPropietario.add(tempSimple.getCampo());
            }
            tempSimple = tempSimple.getSiguiente();
        }

        // Recorrer la lista doble (Cauca)
        NodoDoble tempDoble = cabezaDoble;
        while (tempDoble != null) {
            if (tempDoble.getCampo().getPropietario().equals(propietario)) {
                camposDelPropietario.add(tempDoble.getCampo());
            }
            tempDoble = tempDoble.getSiguiente();
        }

        return camposDelPropietario;
    }

    // Método para cargar los datos desde un archivo TXT
    public void cargarDesdeArchivo(boolean esDoble) throws ExcepcionArchivo {
        String rutaArchivo = esDoble ? RUTA_ARCHIVO_DOBLE : RUTA_ARCHIVO_SIMPLE;
        try (BufferedReader reader = new BufferedReader(new FileReader(rutaArchivo))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                String[] atributos = linea.split(",");
                String nombre = atributos[0];
                String propietario = atributos[1];
                String ubicacion = atributos[2];
                double altitud = Double.parseDouble(atributos[3]);
                String tipoSemilla = atributos[4];
                int produccion = Integer.parseInt(atributos[5]);
                String imagen = atributos[6];

                // Agregar el campo a la lista
                agregarCampo(nombre, propietario, ubicacion, altitud, tipoSemilla, produccion, imagen, esDoble);
            }
        } catch (IOException e) {
            throw new ExcepcionArchivo("Error al cargar el archivo: " + rutaArchivo);
        }
    }

    // Método para guardar un usuario en el archivo
    public static void guardarUsuario(Usuario usuario, String filePath) {
        try (FileWriter writer = new FileWriter(filePath, true)) {
            writer.write(usuario.getIdentificacion() + "," + usuario.getNombre() + "," + usuario.getContrasena() + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Método para validar un usuario desde el archivo
    public static boolean validarUsuario(String identificacion, String contrasena, String filePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] fields = line.split(",");
                if (fields[0].equals(identificacion) && fields[2].equals(contrasena)) {
                    return true; // Se valida exitosamente al usuario!!
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Métodos para la lista circular de certificados
    

    public void guardarCertificados() throws IOException {
        listaCertificados.guardarEnArchivo(RUTA_ARCHIVO_CERTIFICADOS);
    }

    public void cargarCertificados() throws IOException, ClassNotFoundException {
        listaCertificados.cargarDesdeArchivo(RUTA_ARCHIVO_CERTIFICADOS);
    }

    public void agregarCertificado(CampoAgricola campo) {
        listaCertificados.agregar(campo);
        try {
            guardarCertificados();
        } catch (IOException e) {
            System.out.println("Error al guardar el certificado: " + e.getMessage());
        }
    }

    public List<CampoAgricola> obtenerCertificados() {
        return listaCertificados.obtenerCampos();
    }
}


