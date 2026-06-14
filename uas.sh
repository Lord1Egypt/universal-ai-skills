#!/bin/bash
# Universal AI Skills (uas) CLI Manager
# Usage: ./uas.sh <command> [args]

set -eu

SKILLS_REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
TARGET_DIR="${UAS_TARGET_DIR:-${HOME}/.gemini/skills}"

show_help() {
    echo "Universal AI Skills (uas) Manager"
    echo "Usage:"
    echo "  uas list                     - List all available skills grouped by category"
    echo "  uas search <keyword>         - Search for skills by name or content keyword"
    echo "  uas install <path>           - Install a specific skill to your local agent"
    echo "  uas uninstall <name>         - Remove a skill from your local agent"
    echo ""
    echo "Environment:"
    echo "  UAS_TARGET_DIR  - Installation target (default: ~/.gemini/skills)"
    echo ""
}

list_skills() {
    echo "Available Skills in Universal Registry:"
    echo "----------------------------------------"
    for category in "$SKILLS_REPO_DIR"/*/; do
        [ -d "$category" ] || continue
        cat_name=$(basename "$category")
        has_files=false
        for skill in "$category"*.md "$category"*.txt; do
            [ -e "$skill" ] || continue
            $has_files || echo "  $cat_name/"
            has_files=true
            base=$(basename "$skill")
            echo "    - $cat_name/$base"
        done
    done
    # Also list root-level files
    for f in "$SKILLS_REPO_DIR"/*.md "$SKILLS_REPO_DIR"/*.txt; do
        [ -e "$f" ] || continue
        base=$(basename "$f")
        echo "  (root)/$base"
    done
}

case "${1:-}" in
    list)
        list_skills
        ;;
    search)
        if [ -z "${2:-}" ]; then
            echo "Error: Please provide a search keyword."
            exit 1
        fi
        echo "Searching for '$2'..."
        echo "----------------------------------------"
        find "$SKILLS_REPO_DIR" -type f \( -iname "*$2*" \) | while read -r file; do
            name=$(basename "$file")
            dir=$(basename "$(dirname "$file")")
            echo "  Match: $dir/$name"
        done
        ;;
    install)
        if [ -z "${2:-}" ]; then
            echo "Error: Please specify the skill to install (e.g., uas install personas/code-reviewer)"
            exit 1
        fi
        # Try .md first, then .txt
        source_file="$SKILLS_REPO_DIR/$2"
        [ -f "$source_file" ] || source_file="$SKILLS_REPO_DIR/$2.md"
        [ -f "$source_file" ] || source_file="$SKILLS_REPO_DIR/$2.txt"
        if [ ! -f "$source_file" ]; then
            echo "Error: Skill '$2' not found in registry."
            exit 1
        fi
        mkdir -p "$TARGET_DIR"
        skill_name=$(basename "$source_file")
        ln -sf "$source_file" "$TARGET_DIR/$skill_name"
        echo "Installed '$skill_name'"
        echo "  Trigger with: @${TARGET_DIR}/$skill_name"
        ;;
    uninstall)
        if [ -z "${2:-}" ]; then
            echo "Error: Please specify the skill to uninstall."
            exit 1
        fi
        # Try exact name, .md, .txt
        target_file="$TARGET_DIR/$2"
        [ -f "$target_file" ] || target_file="$TARGET_DIR/$2.md"
        [ -f "$target_file" ] || target_file="$TARGET_DIR/$2.txt"
        if [ -L "$target_file" ] || [ -f "$target_file" ]; then
            rm "$target_file"
            echo "Uninstalled '$2'."
        else
            echo "Error: Skill '$2' is not installed locally."
            exit 1
        fi
        ;;
    *)
        show_help
        ;;
esac
