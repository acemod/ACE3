---
layout: wiki
title: Installation Guide
description: Step-by-step guide for installing ACE3
group: user
order: 0
parent: wiki
---

## 1. Overview
This guide will explain how to get ACE3 up and running faster than you can say banana.

## 2. Prerequisites
- Download [CBA](http://www.armaholic.com/page.php?id=18767).
- Download [ACE3](https://github.com/acemod/ACE3/releases/latest).
- Know how to extract .zip files. Use [Google](https://www.google.com) if not sure.

## 3. Install ACE3
- Extract both CBA and ACE3 .zip files into your Arma 3 folder. By default this is located in:<br>
32-Bit - `C:/Program Files/Steam/Steamapps/Common/Arma 3/`<br>
64-Bit - `C:/Program Files (x86)/Steam/Steamapps/Common/Arma 3/`
- After extraction you should have the `@ace` and `@CBA_A3` folders inside your Arma 3 folder.

## 4. Install ACE3 Optional components
<div class="panel callout">
    <h5>Note:</h5>
    <p>Skip this step if you're not using additional mods. If you are, consult with your mission maker before installing any of these components. If you are a Mod creator, please visit the [Modularity and PBO Structure](http://ace3mod.com/wiki/development/modularity-and-pbo-structure.html) page for more information.</p>
</div>

### 4.1 What do they do?
Optional components supplement 3rd party mods with ACE3 features, for example:
- Optional weapon components make Advanced Ballistics possible, as well as the ability to use ACE3 weapon attachments with 3rd party weapons like RHS, HLC, etc.
- Optional tracers component brings back ACE2 ball tracers.
- Optional server component is used to load the userconfig files.

### 4.2 Which optionals should I use?
Only use the optional components that correspond with your mod-pack.

### 4.3 How to install these components?
- Inside your `Arma 3/@ace/` folder, you'll find the `optionals` and `addons` folders.
- Copy and paste the relevant `.pbo` and `.bisign` files from the `optionals` folder into the `addons` folder.
- Copy and paste the `userconfig` folder from the `optionals` folder into root `Arma 3` folder.

## 5. Launch Arma 3 with ACE3
- Launch Arma 3 to start the official game Launcher.
- Click `Mods` and make sure the checkboxes next to `ace` and `CBA_A3` are ticked.
<img src="{{ site.baseurl }}/img/wiki/user/installation1-launcher.jpg" width="869" height="665" alt="Arma 3 Vanilla Launcher" />
- Click `Play`

## 6. Alternative launch methods

### 6.1 Steam Launch Parameters
- Not supported with the new Arma 3 Launcher

### 6.2 ArmA3Sync
- Inspect `Addon Options` and verify the `Addon Search Directories` are leading to your Arma 3 folder.
- Return to the `Addons` tab and click `Refresh`.
- Right-click inside `Addon Groups`, click `Create Group` and give it a name.
- Drag and drop `@ace` and `@CBA_A3` from `Available Addons` into the new Group you created inside `Addon Groups` and make sure the checkboxes are ticked.
<img src="{{ site.baseurl }}/img/wiki/user/installation2-a3s.jpg" width="529" height="222" alt="Arma3Sync Launcher" />
- Click `Start Game`

### 5.3 Play withSIX
