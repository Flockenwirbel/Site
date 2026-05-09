# Taniec Śniegu

> A personal blog about mathematics, physics, programming, music, language learning and life.

## Tech Stack

- **Framework**: [Jekyll](https://jekyllrb.com/)
- **Theme**: [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)
- **Deployment**: GitHub Pages via GitHub Actions

## Local Development

### Prerequisites

- Ruby 3.2+
- RubyGems + Bundler

### Setup

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll s
```

The site will be available at `http://127.0.0.1:4000/Site/`

## Project Structure

```
.
├── _config.yml          # Site configuration
├── _data/               # Data files (contact, share)
├── _plugins/            # Custom Jekyll plugins
├── _posts/              # Blog posts (Markdown)
├── _tabs/               # Navigation tabs
│   ├── about.md
│   ├── archives.md
│   ├── categories.md
│   └── tags.md
├── assets/
│   ├── css/             # Custom styles
│   ├── img/             # Images (avatar, etc.)
│   └── lib/             # Static assets (submodule)
├── .github/workflows/   # GitHub Actions
├── Gemfile              # Ruby dependencies
└── index.html           # Home page
```

## Categories

| Category   | Description             |
| ---------- | ----------------------- |
| 数学       | Mathematics notes       |
| 物理       | Physics notes           |
| 计算机科学 | Computer science notes  |
| 音乐       | Music notes             |
| 语言学习   | Language learning notes |
| 随笔       | Reflections and essays  |

## License

This work is licensed under the [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) License.