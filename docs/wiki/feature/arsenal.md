---
layout: wiki
title: ACE Arsenal
description: Adds an interface that allow player to edit their loadouts.
group: feature
category: general
parent: wiki
mod: ace
version:
  major: 3
  minor: 12
  patch: 0
---

## 1. Overview

### 1.1 Main screen

### 1.1 Loadouts screen

## 2. Shortcuts

<div class="panel callout">
    <h5>Note:</h5>
    <p><kbd>Ctrl</kbd> + <kbd>V</kbd> does NOT work in multiplayer due to a BI safety, however <kbd>Ctrl</kbd> + <kbd>C</kbd> does since it's using the ACE3 clipboard extension.</p>
</div>

### 2.1 Outside of search boxes

- <kbd>Ctrl</kbd> + <kbd>C</kbd>: Export current loadout to clipboard.
- <kbd>Ctrl</kbd> + <kbd>V</kbd>: Import loadout from clipboard.
- <kbd>Backspace</kbd>: Hide / show the UI (does not work on loadouts screen).
- Arrow keys can be used to naviguate the left and right panels.
- <kbd>Shift</kbd> + <kbd>LMB</kbd> on the `+` or `-` buttons on the right panel to add or remove 5 of the selected item.

<div class="panel callout">
    <h5>Note:</h5>
    <p><kbd>Shift</kbd> + arrow keys can be used to add or remove a large amount of items in a short amount of time from the right panel.</p>
</div>

### 2.2 Inside of search boxes

- Searchboxes support copy and pasting (same limitations as importing apply in multiplayer).
- <kbd>Backspace</kbd> is supported.
- <kbd>Enter</kbd> validates the search.
- <kbd>RMB</kbd> clears the text field.
- Arrow keys can be used to move the caret.


{% include dependencies_list.md component="arsenal" %}