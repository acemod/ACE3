---
layout: wiki
title: Spectator
description: A flexible spectator system
group: feature
parent: wiki
---

## 1. Overview

## 2. Usage

### 2.1 Spectator Shortcuts

#### 2.1.1 Interface Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>H</kbd></td>
            <td>Toggle help</td>
        </tr>
        <tr>
            <td><kbd>M</kbd></td>
            <td>Toggle map</td>
        </tr>
        <tr>
            <td><kbd>1</kbd></td>
            <td>Toggle unit list</td>
        </tr>
        <tr>
            <td><kbd>2</kbd></td>
            <td>Toggle toolbar</td>
        </tr>
        <tr>
            <td><kbd>3</kbd></td>
            <td>Toggle compass</td>
        </tr>
        <tr>
            <td><kbd>4</kbd></td>
            <td>Toggle unit icons</td>
        </tr>
        <tr>
            <td><kbd>Backspace</kbd></td>
            <td>Toggle interface</td>
        </tr>
    </tbody>
</table>

#### 2.1.2 Free Camera Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>W</kbd></td>
            <td>Camera forward</td>
        </tr>
        <tr>
            <td><kbd>S</kbd></td>
            <td>Camera backward</td>
        </tr>
        <tr>
            <td><kbd>A</kbd></td>
            <td>Camera left</td>
        </tr>
        <tr>
            <td><kbd>D</kbd></td>
            <td>Camera right</td>
        </tr>
        <tr>
            <td><kbd>Q</kbd></td>
            <td>Camera up</td>
        </tr>
        <tr>
            <td><kbd>Z</kbd></td>
            <td>Camera down</td>
        </tr>
        <tr>
            <td><kbd>LMB</kbd></td>
            <td>Camera dolly</td>
        </tr>
        <tr>
            <td><kbd>RMB</kbd></td>
            <td>Camera pan and tilt</td>
        </tr>
        <tr>
            <td><kbd>Scrollwheel</kbd></td>
            <td>Zoom in/out</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>Scrollwheel</kbd></td>
            <td>Speed up/down</td>
        </tr>
        <tr>
            <td><kbd>N</kbd></td>
            <td>Next vision mode</td>
        </tr>
        <tr>
            <td><kbd>Ctrl</kbd>+<kbd>N</kbd></td>
            <td>Previous vision mode</td>
        </tr>
    </tbody>
</table>

#### 2.1.3 Unit Camera Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>Right arrow</kbd></td>
            <td>Next unit</td>
        </tr>
        <tr>
            <td><kbd>Left arrow</kbd></td>
            <td>Previous unit</td>
        </tr>
        <tr>
            <td><kbd>RMB</kbd></td>
            <td>Toggle gun camera</td>
        </tr>
    </tbody>
</table>

#### 2.1.4 General shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><kbd>Up arrow</kbd></td>
            <td>Next camera</td>
        </tr>
        <tr>
            <td><kbd>Down arrow</kbd></td>
            <td>Previous camera</td>
        </tr>
    </tbody>
</table>

### 2.2 The Interface

#### 2.2.1 Unit list

The unit list on the left lists all of the units currently available to spectate.
Double click on any unit name in the list to switch to the unit.
Double click on the current unit to switch between internal and external view.

#### 2.2.2 Toolbar

The toolbar along the bottom of the screen displays various useful values. From left to right these are:

* Unit name
* Camera mode
* Camera zoom/Unit side
* 24-hour Clock
* Vision mode/Unit depth
* Camera/Unit speed

#### 2.2.3 Map

The map overlay will show the current position of the free camera and all spectatable units. The unit icons are tied into the unit icon toggle shortcut. When spectating a unit the map will also show the icons of units it knows about. In free camera you can double click on the map to teleport the camera to the position of the mouse.

## 3. Dependencies

`ace_common`
