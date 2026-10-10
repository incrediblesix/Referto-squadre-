-- Referto Squadra: tabelle e regole di accesso
-- Incolla tutto questo testo nell'editor SQL di Supabase e premi "Run".
-- Si può eseguire più volte senza rovinare i dati.

create table if not exists public.team (
  id int primary key default 1 check (id = 1),
  name text not null default 'La mia squadra',
  season text not null default '',
  logo text not null default '',
  logo_v bigint not null default 0
);
insert into public.team (id) values (1) on conflict (id) do nothing;

create table if not exists public.players (
  id text primary key,
  name text not null default '',
  number int
);

create table if not exists public.games (
  id text primary key,
  date text not null default '',
  opp text not null default '',
  home boolean not null default true,
  their_pts int not null default 0,
  our_pts int,
  stats jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

-- Regole di accesso: chiunque abbia il link legge, solo chi ha fatto l'accesso scrive.
alter table public.team enable row level security;
alter table public.players enable row level security;
alter table public.games enable row level security;

drop policy if exists "lettura pubblica" on public.team;
drop policy if exists "scrittura con accesso" on public.team;
drop policy if exists "lettura pubblica" on public.players;
drop policy if exists "scrittura con accesso" on public.players;
drop policy if exists "lettura pubblica" on public.games;
drop policy if exists "scrittura con accesso" on public.games;

create policy "lettura pubblica" on public.team for select to anon, authenticated using (true);
create policy "scrittura con accesso" on public.team for all to authenticated using (true) with check (true);

create policy "lettura pubblica" on public.players for select to anon, authenticated using (true);
create policy "scrittura con accesso" on public.players for all to authenticated using (true) with check (true);

create policy "lettura pubblica" on public.games for select to anon, authenticated using (true);
create policy "scrittura con accesso" on public.games for all to authenticated using (true) with check (true);
