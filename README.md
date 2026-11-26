# Nuestro rincón

Página privada para dos: contador de tiempo juntos, línea de tiempo de fotos, recuerdos y avisos de estado de ánimo.

## Configuración
1. Crea un proyecto en Supabase.
2. En `configuracion.sql` cambia los correos y `TU_TEMA_NTFY`, y ejecútalo en SQL Editor (sin subir esos datos a GitHub).
3. Crea los dos usuarios en Authentication y desactiva nuevos registros.
4. En `index.html` llena `SUPABASE_URL`, `SUPABASE_KEY` (publishable o anon, nunca la secret) y `FECHA_INICIO`.
5. Instala la app ntfy y suscríbete a tu tema.
6. Publica en GitHub Pages (Settings, Pages, rama main) o Netlify.

Si el repositorio es público, la fecha de inicio y el código de la página serán visibles.
Los avisos no sustituyen una llamada en una emergencia.
