create extension if not exists "pgcrypto";
create table public.trips (id uuid primary key default gen_random_uuid(), owner_id uuid not null references auth.users(id) on delete cascade, name text not null, currency text not null default 'USD', members jsonb not null default '[]', created_at timestamptz not null default now());
create table public.expenses (id uuid primary key default gen_random_uuid(), trip_id uuid not null references public.trips(id) on delete cascade, owner_id uuid not null references auth.users(id) on delete cascade, description text not null, amount numeric not null check(amount>0), currency text not null default 'USD', payer text not null, participants jsonb not null default '[]', category text not null default 'Other', created_at timestamptz not null default now());
alter table public.trips enable row level security;alter table public.expenses enable row level security;
create policy "owners manage trips" on public.trips for all using(auth.uid()=owner_id) with check(auth.uid()=owner_id);
create policy "owners manage expenses" on public.expenses for all using(auth.uid()=owner_id) with check(auth.uid()=owner_id);
create index expenses_trip_id_idx on public.expenses(trip_id);
