# Guía de Colaboración (Flutter)

Idiomas disponibles:  
- [Inglés](CONTRIBUTING.md)  
- [Español](CONTRIBUTING.es.md)

Este repositorio contiene la **aplicación móvil Flutter** del proyecto **Demy**.  
Esta guía define cómo trabajamos en equipo para mantener un flujo organizado y consistente.

---

## 1) Introducción rápida

### Requisitos
- **Flutter SDK** (última versión estable)
- **Dart SDK** (incluido con Flutter)
- **Android Studio**, **VS Code** o **IntelliJ IDEA**
- Emulador o dispositivo físico (Android/iOS)
- Opcional: **fvm** para gestionar versiones de Flutter

### Clonar el repositorio
```bash
git clone <REPOSITORY-URL>
cd <REPO-NAME>
```

### Configurar tu usuario de Git
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email`ejemplo.com"
```

### Abrir el proyecto
1. Abre **VS Code** o **Android Studio** → *Open Folder* → selecciona la carpeta del repo.  
2. Ejecuta `flutter pub get` para instalar dependencias.  
3. Verifica tu entorno con `flutter doctor`.

### Compilar y ejecutar
```bash
# Obtener dependencias
flutter pub get

# Ejecutar la app
flutter run

# Analizar el código
flutter analyze

# Ejecutar tests
flutter test
```

> Consejo: si es tu primera contribución, crea primero una rama de feature (ver sección *Workflow de Git*).

---

## 2) Workflow de Git

- Repositorio central: **GitHub**. Rama principal: `main`.  
- Modelo de ramas: **Gitflow** (adaptado a Flutter).  
  - `main`: versiones estables (hitos académicos)  
  - `develop`: integración de nuevas funcionalidades  
  - Ramas de soporte:
    - `feature/<tema>` → nuevas funcionalidades.  
      Ejemplo: `feature/login-screen`, `feature/profile-edit`  
    - `hotfix/<nombre>` → correcciones críticas.  
      Ejemplo: `hotfix/fix-crash-on-start`  
    - `release/vX.Y.Z` → preparación de versiones.  
      Ejemplo: `release/v1.0.0`

### Mantener tu rama actualizada (con `develop`)
```bash
git checkout feature/login-screen
git fetch origin
git merge origin/develop
git push origin feature/login-screen
```

### Crear tu rama de feature (desde `develop`)
```bash
git checkout develop
git pull origin develop
git checkout -b feature/<tu-tema>
```

---

## 3) Mensajes de commit (Conventional Commits)

Usamos el estándar de **Conventional Commits** en inglés, con un **scope opcional** para indicar el área afectada.

**Formato**  
`<type>(<scope>): <mensaje>`

**Tipos comunes**
- `feat` → nueva funcionalidad (pantalla o componente)
- `fix` → corrección de error
- `refactor` → mejora de código sin cambio funcional
- `perf` → mejora de rendimiento
- `docs` → documentación (README, guías)
- `build` → actualizaciones de dependencias o configuración
- `ci` → automatización o CI/CD
- `test` → tests unitarios, de widgets o de integración
- `style` → formato o estilo (sin lógica)
- `chore` → tareas de mantenimiento

**Scopes sugeridos (Flutter)**
- `feature_login`, `feature_home`, `feature_profile`  
- `ui`, `navigation`, `core`, `data`, `network`, `i18n`, `a11y`, `bloc`, `provider`, `build`

**Ejemplos**
```
feat(feature_login): add email/password sign-in flow
fix(ui): avoid overflow in HomePage on small screens
refactor(core): extract Result<T> and Either helpers
perf(feature_home): cache API responses to reduce jank
docs(readme): add setup and run instructions
build(pubspec): bump flutter_bloc and dio versions
```

---

## 4) Pull Requests (PR)

- **Rama base**: `develop` (nunca `main`).  
- Usa la **plantilla de PR** y explica **qué** cambiaste y **por qué**.  
- Si aplica, vincula un Issue con `Closes #<número-de-issue>`.  
- Solicita revisión de **al menos un compañero**.  
- Estrategia de merge: **Merge commit** (no squash) para mantener el historial completo.

### Checklist antes de abrir un PR
- [ ] La rama `feature/*` está sincronizada con `origin/develop`.  
- [ ] El proyecto compila correctamente: `flutter pub get` y `flutter analyze` sin errores.  
- [ ] Los tests unitarios pasan: `flutter test`.  
- [ ] Los tests de integración pasan (si aplica): `flutter test integration_test`.  
- [ ] Los cambios de UI fueron probados manualmente en emulador/dispositivo (incluir capturas/GIF si corresponde).  
- [ ] No se han cometido secretos, llaves o tokens.  
- [ ] Los commits siguen **Conventional Commits**.  
- [ ] Se verificó accesibilidad (a11y) e internacionalización (i18n) si se modificó la UI.

---

## 5) Alcance de cambios

- Un **cambio lógico por PR** (evita PRs grandes).  
- Estructura recomendada:
  - **`lib/core`** → temas, navegación, utilidades, manejo de errores, constantes  
  - **`lib/features/<feature_name>`** → organización por feature (data/domain/presentation si aplica)  
  - **`assets/`** → imágenes, fuentes, traducciones (`assets/i18n`)  
- Centraliza las peticiones en `lib/core/network`.  
- Usa un patrón de estado consistente (**BLoC**, **Cubit** o **Provider**).  
- Considera siempre **i18n** (archivos ARB o JSON) y **a11y** (semántica, contraste, labels).

---

## 6) Estilo de código y convenciones

Este proyecto usa **Dart** y **Flutter**. Mantenemos reglas de estilo claras para un código limpio, legible y mantenible.

### Reglas generales
- Codificación **UTF-8**.  
- Longitud máxima de línea: **120 caracteres**.  
- Indentación: **2 espacios**.  
- Un archivo por clase pública.  
- Evita código comentado o no usado.  
- Ejecuta `dart format .` y `flutter analyze` antes de hacer commit.

### Convenciones Dart/Flutter
- **Clases y Enums**: PascalCase (`UserProfile`, `LoginCubit`)  
- **Funciones y variables**: camelCase (`loadUserData()`, `userName`)  
- **Constantes**: UPPER_CASE_CON_GUIONES (`MAX_RETRIES`)  
- **Directorios**: basados en features (`features/login`, `core/navigation`)  
- Usa `final` o `const` siempre que sea posible.  
- Divide widgets y métodos grandes para mejorar la legibilidad.

### Guías para UI
- Sigue **Material 3** (colores, tipografía, espaciado).  
- Usa **state hoisting** y evita rebuilds innecesarios.  
- Añade **Semantics** y textos alternativos en imágenes/íconos.  
- Prueba el diseño en diferentes tamaños de pantalla.  
- Mantén sincronizados los assets con `pubspec.yaml`.

---

## 7) Prácticas de testing

- Escribir **tests unitarios** para lógica pura, servicios y repositorios.  
- Escribir **tests de widgets** para componentes visuales y flujos simples.  
- Añadir **tests de integración** en `integration_test/` para flujos end-to-end.  
- Mantén los tests **rápidos y aislados**; usa mocks o fakes para IO.

### Ejecutar tests
```bash
# Tests unitarios y de widgets
flutter test

# Tests de integración (asegúrate de tener un dispositivo activo)
flutter test integration_test
```

### Guías
- Una aserción principal por test.  
- Nombres descriptivos: `login_falla_con_password_invalido()`.  
- Evita tests frágiles o dependientes del tiempo.  

---

## 8) Buenas prácticas

- Una feature o bug fix por rama/PR.  
- PRs pequeños y enfocados.  
- Mensajes de commit claros y consistentes.  
- Garantiza **i18n** (sin textos hardcodeados).  
- Asegura **a11y** (labels, foco, contraste).  
- Prueba la app en al menos un emulador y un dispositivo real.  
- No comprometas secretos, llaves o credenciales.  
- Documenta los cambios o comportamientos nuevos en el PR.

---

## 9) Builds y releases

Comandos comunes:
```bash
# Generar APK (debug/release)
flutter build apk --release

# AppBundle (para Play Store)
flutter build appbundle --release

# iOS (requiere macOS/Xcode)
flutter build ipa --release
```

Etiqueta las versiones desde `main` usando ramas `release/vX.Y.Z` y GitHub Releases.

---

## 10) Resolución de conflictos

- Mantén tu rama actualizada con `develop` para evitar conflictos:  
```bash
git checkout feature/<nombre>
git fetch origin
git merge origin/develop
```

- Si ocurren conflictos:
  - Resuélvelos localmente y haz commit.  
  - Para archivos **críticos** (tema, navegación, configuración), coordina con el equipo antes de resolver.  
- Evita usar `git push --force` salvo que sea absolutamente necesario.

---

## 11) Comunicación

- Usa los canales oficiales del equipo (Discord, WhatsApp, etc.).  
- Al abrir un PR:
  - Describe **qué** cambiaste y **por qué**.  
  - Etiqueta al menos a un compañero para revisión.  
- Usa Issues con la plantilla correspondiente (Bug, Feature, UI/UX).  
- Mantén la comunicación clara, respetuosa y profesional (ver [Código de Conducta](./CODE_OF_CONDUCT.es.md)).

---

## 12) Política de Seguridad

Por favor, no reportes vulnerabilidades públicamente en Issues o Pull Requests.  
Consulta [SECURITY.md](./SECURITY.es.md) para saber cómo reportarlas de forma privada.

---
