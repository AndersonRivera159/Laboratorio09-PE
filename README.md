Integración Flutter con Código Nativo (Kotlin/Swift)

Este proyecto muestra cómo integrar funcionalidades en código nativo (Kotlin para Android y Swift para iOS) dentro de una aplicación Flutter. Utilizamos diferentes tecnologías de interoperabilidad para comunicar Flutter con el código de plataforma.

| Tecnología                         | Descripción                                                                        | Dirección        | Uso principal                             |
| ---------------------------------- | ---------------------------------------------------------------------------------- | ---------------- | ----------------------------------------- |
| `MethodChannel`                    | Canal para invocar métodos nativos desde Dart y obtener un resultado.              | Bidireccional    | Funciones simples como obtener datos      |
| `EventChannel`                     | Canal para recibir flujos de datos (streams) desde nativo hacia Flutter.           | Nativo → Flutter | Eventos continuos como sensores           |
| `BasicMessageChannel`              | Canal para intercambiar mensajes personalizados (cualquier tipo de dato).          | Bidireccional    | Comunicación compleja o frecuente         |
| `Pigeon`                           | Generador de código que facilita la comunicación entre Dart y plataformas nativas. | Bidireccional    | Proyectos grandes con múltiples funciones |
| `FFI` (Foreign Function Interface) | Permite a Dart llamar funciones de bibliotecas en C/C++.                           | Dart → C/C++     | Computación de alto rendimiento           |
