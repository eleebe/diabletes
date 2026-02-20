# 🐺 Hombres Lobo de Castronegro

Juego multijugador online. Una vez desplegado, cualquier persona del mundo puede unirse con el código de sala — sin importar la red WiFi.

---

## 🚀 DEPLOY ONLINE EN 5 MINUTOS (gratis, sin tarjeta)

### Opción A — Railway (recomendado)

**Paso 1 — Sube el código a GitHub**
1. Ve a https://github.com/new y crea un repositorio (puede ser privado)
2. Abre una terminal en la carpeta del proyecto y ejecuta:
```bash
git init
git add .
git commit -m "Hombres Lobo v5"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
```

**Paso 2 — Despliega en Railway**
1. Ve a https://railway.app y entra con tu cuenta de GitHub
2. Pulsa **"New Project"** → **"Deploy from GitHub repo"**
3. Selecciona tu repositorio
4. Railway detecta el `railway.json` automáticamente y despliega
5. Ve a **Settings → Networking → Generate Domain**
6. Obtienes una URL tipo `hombres-lobo-xxxx.up.railway.app` ✓

**Paso 3 — Jugar**
- Comparte esa URL con todos los jugadores
- Funciona desde cualquier móvil, cualquier red, en cualquier parte del mundo

---

### Opción B — Render (también gratis)

1. Ve a https://render.com y entra con GitHub
2. **"New Web Service"** → selecciona tu repo
3. Render detecta `render.yaml` automáticamente
4. Build command: `npm run build`
5. Start command: `npm start`
6. Obtienes una URL tipo `hombres-lobo.onrender.com`

> ⚠️ Render pone el servicio a dormir tras 15 min de inactividad (plan gratis).
> La primera conexión puede tardar ~30 segundos en despertar.
> Railway no tiene este problema.

---

### Opción C — ngrok (para pruebas rápidas sin GitHub)

Si quieres probar online sin subir código:

1. Instala ngrok: https://ngrok.com/download
2. Arranca el servidor local:
```bash
npm run install:all
npm run dev
```
3. En otra terminal:
```bash
ngrok http 3001
```
4. Ngrok te da una URL tipo `https://abc123.ngrok.io`
5. Los jugadores acceden a esa URL desde cualquier sitio

> ⚠️ La URL cambia cada vez que reinicias ngrok (plan gratis).

---

## 💻 Desarrollo local (misma WiFi)

```bash
npm run install:all   # primera vez
npm run dev           # inicia servidor + cliente
```

- Tu pantalla: http://localhost:3000
- Otros en la misma WiFi: http://TU_IP_LOCAL:3000

---

## 🎮 Cómo jugar

| Pantalla | Quién |
|----------|-------|
| Crea la sala | Un jugador (anfitrión) |
| Comparte el código de 5 dígitos | Anfitrión → resto |
| Los demás entran con el código | Cada jugador en su móvil |
| Configura los roles | Anfitrión |
| Inicia la partida | Anfitrión |

### Roles disponibles
🐺 Lobo · 🧑‍🌾 Aldeano · 🔮 Vidente · 🧪 Bruja · 🏹 Cazador  
🛡️ Protector · 💘 Cupido · 👁️ Niña · ⭐ Alguacil · 🃏 Ladrón

### Condiciones de victoria
- **Aldea** → elimina a todos los lobos
- **Lobos** → son mayoría entre los vivos
- **Enamorados** → son los 2 últimos supervivientes

---

## 📁 Estructura

```
├── server/index.js      Motor de juego (Node + Socket.io)
├── client/src/App.jsx   Interfaz completa (React)
├── railway.json         Config deploy Railway
├── render.yaml          Config deploy Render
└── package.json         Scripts (build, start, dev)
```
