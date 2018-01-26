---
layout: wiki
title: ACE3 Installation Guide
description: Step-by-step guide for installing ACE3
group: user
order: 1
parent: wiki
---

## 1. Overview

This guide will explain how to get ACE3 up and running.

## 2. Prerequisites

- Download [CBA](https://github.com/CBATeam/CBA_A3/releases/latest).
- Download [ACE3]({{site.ace.githubUrl}}/releases/latest).

## 3. Install ACE3

- Extract both CBA and ACE3 .zip files into your Arma 3 folder. By default it is located in:
    - 32-Bit - `C:/Program Files/Steam/Steamapps/Common/Arma 3/`
    - 64-Bit - `C:/Program Files (x86)/Steam/Steamapps/Common/Arma 3/`
- After extraction you should have the `@ace` and `@CBA_A3` folders inside your Arma 3 folder.

## 4. Install ACE3 Optional components

<div class="panel callout">
    <h5>Note:</h5>
    <p>Skip this step if you're not using additional mods. If you are, consult with your mission maker before installing any of these components. If you are a mod creator, please visit the <a href="{{site.baseurl}}/wiki/development/modularity-and-pbo-structure.html">Modularity and PBO Structure</a> page for more information.</p>
</div>

### 4.1 What do they do?

Optional components supplement 3rd party mods with ACE3 features, for example:

- Optional weapon components make [Advanced Ballistics]({{site.baseurl}}/wiki/feature/advanced-ballistics.html) possible, as well as the ability to use ACE3 weapon attachments with 3rd party weapons like RHS, HLC, etc.
- Optional tracers component brings back ACE2 ball tracers.
- Optional server component is used to load the userconfig files.

### 4.2 Which optionals should I use?

Only use the optional components that correspond with your mod-pack.

### 4.3 How to install these components?

- Inside your `Arma 3\@ace\` folder, you'll find the `optionals` and `addons` folders.
- Inside the `Arma 3` folder create a new folder e.g. `Arma 3\@ace_optionals\` and a subfolder `Arma 3\@ace_optionals\addons`
- Copy and paste the relevant `.pbo` and `.bisign` files from the `Arma 3\@ace\optionals` folder into the `Arma 3\@ace_optionals\addons` folder.

#### 4.3.1 Alternative method to install optionals

- Inside your `Arma 3/@ace/` folder, you'll find the `optionals` and `addons` folders.
- Copy and paste the relevant `.pbo` and `.bisign` files from the `optionals` folder into the `addons` folder.
- Copy and paste the `userconfig` folder from the `optionals` folder into root `Arma 3` folder.

## 5. Launch Arma 3 with ACE3

- Launch Arma 3 to start the official game launcher.
- Click `Mods` and make sure the checkboxes next to `ace` and `CBA_A3` are ticked.
<img src="{{ site.baseurl }}/img/wiki/user/installation1-launcher.jpg" width="869" height="665" alt="Arma 3 Vanilla Launcher" />
- Click `Play`

## 6. Alternative launch methods

### 6.1 Swifty

[Swifty](http://getswifty.net/){:target="_blank"}
- tbd

### 6.2 Arma3Sync

[Arma3Sync](https://forums.bistudio.com/topic/152942-arma3sync-launcher-and-addons-synchronization-software-for-arma-3/){:target="_blank"}

- Inspect `Addon Options` and verify the `Addon Search Directories` are leading to your Arma 3 folder.
- Return to the `Addons` tab and click `Refresh`.
- Right-click inside `Addon Groups`, click `Create Group` and give it a name.
- Drag and drop `@ace` and `@CBA_A3` from `Available Addons` into the new Group you created inside `Addon Groups` and make sure the checkboxes are ticked.
<img src="{{ site.baseurl }}/img/wiki/user/installation2-a3s.jpg" width="529" height="222" alt="Arma3Sync Launcher" />
- Click `Start Game`

### 6.3 Play withSIX

[Play withSIX](http://withsix.com/p){:target="_blank"}

- tbd
