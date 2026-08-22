# EvenUp Cloud — GitHub Pages edition

This is a separate project from the original EvenUp MVP. It adds email/password login and cloud-synced trips using Supabase while keeping the frontend compatible with GitHub Pages.

## 1. Create the cloud database

1. Create a free project at https://supabase.com.
2. Open **SQL Editor**, paste `supabase/schema.sql`, and run it.
3. In **Authentication → URL Configuration**, add your GitHub Pages URL to the allowed redirect URLs.
4. Copy the **Project URL** and **anon public key** from the project's API settings.

## 2. Test locally

1. Copy `.env.example` to `.env`.
2. Replace the two placeholders with the Supabase project URL and anon key.
3. Run `npm install`, then `npm run dev`.

## 3. Publish on GitHub Pages

1. Create a new GitHub repository, for example `evenup-cloud`.
2. Upload this entire project to that repository.
3. In **Settings → Secrets and variables → Actions**, create repository secrets named `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`.
4. In **Settings → Pages**, select **GitHub Actions** as the source.
5. Push to `main`. The included workflow builds and publishes the site automatically.

Your URL will be `https://YOUR-USERNAME.github.io/evenup-cloud/`.

## Security

The anon key is intentionally used by the browser and is safe to expose when Row Level Security is enabled. The included SQL enables RLS so each signed-in user can only access their own trips and expenses. Never place the Supabase service-role key in this project or in GitHub Pages.

## Current scope

- Account creation, confirmation, login, and logout
- Cloud-synced trips and expenses across devices
- Simple equal splits and settlement calculation
- Mobile-first interface

Trip sharing between multiple accounts is the next logical feature. The current version focuses on the stated goal: one person can securely access the same expenses from any device.
