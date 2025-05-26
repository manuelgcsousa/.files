#!/usr/bin/env python3

import platform
from pathlib import Path

# get running platform
PLATFORM = platform.system()

# specific platform skips
PLATFORM_SKIPS = {
    "Linux": {"aerospace"},
    "Darwin": {"i3"}
}

# path definitions
DOTFILES_DIR = Path(__file__).resolve().parent
CONFIG_DIR = Path.home() / ".config"
CONFIG_SRC_DIR = DOTFILES_DIR / ".config"

# ensure '$HOME/.config' exists
CONFIG_DIR.mkdir(parents=True, exist_ok=True)


# links for '$HOME/.config/...'
for item in CONFIG_SRC_DIR.iterdir():
    print(f"Linking '{item.name}'...")

    if item.name in PLATFORM_SKIPS.get(PLATFORM, set()):
        print(f"Skipping '{item.name}' on {PLATFORM}...")
        continue

    source = item
    target = CONFIG_DIR / item.name

    if target.exists() or target.is_symlink():
        print(f"Skipping existing '{target}'")
    else:
        target.symlink_to(source)
        print(f"Linked '{source}' ~> '{target}'")


# link '$HOME/.zshrc'
zshrc_source = DOTFILES_DIR / ".zshrc"
zshrc_target = Path.home() / ".zshrc"

print("Linking '.zshrc'...")
if zshrc_target.exists() or zshrc_target.is_symlink():
    print(f"Skipping existing '{zshrc_target}'")
else:
    zshrc_target.symlink_to(zshrc_source)
    print(f"Linked '{zshrc_source}' ~> '{zshrc_target}'")
