---
layout: wiki
title: Installation Guide
description: Step-by-step guide for installing ACE3
group: user
order: 1
parent: wiki
redirect_from: "/wiki/user/installation-guide-acex.html"
---

## 1. Overview

This guide will explain how to get ACE3 up and running.

## 2. Steam Workshop Installation

- Open Steam and go to the Arma 3 Workshop page
- Search for `ace` or [open the entry in your browser](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057){:target="_blank"}
- Click on the "Subscribe" button

## 3. Manual Installation

### 1. Prerequisites

- Download [CBA](https://github.com/CBATeam/CBA_A3/releases/latest).
- Download [ACE3]({{site.ace.githubUrl}}/releases/latest).

### 2. Install ACE3

- Extract both CBA and ACE3 .zip files into your Arma 3 folder. By default it is located in:
    - 32-Bit - `C:/Program Files/Steam/Steamapps/Common/Arma 3/`
    - 64-Bit - `C:/Program Files (x86)/Steam/Steamapps/Common/Arma 3/`
- After extraction you should have the `@ace` and `@CBA_A3` folders inside your Arma 3 folder.

## 4. Launch Arma 3 with ACE3

- Launch Arma 3 to start the official game launcher.
- Click `Mods` and make sure the checkboxes next to `ace` and `CBA_A3` are ticked.
<img src="{{ site.baseurl }}/img/wiki/user/installation1-launcher.webp" width="869" height="665" alt="Arma 3 Vanilla Launcher" />
- Click `Play`

## 5. Install ACE3 Optional components

<div class="panel callout">
    <h5>Note:</h5>
    <p>Skip this step if you're not using additional mods. If you are, consult with your mission maker before installing any of these components. If you are a mod creator, please visit the <a href="{{site.baseurl}}/wiki/development/modularity-and-pbo-structure.html">Modularity and PBO Structure</a> page for more information.</p>
</div>

### 5.1 What do they do?

Optional components supplement 3rd party mods with ACE3 features, for example:

- Optional weapon components make [Advanced Ballistics]({{site.baseurl}}/wiki/feature/advanced-ballistics.html) possible, as well as the ability to use ACE3 weapon attachments with 3rd party weapons like RHS, HLC, etc.
- Optional tracers component brings back ACE2 ball tracers.
- Optional server component is used to load the userconfig files.

### 5.2 Which optionals should I use?

Only use the optional components that correspond with your mod-pack.

### 5.3 How to install these components?

- In the description on the [ace workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057){:target="_blank"} you will find a list of all optionals that come with ACE3.
- Open the ones you're interested in and click on their respective "Subscribe" buttons

#### 5.3.1 Alternative method to install optionals

- Inside your `Arma 3\@ace\` folder, you'll find the `optionals` and `addons` folders.
- Inside the `Arma 3` folder create a new folder e.g. `Arma 3\@ace_optionals\` and a subfolder `Arma 3\@ace_optionals\addons`
- Copy and paste the relevant `.pbo` and `.bisign` files from the `Arma 3\@ace\optionals` folder into the `Arma 3\@ace_optionals\addons` folder.
