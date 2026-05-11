# Plan de Migración: Wowchemy/Academic → Blowfish

## Estado actual (2026-05-10)

- **Rama de trabajo:** `migration/blowfish`
- **Tema actual:** Hugo Academic/Wowchemy (starter-hugo-academic)
  - Instalado como módulo Hugo en `config.yaml` (github.com/wowchemy/...)
  - Tema local en `themes/starter-hugo-academic/`
- **URL del sitio:** https://segana.netlify.app
- **Deploy:** Netlify (`netlify.toml` presente)

## Contenido existente a migrar

| Sección | Ruta actual | Notas |
|---|---|---|
| Perfil/Bio | `content/authors/admin/_index.md` | Nombre, rol, redes sociales, educación |
| Cursos | `content/courses/` | UST (PEP, Análisis de Datos), FEN (Finanzas R), intro_r |
| Proyectos de datos | `content/data_projects/` | |
| Talks | `content/talks/` | |
| Posts | `content/post/` | |
| Publicaciones | `content/publication/` | |
| Home | `content/home/about.md` (widget activo) | Solo about.md activo |

## Información del autor (para traspasar)

- **Nombre:** Sebastián Egaña Santibáñez
- **Rol:** Analytics Translator @ LATAM Airlines
- **Descripción:** Científico de datos, docente universitario y asesor
- **Email:** sebaegana@gmail.com
- **GitHub:** https://github.com/sebaegana
- **LinkedIn:** https://www.linkedin.com/in/sebastian-egana-santibanez/
- **Twitter/X:** https://twitter.com/sebaegana
- **Mastodon:** https://mastodon.social/@segana
- **Google Scholar:** https://scholar.google.co.uk/citations?hl=es&user=curBunoAAAAJ
- **CV:** uploads/cv_sebastian_egana 20241018 PROF TI.pdf
- **Educación:**
  - Diplomado en Ciencias de Datos — Universidad del Desarrollo (2022)
  - Magíster en Finanzas — Universidad de Chile (2020)
  - Ingeniero Comercial — Universidad Santo Tomás (2017)
  - Licenciado en Filosofía — Universidad Alberto Hurtado (2009)
- **Intereses:** Análisis de datos, Finanzas, Economía, Programación

## Menú de navegación actual

- Courses → `courses/`
- Talks → `talks/`
- Data Projects → `data_projects/`
- Contact → `#contact`

## Pasos de la migración

- [ ] **1. Instalar tema Blowfish**
  - Agregar como módulo Hugo (recomendado) o submodule git
  - URL: github.com/nunocoracao/blowfish
  
- [ ] **2. Reemplazar configuración base**
  - Reescribir `config.yaml` para Blowfish (theme, módulos, outputs)
  - Crear/adaptar `config/_default/params.toml` con datos del autor
  - Crear/adaptar `config/_default/menus.toml` con menú actual
  - Crear/adaptar `config/_default/languages.toml`

- [ ] **3. Crear perfil del autor en formato Blowfish**
  - `content/authors/admin/_index.md` → nuevo formato Blowfish
  
- [ ] **4. Migrar contenido por sección**
  - Cursos (estructura de directorio se mantiene, frontmatter puede cambiar)
  - Posts, talks, data_projects, publicaciones
  
- [ ] **5. Copiar assets estáticos**
  - Carpeta `static/uploads/` (PDFs, slides, etc.)
  - Foto de perfil / avatar
  
- [ ] **6. Probar build local**
  - `hugo server` y verificar que renderiza correctamente
  
- [ ] **7. Ajustes visuales**
  - Colorscheme, fuente, layout de home page
  
- [ ] **8. Deploy a Netlify**
  - Actualizar `netlify.toml` si es necesario
  - Merge a `main`

## Notas técnicas

- Blowfish usa **TOML** por defecto para la configuración (a diferencia del YAML de Wowchemy)
- Blowfish **no usa el sistema de widgets** — la home page se construye con layouts distintos
- Los shortcodes de Wowchemy (`{{< icon >}}`, `{{< staticref >}}`) no funcionan en Blowfish y deben eliminarse del contenido
- Blowfish tiene soporte nativo para modo claro/oscuro
