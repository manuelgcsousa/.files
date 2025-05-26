#!/usr/bin/env python3

import platform
import sys

from pathlib import Path


# path definitions
DOTFILES_DIR = Path(__file__).resolve().parent
CONFIG_DIR = Path.home() / ".config"
CONFIG_SRC_DIR = DOTFILES_DIR / ".config"


def link(source: Path, target: Path):
    if target.exists() or target.is_symlink():
        print(f"Skipping existing '{target}'")
        return

    target.symlink_to(source)
    print(f"Linked '{source}' ~> '{target}'")


def should_skip(item_name: str):
    skip_dict = {
        "Linux": {"aerospace"},
        "Darwin": {"i3"}
    }

    return item_name in skip_dict.get(platform.system(), set())


def main():
    # ensure '$HOME/.config' exists
    CONFIG_DIR.mkdir(parents=True, exist_ok=True)

    # links for '$HOME/.config/...'
    for item in CONFIG_SRC_DIR.iterdir():
        print(f"Linking '{item.name}'...")

        if should_skip(item.name):
            print(f"Skipping '{item.name}' on {platform.system()}...")
            continue

        link(source=item, target=(CONFIG_DIR / item.name))

    # link '$HOME/.zshrc'
    zshrc_source = DOTFILES_DIR / ".zshrc"
    zshrc_target = Path.home() / ".zshrc"

    print("Linking '.zshrc'...")
    link(zshrc_source, zshrc_target)


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
