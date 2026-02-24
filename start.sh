#!/usr/bin/env bash
set -e

echo ""
echo " Hombres Lobo — Firebase Edition"
echo "==================================="
echo ""

# Instalar dependencias si no existen
[ ! -d "server/node_modules" ] && echo "[1/2] Instalando servidor..." && (cd server && npm install)
[ ! -d "client/node_modules" ] && echo "[2/2] Instalando cliente..."  && (cd client && npm install)

echo ""
echo " Arrancando servidor (3001) y cliente (3000)..."
echo ""

# Servidor en background
(cd server && node index.js) &
SERVER_PID=$!

sleep 1

# Cliente Vite
(cd client && npm run dev) &
CLIENT_PID=$!

echo ""
echo " ✅  Servidor:    http://localhost:3001"
echo " ✅  Cliente:     http://localhost:3000"
LOCAL_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "192.168.x.x")
echo " ✅  Red local:   http://${LOCAL_IP}:3000"
echo ""
echo " Pulsa Ctrl+C para detener todo."

# Esperar y limpiar al salir
trap "kill $SERVER_PID $CLIENT_PID 2>/dev/null; exit 0" INT TERM
wait
