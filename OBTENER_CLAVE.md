# 🔑 Cómo Obtener la Clave Correcta de Supabase

## ⚠️ La Clave que me Enviaste NO es de Supabase

La clave que me enviaste (`sb_publishable_...`) es una clave de **Stripe**, no de Supabase.

## ✅ Necesito la Clave ANON de Supabase

La clave correcta se ve así:

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFz...
```

**Características:**
- ✅ Empieza con `eyJ`
- ✅ Es MUY LARGA (varios cientos de caracteres)
- ✅ Tiene puntos (.) que separan secciones
- ✅ Se ve como un token JWT

## 📍 Dónde Encontrarla

1. En tu dashboard de Supabase
2. Ve al menú lateral → **⚙️ Settings**
3. Haz clic en **API**
4. Busca la sección **"Project API keys"**
5. Verás DOS claves:
   - 🟢 **anon** / **public** ← **ESTA ES LA QUE NECESITO**
   - 🔴 **service_role** ← NO me des esta

## 🎯 Acción Requerida

Por favor, vuelve a Supabase y:
1. Busca la sección **"Project API keys"**
2. Copia la clave que dice **"anon"** o **"public"**
3. Pégamela completa aquí

La clave debe verse así:
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBubm5jY29saWxsaXFjZHpsaGN5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk...
```

---

**Tu URL está correcta:**
✅ `https://pnnnccolilliqcdzlhcy.supabase.co`

**Solo falta la clave anon correcta!** 🔑
