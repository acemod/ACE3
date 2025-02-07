---
layout: wiki
title: ACE Arsenal
component: arsenal
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

### 1.1 Features

ACE Arsenal has a pretty large number of improvements over BI Virtual Arsenal, here is a non exhaustive list:
- The ability to select the magazine loaded into your primary / secondary / handgun without leaving ACE Arsenal.
- Search bars for both the left and right panels.
- New tabs to add weapon accessories to a container.
- A "Clear container" button to remove all items from a container.
- Unique items support.<sup>*</sup>
- Loadouts can be shared with other players.
- Mission makers can save "Default loadouts" that will be available in their own tab independently from player saved loadouts.
- A setting to disable mod icons to increase performance even further.
- An other setting to invert horizontal camera controls.
- Settings to disable the "Default loadouts" and "Public loadouts" tabs.
- Custom sub item categories for misc items
- Items can be saved as favorites to filter for your preferences.

<sup>*</sup> Items not currently available in ACE Arsenal but in the unit's inventory, unique items will be omitted when loading loadouts and they can only be removed from containers.

### 1.2 Loadouts

<div class="panel callout">
    <p>Loadouts from BI Virtual Arsenal will not show up in ACE Arsenal and vice versa.
    Insignias, faces, and voices are NOT saved</p>
</div>

The loadouts screen is separated into 3 tabs:
- "My loadouts" for loadouts saved into your profile.
- "Default loadouts" for loadouts saved in the mission.
- "Public loadouts" for loadouts made public by other players (does not persist after the owner disconnects).

"Default loadouts" and "Public loadouts" tabs can be disabled by the mission maker.

Loadout names are unique, you cannot have two loadouts with the same name, however you are able to rename loadouts.

Saving loadouts from the default and public tabs will save them in your profile, they will show up in the "My loadouts" tab if you switch back to it.

All loadouts can be loaded, however items not available or missing, will NOT be added. This limitation applies to all tabs as well as imported loadouts.

In the case of a stored loadout's uniform, vest or backpack not being available or missing, loading it will retain the currently equipped uniform/vest/backpack and attempt to fill it with the stored one's content that is available in the arsenal.

The color coding for loadouts is as follows:
- White: All items are available and will be loaded.
- Grey: Some items in that loadout are not available in that box.
- Red: Missing mods / class not defined, this takes precedence over grey if there is also unavailable items.

#### 1.2.1 Importing loadouts from Virtual Arsenal

You can import loadouts from Virtual Arsenal into ACE Arsenal, face, voice, insignias, and items from mods that aren't loaded won't be ported.

- Go in 3DEN
- Place down a player unit
- In the 3DEN top toolbar, click on the `TOOLS` tab
- Click on `Import BI VA Loadouts to Ace Arsenal`

## 2. Favorites

To switch between displaying all items or just favorites, press the `Items:` button on the bottom of the interface.

Items can be saved to favorites by pressing <kbd>Shift</kbd> + <kbd>2x LMB</kbd>. Favorites are saved to your profile, along with loadouts, and persist between missions and mod changes.

Favorited items will be shown in a light gold color by default, but this can be changed under `ACE Arsenal -> Favorites Color` in CBA Settings.

It is also possible to toggle between showing all items or favorites by default upon opening the arsenal via `ACE Arsenal -> Default to Favorites` in CBA Settings.

Those settings cannot be overwritten by mission makers and are exclusively player preference.

## 3. Shortcuts

### 3.1 Outside of search bars

- <kbd>Ctrl</kbd> + <kbd>C</kbd>: Export current loadout to clipboard.
- <kbd>Ctrl</kbd> + <kbd>V</kbd>: Import loadout from clipboard.
- <kbd>Backspace</kbd>: Hide / show the UI (does not work on loadouts screen).
- Arrow keys can be used to naviguate the left and right panels.
- <kbd>Shift</kbd> + <kbd>LMB</kbd> on the `+` or `-` buttons on the right panel to add or remove 5 of the selected item.
- <kbd>Ctrl</kbd> + <kbd>F</kbd> Selects the left search bar.
- <kbd>Shift</kbd> + <kbd>2x LMB</kbd> on an item will add or remove it from favorites.

<div class="panel callout">
    <h5>Note:</h5>
    <p><kbd>Shift</kbd> + arrow keys can be used to add or remove a large amount of items in a short amount of time from the right panel.</p>
</div>

### 3.2 Inside of search bars

- Search bars support copy / cut and paste (same limitations as importing apply in multiplayer).
- <kbd>Ctrl</kbd> + <kbd>A</kbd> is supported.
- <kbd>Enter</kbd> validates the search.
- <kbd>RMB</kbd> clears the text field.
- Arrow keys can be used to move the caret.
- <kbd>Ctrl</kbd> + <kbd>F</kbd> switches which search bar is selected.
