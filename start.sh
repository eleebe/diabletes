#!/bin/bash
# ─────────────────────────────────────────────
#  🐺 Hombres Lobo de Castronegro — Arranque
# ─────────────────────────────────────────────

echo ""
echo "  🐺  Hombres Lobo de Castronegro"
echo "  ─────────────────────────────────"
echo ""

# Comprobar Node.js
if ! command -v node &> /dev/null; then
  echo "  ❌  Node.js no encontrado."
  echo "      Instálalo desde: https://nodejs.org (v18 o superior)"
  exit 1
fi

NODE_VER=$(node -v)
echo "  ✓  Node.js $NODE_VER"

# Instalar dependencias si faltan
if [ ! -d "node_modules" ] || [ ! -d "client/node_modules" ]; then
  echo ""
  echo "  📦  Instalando dependencias (primera vez, puede tardar un momento)…"
  echo ""
  npm run install:all
  if [ $? -ne 0 ]; then
    echo ""
    echo "  ❌  Error instalando dependencias."
    exit 1
  fi
fi

echo ""
echo "  🚀  Iniciando servidor y cliente…"
echo ""
echo "  ┌─────────────────────────────────────────┐"
echo "  │  Cliente  →  http://localhost:3000       │"
echo "  │  Servidor →  http://localhost:3001       │"
echo "  │                                          │"
echo "  │  Red local: usa la IP que muestra Vite  │"
echo "  │  para conectar desde otros dispositivos  │"
echo "  └─────────────────────────────────────────┘"
echo ""
echo "  Pulsa Ctrl+C para detener."
echo ""

npm run dev
