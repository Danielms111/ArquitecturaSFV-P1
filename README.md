# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: Daniel Montezuma**
- **Código: A00382231**
- **Fecha: 3/7/2025**

## Resumen de la Solución
Esta solución implementa un servicio básico en Node.js, diseñado para ejecutarse dentro de un contenedor Docker. Se creó un Dockerfile optimizado para un entorno de producción, permitiendo la rápida construcción e implementación del servicio. Además, se desarrolló un script de automatización en PowerShell para simplificar el despliegue y ejecución del contenedor.

## Dockerfile
Se tomaron las siguientes decisiones en su construcción:

- **Imagen Base:** Se usa node:18-alpine por ser ligera y segura.
- **Directorio de trabajo:** Se define /app como el espacio donde se copiarán los archivos.
- **Copia de dependencias:** Se copia solo package.json antes de ejecutar npm install, lo que permite aprovechar la caché de Docker y agilizar la construcción.
- **Copia de código fuente:** Se copian todos los archivos después de instalar las dependencias.
- **Variable de entorno:** Se establece NODE_ENV=production para optimizar el rendimiento.
- **Exposición de puerto:** Se expone el puerto 8080, que es el usado por la aplicación dentro del contenedor.
- **Ejecución del servicio:** Se usa CMD ["node", "app.js"] para arrancar la aplicación.

## Script de Automatización
El script automatizacion.ps1 automatiza el proceso de construcción y ejecución del contenedor. Funcionalidades:
- Elimina un contenedor previo si existe.
- Construye la imagen Docker.
- Ejecuta un nuevo contenedor con la imagen recién creada.
- Muestra los logs en tiempo real para verificar el funcionamiento.

## Principios DevOps Aplicados
1. **Automatización** – Se creó un script en PowerShell para agilizar la construcción y ejecución del contenedor.
2. **Infraestructura como Código (IaC)** – Uso de Docker para definir la infraestructura de ejecución de la aplicación.
3. **Escalabilidad y Despliegue Rápido** – Contenerización para facilitar despliegues en diferentes entornos sin dependencias externas.

## Captura de Pantalla
Con docker ps podemos ver la lista de los contenedores en ejecución:
![image](https://github.com/user-attachments/assets/4e04fcbc-63a5-4e56-8d7a-5cef093c6421)
 
Los logs del contenedor cuando ejecutamos el archivo de automatización:
![image](https://github.com/user-attachments/assets/d0c73e2a-a65a-42d5-9b3c-2c4c1fa29102)

Desde el navegador:
![image](https://github.com/user-attachments/assets/c22c8c14-0421-449d-9100-f5e74bbc19a3)


## Mejoras Futuras
1. Adaptar el Dockerfile para soportar multi-stage builds y reducir el tamaño de la imagen.
2. Implementar integración continua (CI/CD) con GitHub Actions o Jenkins.
3. Configurar variables de entorno externas para mayor flexibilidad en la configuración del servicio.

## Instrucciones para Ejecutar
Solo basta con ejecutar el archivo de automatización:
1. Ejecutar el script: ./automatizacion.ps1
2. http://localhost:3000
