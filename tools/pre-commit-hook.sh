#!/usr/bin/env bash
#
# Pre-commit hook: build the site and run htmlproofer
# Install with:  ln -sf ../../tools/pre-commit-hook.sh .git/hooks/pre-commit
# Or run:        bash tools/pre-commit-hook.sh   (manual test)

set -eu

# Ensure gem user-installed executables (like bundle) are on PATH
_user_gem_bin="$(ruby -e 'puts Gem.user_dir')/bin"
case ":${PATH}:" in
  *":${_user_gem_bin}:"*) ;;
  *) export PATH="${_user_gem_bin}:${PATH}" ;;
esac

echo "==> Running pre-commit site test..."

# Use git to find the repo root (works reliably even when GIT_DIR is set)
PROJ_ROOT="$(git rev-parse --show-toplevel)"

cd "$PROJ_ROOT"

bash tools/test.sh
