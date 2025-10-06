# Kidd Custom Apparel

Marketing website and lead capture experience for Kidd Custom Apparel, built with Ruby on Rails 7.2.2.2. The application powers the public marketing site plus a handful of lead, testimonial and model application flows that feed the business pipeline.

A staging instance currently lives at `http://138.68.46.116` (DigitalOcean droplet running Ubuntu 22.04, Ruby 3.3.4, PostgreSQL 14, Puma and Nginx).

## Features

- Marketing‐focused landing pages (home, about, portfolio, testimonials) with reusable partials.
- Inquiry, testimonial and model application forms backed by Active Record models.
- Optimised asset pipeline using `cssbundling-rails`, Sass and PostCSS for vendor theme assets.
- Dark/light mode toggle, static content blocks and reusable CTA partials.
- Production build ready for precompiled assets and CDN/browser caching.

## Tech Stack

| Category       | Choice                                   |
| -------------- | ---------------------------------------- |
| Language       | Ruby 3.3.4                               |
| Framework      | Rails 7.2.2.2                            |
| Database       | PostgreSQL 14                            |
| Server         | Puma + Nginx                             |
| Frontend build | Sass (dart-sass), PostCSS, Importmap     |
| JS/CSS helpers | Bootstrap theme assets, Stimulus, Turbo  |
| Task runner    | Foreman via `bin/dev`                    |

## Local Development

### Prerequisites

- Ruby 3.3.4 (use `rbenv`, `rvm`, or `asdf`)
- Node.js ≥ 18 and Yarn 1.x (`npm install -g yarn` if needed)
- PostgreSQL running locally
- Bundler (`gem install bundler`)

### Setup Steps

```bash
# clone your fork
$ git clone https://github.com/<your-account>/queens-of-bling.git
$ cd queens_of_bling

# install Ruby gems
$ bundle install

# install JS/CSS tooling
$ yarn install --frozen-lockfile

# copy environment template (fill secrets below)
$ cp .env.example .env

# prepare database
$ bin/rails db:setup

# start the app (hot reloads via Procfile.dev)
$ bin/dev
```

Open `http://localhost:3000` to view the site.

### Environment Variables

| Variable         | Purpose                                                             |
| ---------------- | ------------------------------------------------------------------- |
| `RAILS_MASTER_KEY` | Decrypts `config/credentials/production.yml.enc`. Required for prod. |
| `DATABASE_URL`     | Connection string for the Postgres instance (optional locally).      |
| `FORCE_SSL`        | Toggle Rails `config.force_ssl` (`true` by default in production).   |

For local work you can manage environment variables with `direnv`, `dotenv-rails` or your shell profile.

## Running Tests & Checks

```bash
# Rails test suite (if/when specs are added)
$ bin/rails test

# Rubocop linting
$ bundle exec rubocop
```

## Production Build

Asset compilation happens via the standard Rails pipeline:

```bash
$ RAILS_ENV=production bundle exec rails assets:precompile
```

The compiled files live under `public/assets` and are served directly by Nginx with long-term caching.

## Project Structure Highlights

```
app/
├── controllers/        # Inquiry, testimonial, model application flows
├── views/              # Marketing pages + shared partials (navbar, footer, etc.)
├── assets/stylesheets/ # Theme Sass + CSS bundling entrypoints
├── javascript/         # Stimulus controllers, vendor JS
└── views/layouts/      # Application layout with dark/light mode toggle
config/
├── environments/       # Environment-specific settings (production tweaks)
└── initializers/       # Asset pipeline and theme configuration
```

## Contributing

1. Fork and clone the repository.
2. Create a feature branch: `git checkout -b feature/my-feature`.
3. Commit your changes with context: `git commit -m "Explain the change"`.
4. Push and open a pull request.

---

Need help with the deployment script, SSL, or the next app in your portfolio? Open an issue or ping the team.
