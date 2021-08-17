# **Web Service con R**

Esta aplicación se realizó con la finalidad de crear una Web Service con R y consumir los datos mediante JavaScript.

## **Nota:**

1. Para ejecuatar un servidor local con cualquier lenguaje de programación [**Click aquí.**](https://gist.github.com/willurd/5720255).
2. Para poder ejecutar la API REST de R necesita tener instalador [**RStudio.**](https://www.rstudio.com/products/rstudio/download/)

## **Instalación**

### **Paso 1**

**Forma 1:** Dar clic en **Code**, luego **Download Zip** y descomprimir el archivo en tu ordenador.

**Forma 2:** Abrir una terminal en tu ordenador y ejecutar el siguiente comando:

    git clone https://github.com/HenryGP14/WebServiceR.git

### **Paso 2**

Crear la base de datos en **PostgreSQL** con la siguiente tabla:

**Provincia**

| idprovincia | nombre   | superficie | hombres | mujeres | capital  | poblacion |
| ----------- | -------- | ---------- | ------- | ------- | -------- | --------- |
| 13          | Los Ríos | 7205,27    | 380016  | 398099  | Babahoyo | 778115    |
| ....        | ....     | ........   | ....    | ....    | ....     | ....      |

**Nota:** Los datos de las tablas se encuentra en un archivo **cvs** en la carpeta **../WebServiceR/data**

### **Paso 3**

Configurar el archivo de configuraciones **config.json**, este archivo contendra las configuraciones para conectar el motor de base de datos.

-   **Primero:** Cambiar el nombre del archivo "**config.example.js**" a "**config.js**"
-   **Segundo:** Poner los datos que corresponde en el archivo **config.js**

**Nota:** El archivo de configuraciones se encuentra en la carpeta **../WebServiceR/API**

### **Paso 4**

Abrir el archivo **plumber.R** y **server.R** en la IDE de **RStudio** instalar todos los paquetes y librerias que se encuentran en los archivos.

### **Paso 5**

Si todo sale correcto, ejecutar el archivo **server.R** con la siguiente combinación de tecla **Crtl + alt + Enter** y poner la siguiente URL en tu navegador d internet:

    http://127.0.0.1:3731/provincias

**Nota:** Si no cargan los datos JSON de la WebService verificar desde el **Paso 3.**

### **Paso 6**

Ejecutar la aplicación web de consumo:

Ubicarse dentro del directorio Frontend y abrir la terminal de su preferencia y escribir el siguiente comando:

    php -S localhost:8000

**Nota:** Si no tienes **PHP** instalado y tienes otro lenguaje, puedes dar [**click aquí**](https://gist.github.com/willurd/5720255) y conoce cuales son los comandos para ejecutar un servidor local en cualquier lenguaje de programación.
