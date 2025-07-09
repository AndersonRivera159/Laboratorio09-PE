Integración Flutter con Código Nativo (Kotlin/Swift)

Este proyecto muestra cómo integrar funcionalidades en código nativo (Kotlin para Android y Swift para iOS) dentro de una aplicación Flutter. Utilizamos diferentes tecnologías de interoperabilidad para comunicar Flutter con el código de plataforma.

| Tecnología                         | Descripción                                                                        | Dirección        | Uso principal                             |
| ---------------------------------- | ---------------------------------------------------------------------------------- | ---------------- | ----------------------------------------- |
| `MethodChannel`                    | Canal para invocar métodos nativos desde Dart y obtener un resultado.              | Bidireccional    | Funciones simples como obtener datos      |
| `EventChannel`                     | Canal para recibir flujos de datos (streams) desde nativo hacia Flutter.           | Nativo → Flutter | Eventos continuos como sensores           |
| `BasicMessageChannel`              | Canal para intercambiar mensajes personalizados (cualquier tipo de dato).          | Bidireccional    | Comunicación compleja o frecuente         |
| `Pigeon`                           | Generador de código que facilita la comunicación entre Dart y plataformas nativas. | Bidireccional    | Proyectos grandes con múltiples funciones |
| `FFI` (Foreign Function Interface) | Permite a Dart llamar funciones de bibliotecas en C/C++.                           | Dart → C/C++     | Computación de alto rendimiento           |

# lab_09

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> cc821d5 (Se utilizó MethodChannel para invocar funciones matemáticas nativas escritas en Swift (iOS) desde Flutter.)
