# TravelWeather - Requisitos del Proyecto

## Requisitos Cumplidos

### 1. Autenticación ✅
- Pantalla de login segura con Firebase Auth
- Pantalla de registro con validaciones
- Persistencia de sesión automática

### 2. Interfaz (UI) ✅
- Lista de destinos guardados
- Formulario para agregar destinos:
  * Ciudad (requerido)
  * País (requerido)  
  * Coordenadas (opcional)

### 3. Base de Datos (Nube) ✅
- Firestore para almacenar destinos
- Asociados al usuario autenticado
- Listeners para cambios en tiempo real
- Sincronización automática entre dispositivos

### 4. API del Clima ✅
- Integración con OpenWeather API
- Endpoint: `https://api.openweathermap.org/data/2.5/weather?q=CIUDAD&appid=API_KEY&units=metric&lang=es`
- Muestra temperatura y condiciones en tiempo real

### 5. Experiencia (UX) ✅
- Indicadores de carga (CircularProgressIndicator)
- Validación de campos vacíos
- Mensajes claros de error
- Manejo de fallos de conexión

## Estructura del Proyecto

```
lib/
├── main.dart                       # Inicialización y rutas
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart       # Login con email/password
│   │   └── register_screen.dart    # Registro de nuevos usuarios
│   ├── destinations/
│   │   └── add_destination_screen.dart  # Formulario agregar destino
│   └── home/
│       └── home_screen.dart        # Lista de destinos con clima
├── services/
│   └── weather_service.dart        # Servicio OpenWeather API
└── widgets/
    └── weather_card.dart           # Card de destino con clima
```

## Tecnologías
- Flutter 3.x
- Firebase Authentication
- Cloud Firestore
- OpenWeather API
- HTTP requests
