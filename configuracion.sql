-- Antes de ejecutar: reemplaza los dos correos de ejemplo (en minúsculas) en TODAS sus apariciones.
create table public.recuerdos (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  texto text,
  fecha date not null,
  foto text,
  creado timestamptz not null default now()
);
alter table public.recuerdos enable row level security;
grant select, insert, delete on public.recuerdos to authenticated;

create policy "solo nosotros" on public.recuerdos for all to authenticated
  using ((auth.jwt()->>'email') in ('TU_CORREO@ejemplo.com', 'CORREO_DE_ELLA@ejemplo.com'))
  with check ((auth.jwt()->>'email') in ('TU_CORREO@ejemplo.com', 'CORREO_DE_ELLA@ejemplo.com'));

insert into storage.buckets (id, name, public) values ('fotos', 'fotos', false);

create policy "solo nuestras fotos" on storage.objects for all to authenticated
  using (bucket_id = 'fotos' and (auth.jwt()->>'email') in ('TU_CORREO@ejemplo.com', 'CORREO_DE_ELLA@ejemplo.com'))
  with check (bucket_id = 'fotos' and (auth.jwt()->>'email') in ('TU_CORREO@ejemplo.com', 'CORREO_DE_ELLA@ejemplo.com'));

-- AVISOS (si ya ejecutaste lo de arriba, ejecuta solo desde aquí).
-- Cambia TU_TEMA_NTFY aquí en Supabase; no guardes el valor real en GitHub.
create table public.ajustes (clave text primary key, valor text not null);
alter table public.ajustes enable row level security;
grant select on public.ajustes to authenticated;
create policy "solo nosotros ajustes" on public.ajustes for select to authenticated
  using ((auth.jwt()->>'email') in ('TU_CORREO@ejemplo.com', 'CORREO_DE_ELLA@ejemplo.com'));
insert into public.ajustes (clave, valor) values ('ntfy', 'TU_TEMA_NTFY');
