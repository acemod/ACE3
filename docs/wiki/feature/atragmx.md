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
- Receive Data from `Vector 21`

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

<b>Example:</b> The target is 700 meters away. This means the scope will be adjusted 6.1 UP using <kbd>Page Up</kbd> and 0.2 RIGHT using <kbd>Ctrl</kbd> + <kbd>Page Up</kbd>. The time of flight for the bullet will be 1.08 seconds.


<div class="row">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/qFuDQnN.jpg" alt="Range Card" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/snq0L2P.jpg" alt="Range Card Settings" />
            </div>
        </div>
</div>


(Image 1 is the Range Card, Image 2 is the Setup Menu for the Range Card)

The starting range, ending range and step values can be set for the
RC by clicking the Setup button to bring up the RC setup screen. Only
200 lines of data are allowed at one time so choose your range card
setup values accordingly.

#### 2.2.3 Gun and Ammo Data Screen

The data displayed in the `Gun and Ammo Data Screen` is automatically filled in by the ATragMX depending on the Weapon/Ammo selected in the `GunList`. The data displayed/calculated is also affected by other parameters set in the ATragMX.

<b>Example:</b> The Muzzle Velocity is dependent on the Temperature. The data provided in the `Atmospheric and Environmental Data Screen` is therefore used in calculating the correct Muzzle Velocity.

<img src="https://i.imgur.com/M1jVJXh.jpg" alt="Gun and Ammo Data Screen" />


#### 2.2.4 Atmospheric and Environmental Data Screen

You have two options for entering Atmospheric data. The first is AT, which allows you to enter
Altitude and Temperature, whilst the second is TBH which allows you to enter Temperature,
Barometric Pressure (BP) and Relative Humidity (RH). Correct air density values are essential for 
accurate ballistic calculations. When available, TBH is the more precise option, however, when
there is no way of obtaining BP and RH, ATragMX can approximate air density from altitude and
temperature.

<b>Tip:</b> All the information needed to fill out the TBH is located on `User Screen 2` of the `Kestrel 4500`.

<div class="row">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/qu6OBZ6.jpg" alt="Atmsphr TBH" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/Aoo5YEJ.jpg" alt="Atmsphr AT" />
            </div>
        </div>
</div>



#### 2.2.5 Target Data Screen

While data for the Gun and Atmosphere groups can be set into the PDA prior to engaging the
target, it is only when you have your target in sight that you will be able to enter ‘moment of truth’
data such as wind speed, wind direction, uphill/downhill angle, distance to target as well as target
speed and direction.

##### <b>Latitude</b>

In the ATragMX, parameters are provided for Magnus and coriolis corrections. Target
Location is expressed as Hemisphere (North or South) and Latitude (0º at the equator to 90º at
the poles).

Latitude is entered from -90º to 90º. Negative is South and positive is North.

##### <b>Direction of Fire</b>

Direction of Fire is expressed as degrees. Unlike
wind direction, however, direction of fire is an absolute frame of reference to true north (0º). The value is therefore given as the direction of the barrel axis from true north. In the example on the right, the direction of fire would be 120º (120 degrees).

##### <b>Wind Speed</b>

In the field, rarely does the wind blow at a constant speed. Generally, it will tend to have a base
speed with occasional gusts to a higher speed. To compensate, the shooter often will “bracket” the
wind – that is, to put the target between the low wind value and high wind value – thereby
minimizing the overall horizontal drift should the wind suddenly gust just as the trigger is pulled.

To assist the shooter, MX has a dual wind feature. Two wind speed
values (low and high) may be entered on the target screen. These
values are reflected on the main screen in the WS display in a
“low/high” format.

<b>IMPORTANT:</b> Please note that the `Wind` data displayed on the `Aiming Solution Data Screen` is based on the value entered in the `Wind Speed (m/s)`, `1` field. The `Wind Speed (m/s)`, `2` data field is for a seperate calculation. This means that the ATragMX will <b>NOT</b> calculate an avarage Wind Speed using those two values. It is up to the shooter to decide if the Low or High value is closest to the current Wind Speed or if the shooter should re-enter the value/s.

##### <b>Wind Direction (clock)</b>

Wind Direction is expressed in clock points. This illustration shows how to determine the direction. Wind direction always uses the ‘axis of the barrel bore’ as its frame of reference, hence the wind direction is a ‘relative’ direction rather than an absolute direction. Within this ‘axis of the bore’ reference system, wind is always described in terms of where it is coming from. So the direction of a right-to-left wind is therefore deemed to be coming from 3 o’clock and a wind blowing directly into your face would be coming from 12 o’clock.

<img src="https://i.imgur.com/ye4wW0L.jpg" alt="Wind Direction Clock" />

##### <b>Inclination Angle</b>

The Inclination Angle field on the Target Screen displays data in both degees and cosine values. The degrees field is marked with a “d” and the cosine field with a “c”. These two fields are tied together and their values compliment each other – that is, the value in one field reflects the equivalent value of the other field. Changing the value in one field will automatically cause a change
in value of the other field to match. 

<b>Example:</b> A cosine value of 0.91 is equivalent to 25 degrees. If you were to change the degrees field to 40 degrees, then upon exiting the degrees field, the cosine field will automatically change to 0.77 which is the cosine approximation to 40 degrees.

<b>Tip:</b> These values can be directly transfered by using the `Vector`. Please refer to the manual of the `Vector` for more information on how to transfer data.

##### <b>Target Speed (m/s)</b>

The Target Speed’s right chevron ‘>’ indicates the direction the target is
moving when seen through the scope (in this case, left to right). Tapping this chevron will toggle
the direction.

##### <b>Target Range (meters)</b>

The Targets Range can be aquired through many different ways, such as using a `Vector`, `Range Finder` or even a `Laser Designator`.

<b>Tip:</b> This value can be directly transfered by using the `Vector`. Please refer to the manual of the `Vector` for more information on how to transfer data.

<img src="https://i.imgur.com/nx9H6RS.jpg" alt="Target" />

#### 2.2.6 Aiming Solution Data Screen

The `Aiming Solution Data Screen` displays the result of all the data entered into the ATragMX. Here you will find the information needed to setup your scope.

##### <b>Elev</b>

The field `Elev` (Elevation) is displaying how much the scope needs to be adjusted UP or DOWN. A positive value means that the scope needs to be adjusted UP using <kbd>Page Up</kbd>. A negative value means that the scope needs to be adjusted DOWN using <kbd>Page Down</kbd>.



##### <b>Wind</b>

The result of the low and high holdovers are displayed in the usual
result area. Wind (just below elevation) will show the wind holdover
solution to the low wind (Wind1) value, and by toggling the Lead/Wind2
button on the screen, the high wind (Wind2) holdover solution will be
shown where the Lead solution is usually displayed. The solution for
Lead and Wind2 is toggled to display either one solution or the other.

Depending on how fast you think the wind is currently gusting, weight
your holdover toward that wind holdover value and pull the trigger. (i.e.
if shooting at 730 meters and I think the wind is gusting more toward the
higher end, I may hold off closer to 0.53 rather than 0.29).

The `Wind`/`Wind2` field(s) display(s) how much the scope needs to be adjusted Left or Right depinding on Wind Speed and Direction. The adjustment value will be displayed with a number followed by either `L` (Left) or `R` (Right). Use <kbd>Ctrl</kbd> + <kbd>Page Down</kbd> to adjust the scope Left, use <kbd>Ctrl</kbd> + <kbd>Page Up</kbd> to adjust the scope Right.

##### <b>Lead</b>


<img src="https://i.imgur.com/dLgVqFX.jpg" alt="Aiming Solution" />

#### 2.2.7 Gun/Ammunition List

The data displayed on the main screen reflects the current conditions under which a particular shot is being made. The top left corner of the main screen displays the name of the current Gun you have selected.

You may quickly cycle through your list of stored guns by pushing the hard up or down buttons on the ATragMX. As you cycle through the gun list, you will see the gun’s name change at the top-left of the screen.

You will also see the gun’s parameters change in the Gun display box just below the gun name. You can also switch Guns by tapping the GunList button at the bottom left part of the main screen. This will display the list of Guns you have saved in your GunList.

<div class="row">
        <div class="row">
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/yUJUnxh.jpg" alt="Home GunList" />
            </div>
            <div class="small-12 medium-6 columns">
                <img src="https://i.imgur.com/I8lSAeT.jpg" alt="GunList" />
            </div>
        </div>
</div>

Opening a Gun (or dubble clicking on the name) will immediately bring that Gun’s parameters into the main screen and a new shooting solution will be calculated using the new Gun’s parameters. 
Keep in mind that cycling through (opening) a Gun in your GunList only loads that Gun’s parameters into the main screen. Changing parameters on the main screen DOES NOT change the parameters of the Gun in the GunList. The main screen and the GunList are separate. In order to store changes from the main screen into the GunList, you must go back to the GunList screen and use the Save or SaveAs buttons on the right hand side.


#### 2.2.8 Options
#### 2.2.9 Physical Buttons

## 3. Daily use and Setup

This section is dedicated to configuring the ATragMX on a daily basis in relation to Arma 3. The documentation for the ATragMX may seem overwhelming and to complicated, that is however not the case which this quick portion will cover. Knowing your equipment is important, it is however not nessesary for you to know every single setting. The following is a quick checklist of things that need to be configured to use the ATragMX. Following these steps will have any shooter ready in under 60 seconds.



## Dependencies

{% include dependencies_list.md component="atragmx" %}
