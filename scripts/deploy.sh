#!/bin/bash
# Deploy skills to ../validate-skills/.claude/skills for testing
# Usage: ./scripts/deploy.sh [skill-name]
#   If no skill-name provided, deploys all skills

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEPLOY_DIR="$REPO_ROOT/../validate-skills/.claude/skills"

mkdir -p "$DEPLOY_DIR"

deploy_skill() {
  local skill_dir="$1"
  local skill_name="$(basename "$skill_dir")"

  echo "Deploying $skill_name..."
  rm -rf "$DEPLOY_DIR/$skill_name"
  cp -r "$skill_dir" "$DEPLOY_DIR/$skill_name"
  echo "  -> $DEPLOY_DIR/$skill_name"
}

if [ -n "$1" ]; then
  skill_path="$REPO_ROOT/skills/$1"
  if [ ! -d "$skill_path" ]; then
    echo "Error: skill '$1' not found at $skill_path"
    exit 1
  fi
  deploy_skill "$skill_path"
else
  for skill_dir in "$REPO_ROOT/skills"/*/; do
    [ -d "$skill_dir" ] && deploy_skill "$skill_dir"
  done
fi

echo "Deploy complete."
