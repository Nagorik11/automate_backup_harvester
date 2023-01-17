#! /bin/bash

#path del dispositivo donde se encuentra el script ejecutandose
device="$PWD"

#brindamos acceso al dispositivo
chmod 777 $device


current_date=$(date +%Y-%m-%d)

#creamos una ruta para el respaldo
mkdir -p $device/$current_date

#copiar el directorio presente en el device a la ruta creada

echo "[Nagorik Labs] -- [Backup tool]"
echo "---------------------------------"
echo "In user's home directory"
ls -ll /home/*
echo "---------------------------------"
#revisar los archivos pdf
echo "looking for pdf files"
find /home -name "*.pdf" -exec cp {} $device/$current_date/pdf \;
echo "---------------------------------"
echo "there are the pdf files"
#delete the duplicates
echo "deleting duplicates"
int eliminados = 0
for file in $device/$current_date/*.pdf; do
    #si el archivo ya existe con nombre identico + ademas entre parentesis se encuentra algun numero
    if [ -f $file ] && [[ $file =~ \([0-9]+\).pdf ]]; then
        #eliminarlo
        rm $file
        eliminados++
    
    fi
echo "$eliminados files deleted"
#echo "Respaldando el directorio /var/www/html en $backup"