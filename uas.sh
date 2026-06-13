#!/bin/bash
# Universal AI Skills (uas) CLI Manager

SKILLS_REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
TARGET_DIR="${HOME}/.gemini/skills"

show_help() {
    echo "Universal AI Skills (uas) Manager"
    echo "Usage:"
    echo "  uas list                     - List all available skills grouped by category"
    echo "  uas search <keyword>         - Search for skills by name or content keyword"
    echo "  uas install <category/skill> - Install a specific skill to your local agent"
    echo "  uas uninstall <skill>        - Remove a skill from your local agent"
    echo ""
}

case "$1" in
    list)
        echo "📚 Available Skills in Universal Registry:"
        echo "----------------------------------------"
        for category in "$SKILLS_REPO_DIR"/*/; do
            [ -d "$category" ] || continue
            cat_name=$(basename "$category")
            echo "📁 $cat_name/"
            for skill in "$category"*.md; do
                [ -e "$skill" ] || continue
                skill_name=$(basename "$skill" .md)
                echo "   ├── $cat_name/$skill_name"
            done
            echo ""
        done
        ;;
    search)
        if [ -z "$2" ]; then
            echo "Error: Please provide a search keyword."
            exit 1
        fi
        echo "🔍 Searching for '$2'..."
        echo "----------------------------------------"
        find "$SKILLS_REPO_DIR" -type f -iname "*$2*.md" | while read -r file; do
            skill_name=$(basename "$file" .md)
            cat_name=$(basename "$(dirname "$file")")
            echo "✅ Match: $cat_name/$skill_name"
        done
        ;;
    install)
        if [ -z "$2" ]; then
            echo "Error: Please specify the skill to install (e.g., uas install personas/code-reviewer)"
            exit 1
        fi
        source_file="$SKILLS_REPO_DIR/$2.md"
        if [ ! -f "$source_file" ]; then
            echo "Error: Skill '$2' not found in registry."
            exit 1
        fi
        
        mkdir -p "$TARGET_DIR"
        skill_name=$(basename "$source_file")
        
        # Symlink to keep it live-updated
        ln -sf "$source_file" "$TARGET_DIR/$skill_name"
        echo "🚀 Successfully installed '$skill_name' to your Godmode Engine!"
        echo "   You can now trigger it with: @~/.gemini/skills/$skill_name"
        ;;
    uninstall)
        if [ -z "$2" ]; then
            echo "Error: Please specify the skill to uninstall."
            exit 1
        fi
        target_file="$TARGET_DIR/$2.md"
        if [ -L "$target_file" ] || [ -f "$target_file" ]; then
            rm "$target_file"
            echo "🗑️ Uninstalled '$2' from local agent."
        else
            echo "Error: Skill '$2' is not installed locally."
        fi
        ;;
    *)
        show_help
        ;;
esac
