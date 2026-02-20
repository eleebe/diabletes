@echo off
chcp 65001 > nul
echo.
echo   🐺  Hombres Lobo de Castronegro
echo   ---------------------------------
echo.

where node >nul 2>nul
if %errorlevel% neq 0 (
  echo   ERROR: Node.js no encontrado.
  echo   Instalalo desde: https://nodejs.org ^(v18 o superior^)
  pause
  exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VER=%%i
echo   OK  Node.js %NODE_VER%

if not exist "node_modules" (
  echo.
  echo   Instalando dependencias ^(primera vez^)...
  echo.
  call npm run install:all
  if %errorlevel% neq 0 (
    echo   ERROR instalando dependencias.
    pause
    exit /b 1
  )
)

echo.
echo   Iniciando...
echo   Cliente  --^>  http://localhost:3000
echo   Servidor --^>  http://localhost:3001
echo.
echo   Pulsa Ctrl+C para detener.
echo.

npm run dev
pause
