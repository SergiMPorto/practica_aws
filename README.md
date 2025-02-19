# Terraform

## Proceso de construcción de plantilla

Para desplegar la web estática, he realizado los siguientes pasos:

1. Primero, configuré el archivo *providers.tf* para especificar la localización y la versión de Terraform.
2. Luego, añadí los recursos necesarios en *main.tf*. Según la documentación de Terraform, para desplegar una web estática en AWS S3 es necesario crear los siguientes recursos:
   - **aws_s3_bucket_website_configuration**: Configura el bucket para servir como sitio web estático.
   - **aws_s3_object**: Define los objetos dentro del bucket, como *index.html*.
   - Todo esto se debe incluir dentro de un **aws_s3_bucket**.
3. Configuré la salida del recurso en *output.tf*, donde lo más importante es el valor que se mostrará al ejecutar `terraform output`:
   - `"aws_s3_bucket_website_configuration"`: Recurso en Terraform que configura un bucket de S3 para servir como un sitio web estático.
   - `"sergi_website"`: Nombre de la instancia específica del recurso.
   - `"website_endpoint"`: Obtiene la URL pública del sitio web estático en S3.

## Funcionamiento

Para poder abrir la web en el navegador, es necesario hacerlo en **modo incógnito**. Esto se debe a que se requiere establecer una política de seguridad adecuada.

En este caso, con el JSON que genera AWS, podemos crear una política de permisos donde solo se permite visualizar los archivos dentro del bucket, sin permitir su eliminación o subida.

