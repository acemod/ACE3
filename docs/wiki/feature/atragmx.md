---
layout: wiki
title: ATragMX
description: Handheld ballistics calculator.
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

The ATragMX features the following:

- Ballistics Calculation
- Gun List
- Digital Range Card

## 2. Use
### 2.1 Opening the ATragMX

1. Self interact <kbd>Ctrl</kbd>+<kbd>⊞&nbsp;Win</kbd>.
2. Select `Equipment`.
3. Select `Open ATragMX`.

### 2.2 ATragMX Interface Overview

The ATragMX is a powerful yet complex tool. This brief overview of the ATragMX home screen will give you an idea of what is to come.

<img src="https://i.imgur.com/y4KzvAh.jpg" alt="home screen" />

Number |                                              Function |
------ | ----------------------------------------------------- |
`1`      | Displays selected Gun/Ammunition List
`2`      | Displays selected Units of Measurement
`3`      | Open - Digital Range Card
`4`      | Gun and Ammo Data Screen
`5`      | Atmospheric and Environmental Data Screen 
`6`      | Target Data Screen
`7`      | Aiming Solution Data Screen
`8`      | Open - Gun List
`9`      | Toggle - MILs, TMOA, SMOA, Clicks
`10`     | Open - Options
`11`     | Quick select next Gun/Ammunition - Up
`12`     | Quick select next Gun/Ammunition - Down
`13`     | Quick select next Target Calculation - Left (A B C D)
`14`     | Quick select next Target Calculation - Right (A B C D)
`15`     | Reset Data

#### 2.2.1 Units of Measurement

Please refer to the image displayed in the Overview, `Number 2`.

ATrag will handle both English (Imperial) and Metric units of measure. The push button controls for
toggling between these two systems are located at the top right of the working screen. You will
see an ‘E’ for English, and ‘M’ for Metric. You can toggle between the two systems at any time,
your selection effects all sub-screens throughout the system.

You may also notice a ‘D’ push button, this is a special mode where
the unit system is split into a dual state such that all distances are
presented on screen as ‘meters’ while everything else remains in the
English (Imperial) system of units. This is most useful when working
with English instruments but looking through mil dot scopes. When in
the dual mode, a small asterisk appears alongside distance
parameters to remind you that those quantities are in meters. 

#### 2.2.2 Digital Range Card

Please refer to the image displayed in the Overview, `Number 3`.

ATragMX can present ‘come-up’ (hold over) results in the form of a
Range Card (RC) display. RC values are displayed in a uniform table
of range increments – meters or yards as set on the main screen and
shown on the column heading along with each respective
elevation, windage, and other associated values. Units (USMC Mils,
TMOA, SMOA, Clicks) are the same as the setting on the main
screen and shown on the top left corner of the display. Where
applicable, a star will appear next to all ranges where the bullet is
subsonic. The range increments of the RC may be
customized by clicking on the Setup button located on the top right of
the display.

Element |                                              Description |
------ | ----------------------------------------------------- |
`Meters/Yards`      | Meters/Yards to Target
`Elev`              | Scope Adjustment Up (Positive) / Down (Negative)
`Wind`              | Scope Adjustment Left (Negative) / Right (Positive)
`TmFlt`             | Time of Flight (In seconds)

The scope adjustment values are displayed in positive or negatives.

<b>Example:</b> The target is 700 meters away. This means the scope will be adjusted 6.1 UP using `Page Up` and 0.2 RIGHT using `Ctrl` + `Page Up`. The time of flight for the bullet will be 1.08 seconds.


<div class="row">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/qFuDQnN.jpg" width="402" height="696" alt="Range Card" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/snq0L2P.jpg" width="402" height="696" alt="Range Card Settings" />
            </div>
        </div>
</div>


(Image 1 is the Range Card, Image 2 is the Setup Menu for the Range Card)

The starting range, ending range and step values can be set for the
RC by clicking the Setup button to bring up the RC setup screen. Only
200 lines of data are allowed at one time so choose your range card
setup values accordingly.

#### 2.2.3 Gun and Ammo Data Screen
#### 2.2.4 Atmospheric and Environmental Data Screen 
#### 2.2.5 Target Data Screen
#### 2.2.6 Aiming Solution Data Screen
#### 2.2.7 Gun/Ammunition List
#### 2.2.8 Options
#### 2.2.9 Physical Buttons


## Dependencies

{% include dependencies_list.md component="atragmx" %}
