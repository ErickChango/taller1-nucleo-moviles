# TravelWeather - Información del Proyecto

## Descripción
Aplicación móvil Flutter para guardar destinos de viaje y consultar su clima actual en tiempo real.

## Tecnologías
- Flutter 3.x
- Firebase Authentication
- Cloud Firestore
- OpenWeather API

## Estructura del Proyecto
```
lib/
├── firebase/          # Configuración y servicios de Firebase
├── models/           # Modelos de datos
├── navigation/       # Rutas y navegación
├── screens/          # Pantallas de la aplicación
│   ├── auth/        # Login y registro
│   ├── home/        # Pantalla principal
│   └── destinations/ # Gestión de destinos
├── services/         # Servicios externos (clima)
├── styles/          # Colores y estilos
├── utils/           # Utilidades y validadores
└── widgets/         # Componentes reutilizables
```

## Características
- Autenticación con email/contraseña
- CRUD de destinos (ciudad, país, coordenadas)
- Consulta de clima en tiempo real
- Sincronización en la nube
- Validaciones de formularios
- Interfaz simple y funcional
