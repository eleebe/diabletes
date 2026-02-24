@echo off
echo.
echo  Hombres Lobo - Firebase Edition
echo ===================================
echo.

REM Instalar dependencias si no existen
if not exist "server\node_modules" (
    echo [1/2] Instalando dependencias del servidor...
    cd server && npm install && cd ..
)
if not exist "client\node_modules" (
    echo [2/2] Instalando dependencias del cliente...
    cd client && npm install && cd ..
)

echo.
echo  Arrancando servidor y cliente...
echo  - Servidor: http://localhost:3001
echo  - Cliente:  http://localhost:3000
echo  - Red local: http://%COMPUTERNAME%:3000
echo.

start "Servidor Firebase" cmd /k "cd server && node index.js"
timeout /t 2 /nobreak >nul
start "Cliente Vite" cmd /k "cd client && npm run dev"

echo  Todo arrancado. Abre http://localhost:3000 en el navegador.
pause
