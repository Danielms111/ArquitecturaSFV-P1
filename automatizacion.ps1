$IMAGE_NAME = "parcial1"
$CONTAINER_NAME = "parcial1-container"

if ((docker ps -a -q -f name=$CONTAINER_NAME) -ne "") {
    Write-Host "Eliminando contenedor existente..."
    docker rm -f $CONTAINER_NAME
}

Write-Host "Construyendo la imagen Docker..."
docker build -t $IMAGE_NAME .

Write-Host "Ejecutando el contenedor..."
docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME

Write-Host "Mostrando logs..."
docker logs -f $CONTAINER_NAME
