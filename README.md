# 👹​ Diabletes de Timanfaya

> Versión 3.0 — Socket.io reemplazado por Firebase Realtime Database

## Arquitectura

```
Antes (v2):                        Ahora (v3):
─────────────────────────────     ──────────────────────────────────────
Cliente ←→ Socket.io ←→ Server    Cliente → HTTP POST → Servidor Node
                                   Cliente ← onValue() ← Firebase DB
                                   Servidor → Admin SDK → Firebase DB
```

- **Servidor Node.js** recibe acciones via HTTP REST (sin Socket.io)
- **Firebase Realtime Database** almacena el estado de la sala en tiempo real
- **Cliente React** escucha cambios en Firebase con `onValue()` (sin polling)
- Las notificaciones privadas (rol, turno nocturno) van a `/notif/{code}/{playerId}`

---

## Configuración inicial (5 minutos)

### 1. Credenciales del Servidor (Firebase Admin SDK)

1. Ve a [console.firebase.google.com](https://console.firebase.google.com)
2. Selecciona tu proyecto → **⚙️ Configuración del proyecto**
3. Pestaña **Cuentas de servicio**
4. Haz clic en **"Generar nueva clave privada"** → descarga el JSON
5. **Reemplaza** el contenido de `server/serviceAccountKey.json` con ese JSON

### 2. Credenciales del Cliente (Firebase SDK Web)

1. En la consola Firebase → **⚙️ Configuración del proyecto**
2. Pestaña **General** → sección **"Tu aplicación"** (o añade una app web con `</>`)
3. Copia el objeto `firebaseConfig`
4. Abre `client/src/firebase.js` y **pega tus valores** en el objeto `firebaseConfig`:

```js
const firebaseConfig = {
  apiKey:            "AIzaSy...",
  authDomain:        "mi-proyecto.firebaseapp.com",
  databaseURL:       "https://mi-proyecto-default-rtdb.firebaseio.com",
  projectId:         "mi-proyecto",
  storageBucket:     "mi-proyecto.appspot.com",
  messagingSenderId: "123456789",
  appId:             "1:123...",
};
```

### 3. Reglas de seguridad de Firebase Realtime Database

En la consola Firebase → **Realtime Database → Reglas**, pega esto:

```json
{
  "rules": {
    "salas": {
      "$code": {
        ".read":  true,
        ".write": false
      }
    },
    "notif": {
      "$code": {
        "$playerId": {
          ".read":  true,
          ".write": false
        }
      }
    },
    "eventos": {
      "$code": {
        ".read":  true,
        ".write": false
      }
    }
  }
}
```

> **Nota:** El servidor Node escribe en Firebase usando el Admin SDK (con credenciales privadas),  
> por lo que las reglas solo restringen lo que los clientes pueden escribir directamente.

---

## Arrancar

### Windows
```
start.bat
```

### Linux / Mac
```bash
chmod +x start.sh
./start.sh
```

### Manual
```bash
# Terminal 1 — Servidor
cd server && npm install && node index.js

# Terminal 2 — Cliente
cd client && npm install && npm run dev
```

Abre **http://localhost:3000** en el navegador.  
Desde la red local: **http://[TU_IP_LOCAL]:3000**

---

## Variables de entorno (para deploy)

En producción puedes usar variables de entorno en lugar de archivos:

```bash
# Servidor
FIREBASE_SERVICE_ACCOUNT='{"type":"service_account",...}'  # JSON completo
FIREBASE_DATABASE_URL='https://mi-proyecto-default-rtdb.firebaseio.com'
PORT=3001

# Cliente (Vite — crear .env en /client)
VITE_SERVER_URL=https://mi-servidor.railway.app
```

---

## Diferencias respecto a la versión con Socket.io

| Característica | Socket.io (v2) | Firebase (v3) |
|---|---|---|
| Protocolo | WebSocket persistente | HTTP + Firebase Realtime |
| Servidor necesario | Sí (Node + Socket.io) | Sí (Node + Express) |
| Estado tiempo real | `socket.on("room_updated")` | `onValue(/salas/{code})` |
| Notif. privadas | `io.to(id).emit(...)` | `/notif/{code}/{id}` en Firebase |
| Reconexión | Manual (sessionStorage) | Firebase reconecta solo |
| Acceso offline | No | Firebase cachea localmente |
| Coste | Gratis | Gratis (plan Spark) |
