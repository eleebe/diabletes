#!/bin/bash
# ──────────────────────────────────────────────────────
#  🐺 Preparar proyecto para subir a GitHub + Railway
# ──────────────────────────────────────────────────────

echo ""
echo "  🐺  Hombres Lobo — Preparar deploy online"
echo "  ──────────────────────────────────────────"
echo ""

# Pedir datos
read -p "  Tu usuario de GitHub: " GH_USER
read -p "  Nombre del repositorio (ej: hombres-lobo): " GH_REPO

echo ""
echo "  Inicializando repositorio Git…"
git init
git add .
git commit -m "🐺 Hombres Lobo de Castronegro v5"
git branch -M main

echo ""
echo "  Conectando con GitHub…"
git remote add origin "https://github.com/$GH_USER/$GH_REPO.git"
git push -u origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "  ✅ Código subido a GitHub correctamente"
  echo ""
  echo "  ┌─────────────────────────────────────────────────────┐"
  echo "  │  SIGUIENTE PASO — Deploy en Railway (gratis):       │"
  echo "  │                                                     │"
  echo "  │  1. Ve a https://railway.app                        │"
  echo "  │  2. New Project → Deploy from GitHub repo           │"
  echo "  │  3. Selecciona: $GH_USER/$GH_REPO"
  echo "  │  4. Espera 2-3 minutos                              │"
  echo "  │  5. Settings → Networking → Generate Domain         │"
  echo "  │  6. ¡Listo! Comparte la URL con tus jugadores       │"
  echo "  └─────────────────────────────────────────────────────┘"
  echo ""
else
  echo ""
  echo "  ❌ Error al subir. Asegúrate de:"
  echo "     - Haber creado el repo en https://github.com/new"
  echo "     - Estar autenticado (gh auth login o token configurado)"
  echo ""
fi
