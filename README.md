# Linux Environment (Dotfiles)

![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-blue?logo=arch-linux)
![Hyprland](https://img.shields.io/badge/Window_Manager-Hyprland-jq?logo=linux)
![Shell](https://img.shields.io/badge/Shell-Fish-green?logo=gnu-bash)

> **Personalized Development Environment** based on the Caelestia dotfiles, optimized for Python development and seamless multitasking.

## Showcase



## About This Project

This repository hosts the configuration files (dotfiles) for my daily driver Arch Linux system. 

As a developer. I needed an environment that is lightweight, keyboard-centric, and aesthetically pleasing to reduce eye strain during long coding sessions. I chose **Hyprland** (a Wayland tiling window manager) to maximize screen real estate and manage multiple terminal windows efficiently.

## Tech Stack & Tools

* **OS:** Arch Linux
* **Window Manager:** Hyprland
* **Toolkit:** Quickshell
* **Terminal:** Foot (GPU accelerated)
* **Shell:** Fish (Friendly Interactive Shell)
* **Editor:** VSCode
* **Browser:** Zen Browser (Firefox fork)
* **Bar/Widgets:** Waybar & Eww

## Key Features & Customizations

This setup is built upon the [Caelestia](https://github.com/caelestia-dots) base, with personal modifications to suit my workflow:

* **Productivity Workflow:** Custom keybindings (`Super` + keys) to launch IDEs, terminals, and browsers even spotify instantly without touching the mouse.
* **Project Management:** Integrated directory structure for Python/ML projects.
* **Automation:** Includes custom scripts (e.g., `mirror_toggle.sh`) to handle display outputs for presentations automatically.
* **Symlink Management:** All configurations are centralized in this repository and symlinked to `~/.config` to ensure easy backup and replication across machines.

## Installation

This repository is designed for my personal use. To replicate this setup on a fresh Arch Linux install:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/therabitt/dotfiles ~/caelestia
    ``` 
2. **Install configuration**
    Make sure you have installed [`fish`](https://github.com/fish-shell/fish-shell) in your computer.
    ```
    cd ~/caelestia
    ./install.fish
    ```

3.  **Link configurations:**
    (I use a manual symlink strategy to ensure control over every file)
    ```bash
    ln -s ~/caelestia/hypr ~/.config/hypr
    ln -s ~/caelestia/fish ~/.config/fish
    ln -s ~/caelestia/foot ~/.config/foot
    ln -s ~/caelestia/caelestia ~/.config/caelestia
    ln -s ~/caelestia/scripts/ds-init ~/.local/bin/ds-init          # Python script to automation generate Data Science/MLOps environment project.  
    ```

>[!Note]
You can read official documentation of [caelestia](https://github.com/caelestia-dots/caelestia) for a lot of more information.

## Useful Keybindings

| Key Combination | Action |
| :--- | :--- |
| `Super` + `Return` | Open Terminal (Foot) |
| `Super` + `C` | Open IDE (VSCode) |
| `Super` + `W` | Open Browser (Zen) |
| `Super` + `Space` | App Launcher |
| `Super` + `S` | Special Workspace |
| `Super` + `1-9` | Switch Workspace |


>[!Tip]
You can simply type 'hints' command in your terminal to show every abbrevation that can use in your terminal (you can also modify the hints).

## Credits

* **Base Framework:** [Caelestia Dots](https://github.com/caelestia-dots) - Massive thanks for the beautiful foundation and aesthetic assets.
* **Toolkit:** [Quickshell](https://quickshell.org)
* **Wallpapers:** Various artists (stored locally).

---

*Maintained by **therabitt** for daily development usage.*
