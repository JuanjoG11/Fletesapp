# 🔍 Dónde encontrar las claves (Nuevas Secciones)

En tu proyecto, Supabase parece tener un diseño nuevo. Si la pestaña de "Legacy" está vacía, intenta esto:

## Opción A: Revisar "API de datos" 📊
1. En el menú de la izquierda, justo ENCIMA de donde dice "Claves API"...
2. Haz clic en **"API de datos"**.
3. Revisa si ahí aparece el **Project URL** y las claves **anon** o **service_role**.

## Opción B: Forzar la generación de la clave
1. Si estás en la pestaña **"Claves API de rol de servicio anónimo heredado"** y no sale nada...
2. Toma una captura de pantalla de esa pestaña vacía y envíamela.
3. Esto me ayudará a ver si hay algún botón de "Activar" o "Generar".

---

### Recordatorio del formato:
Necesito la clave que empieza con **`eyJ...`** (JWT).

Las claves que empiezan con `sb_publishable_` son para un sistema nuevo llamado "Supabase Vault" o "Supabase Auth Helpers" muy específico, pero la librería estándar que usamos en tu código necesita el formato `eyJ...`.

**¿Qué ves en "API de datos"?**
