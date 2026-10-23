# TravelWeather

App móvil para guardar destinos de viaje y consultar su clima en tiempo real.

## Funcionalidades

✅ **Autenticación**: Login y registro con Firebase Authentication  
✅ **Gestión de Destinos**: Agregar ciudad, país y coordenadas  
✅ **Base de Datos**: Firestore con sincronización en tiempo real  
✅ **API del Clima**: OpenWeather para temperatura y condiciones  
✅ **UX**: Indicadores de carga, validaciones y mensajes de error

## Configuración

### 1. Firebase
1. Crear proyecto en [Firebase Console](https://console.firebase.google.com/)
2. Habilitar Authentication (Email/Password)
3. Crear base de datos Firestore (modo prueba)
4. Descargar `google-services.json`
5. Colocarlo en `android/app/google-services.json`

### 2. Ejecutar
```bash
flutter pub get
flutter run
```

## Estructura
```
lib/
├── screens/
│   ├── auth/          # Login y registro
│   ├── destinations/  # Agregar destinos
│   └── home/         # Lista con clima
├── services/         # API OpenWeather
├── widgets/          # Componentes reutilizables
└── main.dart         # Punto de entrada
```

## API Key
La app usa OpenWeather API (key incluida en el código)
