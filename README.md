<h1>Terraform</h1>

<h2>Proceso de construcción de plantilla</h2>

Para desplegar la web estática he realizado los siguientes pasos:

- Primero, configurar el archivo *providers.tf* para especificar la localización y la versión de Terraform.
- Después, he añadido los recursos que se necesitan en el *main.tf*. En este caso y según busqué en la página de Terraform, para desplegar una web estática es necesario crear un recurso **aws_s3_bucket_website_configuration y aws_s3_object** para coger el archivo *index.html* y todo ello dentro de un **aws_s3_bucket**.
- Configuramos la salida del recurso en *output.tf*, en donde lo más importante es el valor que se mostrará al ejecutar el output.  

  - **"aws_s3_bucket_website_configuration"**: Es el recurso en Terraform que configura un bucket de S3 para servir como un sitio web estático.  
  - **"sergi_website"**: Se refiere a la instancia específica del recurso, que en este caso se llama *sergi_website*.  
  - **"website_endpoint"**: Obtiene la URL pública del sitio web estático en S3.

<h2>Funcionamiento</h2>

Para poder abrir la web en el navegador tenemos que entrar en **modo incógnito**. Para poder acceder, es necesario establecer una política de seguridad.  

En este caso, con el JSON que ya genera AWS, podemos crear una política de permisos donde solo permitimos que se puedan ver los archivos, pero no borrar ni subir sobre los recursos que hemos creado dentro del bucket.

![Policy](https://github.com/SergiMPorto/practica_aws/blob/master/image/Captura%20de%20pantalla%202025-02-19%20175910.png)
Política de permisos para poder a la web.


![Resultado](https://github.com/SergiMPorto/practica_aws/blob/master/image/applyresultado.png)
Dirección para visualizar la web










