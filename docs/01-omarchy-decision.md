# ADR-001: Omarchy owns the machine platform

**Status:** In use  
**Decided:** 2026-09-04  
**Adapted for Codex:** 2026-09-21

Omarchy owns Arch Linux, updates, Hyprland, the shell, terminal, themes, base Git configuration, and system integrations. `computerstackgbt` owns personal development tools, a Git preferences include, Codex instructions, agents, and skills.

Use Omarchy's package interface for Arch packages. Keep project-specific settings in the project. Do not edit `/usr/share/omarchy`; it is packaged state. Link individual skills into `~/.agents/skills` so Omarchy's own skills remain available.

The bootstrap does not replace the existing `~/.codex/config.toml`, ChatGPT desktop settings, or account data. It links only items that do not already exist at their destination.

Revisit this boundary if Omarchy adds a better supported integration or this repo starts duplicating Omarchy-managed behavior.
