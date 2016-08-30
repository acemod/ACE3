---
layout: wiki
title: MicroDAGR
description: A GPS device and much more.
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

For an easier time reading don't forget that you can view all chapters on the right side of the page by clicking on Show/hide under table of content.

## 1. Overview

>Military operations rely on the position,
>navigation and timing (PNT) data that GPS
>can provide. In combat, the accuracy of
>PNT data can mean the difference between
>life and death. Non-military GPS receivers
>simply aren’t good enough when lives are
>on the line

(Extracted from the real life manual)

Here's a list of the MicroDAGR's features (in Arma 3):

- Compass and headings
- Date and hour synced to the mission
- Elevation (above or below sea level)
- Current speed
- GPS with topographic and satellite view
- Creating, naming, deleting waypoints
- Friendly identification (BLUFOR tracker need to be on)
- The MicroDAGR is also able to connect to your vector to retrieve data from it

## 2. Usage

Please note that the numbers in 2.1 are going to be referred to as `1`, `2`, etc. &hellip; when explaining how to use the MicroDAGR.

The MicroDAGR position on the UI is where your GPS is, you can modify it in Options &rarr; Game &rarr; Layout.

### 2.1 Bringing the MicroDAGR

1. Self interact <kbd>Ctrl</kbd>+<kbd>⊞&nbsp;Win</kbd>.
1. Select `Equipment`.
1. Select `configure MicroDAGR`.

### 2.2 The MicroDAGR interface

<div class="row">
    <div class="small-12 columns">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="{{ site.baseurl }}/img/wiki/feature/microdagr1.jpg" width="300" height="394" alt="main menu" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="{{ site.baseurl }}/img/wiki/feature/microdagr2.jpg" width="300" height="394" alt="compass view" />
            </div>
        </div>
    </div>
    <div class="small-12 columns">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="{{ site.baseurl }}/img/wiki/feature/microdagr3.jpg" width="300" height="394" alt="map view" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="{{ site.baseurl }}/img/wiki/feature/microdagr4.jpg" width="300" height="394" alt="options menu" />
            </div>
        </div>
    </div>
</div>

Number |                                              Function |
------ | ----------------------------------------------------- |
`1`      | Options menu and hour display
`2`      | Grid position `e` is west to east `n` is south to north
`3`     | Elevation above sea level in meters
`4` & `11` | Compass heading
`5` & `10` | Current speed
`6`      | Date (mission)
`7`      | Main menu button
`8`      | Compass menu button
`9`      | Map menu button
`12`     | Compass
`13`     | Player heading (your eyes)
`14`     | Center the map on your position
`15`     | Map zoom
`16`     | Map dezoom
`17`     | Your position
`18`     | Waypoint creation menu
`19`     | Waypoint editing menu
`20`     | Connection menu
`21`     | Settings menu

### 2.3 Waypoints

#### 2.3.1 Adding waypoints

There are three ways of adding a waypoint.

**First way: Using the waypoint creation menu.**

1. Find the position you want to mark on the map.
1. Get it's map grid.
1. The grid is composed of 6 digits.
  1. The first three digits are read west to east. (Top of the map screen).
  1. The last three are read south to north. (Left side of the map screen).
1. Go to the options menu (Click in `1` area, above the bar).
1. Click on `Mark`(`18`).
1. Enter the grid number.
1. Press OK.
1. Enter the desired name of the waypoint.
1. Press OK.


**Second way: Using the waypoint menu**

1. Find the position you want to mark on the map.
1. Get it's map grid.
    1. The grid is composed of 6 digits.
        1. The first three digits are read west to east. (Top of the map screen).
        1. The last three are read south to north. (Left side of the map screen).
1. Go to the options menu (Click in `1` area, above the bar).
1. Click on `Waypoints` (`19`).
1. Click on `Add`.
1. Enter the grid number.
1. Press OK.
1. Enter the name of the waypoint.
1. Press OK.


**Third way: Using the map menu.**

1. Go to the map menu (click on `9`)
1. Double left click on the position where you want your waypoint.
1. Enter the name of the waypoint.
1. Press OK.

#### 2.3.2 Setting a waypoint

1. Go to the options menu (Click in `1` area, above the bar).
1. CLick on `Waypoints` (`19`).
1. Select the waypoint.
1. Click on `SetWp`.


1. Once a waypoint is set:
    1. It's heading, elevation and distance are marked on the main menu. (`7`)
    1. It's heading, direction, grid position and name are marked in the compass menu (`8`)
    1. A marker appear at the waypoint grid location in the map menu (`9`)

#### 2.3.3 Deleting a waypoint

1. Go to the options menu (Click in `1` area, above the bar).
1. Click on `Waypoints` (`19`).
1. Select the waypoint.
1. Click on `Delete`.

### 2.4 Switching between mils and degrees

1. Go to the options menu (Click in `1` area, above the bar).
1. Click on `Settings` (`21`)
1. Double left click on the unit next to `Angular unit:`

### 2.5 Switching between topographical and satellite view

1. Go to the map menu (`9`)
1. Click on the map menu button again (`9`)

### 2.6 Retrieving data from the vector
1. For this you need a `Vector 21`.
1. Go to the options menu (Click in `1` area, above the bar).
1. Click on `Connect to` (`20`).
1. Pull out your `Vector 21`.
    1. Press and hold both <kbd>R</kbd> and <kbd>Tab&nbsp;↹</kbd> until the red pointing circle appears.
    1. Sight the circle on the object and release both keys.
1. The data on the main menu now has changed, you can now see the azimuth the range and the elevation of the point you sighted.
1. Note that the compass menu also changed and now features the azimuth, compass bearing, distance and grid position of the point you sighted.

Note that the results of the measure you took won't change until you do an other measure.


## 3. Dependencies

{% include dependencies_list.md component="microdagr" %}
