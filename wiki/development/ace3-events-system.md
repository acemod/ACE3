---
layout: wiki
title: ACE3 Events System
description: Event handlers in ACE3 are implemented through our event system. They should be used to trigger or allow triggering of specific functionality.
group: development
parent: wiki
order: 3
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>This page will be removed once all below events are documented. New Event System documentation can be found [here](../framework/events-framework.html)</p>
</div>

### 1 Listenable Event List:

<table>
    <thead>
        <tr>
            <th>Event Key</th>
            <th>Description</th>
            <th>Source(s)</th>
            <th>Passed Parameter(s) (_this)</th>
            <th>Locality</th>
        </tr>
    </thead>
    <tbody>
         <tr>
            <td>"playerChanged"</td>
            <td>`player` changed (zeus/respawn/init)</td>
            <td>common</td>
            <td>[_newPlayer, _oldPlayer]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"PlayerJIP"</td>
            <td>Player was a JIP player, and `player` object is now created.</td>
            <td>common</td>
            <td>[_player]</td>
            <td>local</td>
        </tr>
        </tr>
         <tr>
            <td>"playerInventoryChanged"</td>
            <td>Inventory changed</td>
            <td>common</td>
            <td>[_player, getAllGear-Array]</td>
            <td>local</td>
        </tr>
        </tr>
         <tr>
            <td>"playerVisionModeChanged"</td>
            <td>Vision mode changed (e.g. NVG on)</td>
            <td>common</td>
            <td>[_unit, _newVisionMode]</td>
            <td>local</td>
        </tr>
        </tr>
         <tr>
            <td>"inventoryDisplayChanged"</td>
            <td>Inventory display opened/closed</td>
            <td>common</td>
            <td>[_unit, _isOpen]</td>
            <td>local</td>
        </tr>
        </tr>
         <tr>
            <td>"zeusDisplayChanged"</td>
            <td>Zeus display opened/closed</td>
            <td>common</td>
            <td>[_unit, _isOpen]</td>
            <td>local</td>
        </tr>
        </tr>
        <tr>
            <td>"cameraViewChanged"</td>
            <td>Camera view changed</td>
            <td>common</td>
            <td>[_unit, _newCameraView]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"playerVehicleChanged"</td>
            <td>Player vehicle changed</td>
            <td>common</td>
            <td>[_unit, _newVehicle]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"playerTurretChanged"</td>
            <td>Player turret changed</td>
            <td>common</td>
            <td>[_unit, _newTurretIndexArray]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"infoDisplayChanged"</td>
            <td>On info box change (e.g. entering and leaving a vehicle)</td>
            <td>common</td>
            <td>[_display, _type]</td>
            <td>local</td>
        </tr>
         <tr>
            <td>"inventoryDisplayLoaded"</td>
            <td>On opening the inventory display</td>
            <td>common</td>
            <td>[_display]</td>
            <td>local</td>
        </tr>
         <tr>
            <td>"mapDisplayLoaded"</td>
            <td>On loading the map (briefing and mission start)</td>
            <td>common</td>
            <td>[_display, _mapType]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"SettingsInitialized"</td>
            <td>Settings are now safe to use (at mission start)</td>
            <td>common</td>
            <td></td>
            <td>local</td>
        </tr>
        <tr>
            <td>"SettingChanged"</td>
            <td>A setting was changed</td>
            <td>common</td>
            <td>[_name, _value]</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"interactionMenuOpened"</td>
            <td>Interaction Menu Opened</td>
            <td>interaction</td>
            <td></td>
            <td>local</td>
        </tr>
         <tr>
            <td>"killedByFriendly"</td>
            <td>On TK/Civilian Killed</td>
            <td>respawn</td>
            <td></td>
            <td>local</td>
        </tr>
         <tr>
            <td>"drawing_requestMarkers"</td>
            <td>Request Drawing Markers</td>
            <td>map</td>
            <td></td>
            <td>target</td>
        </tr>
         <tr>
            <td>"drawing_sendbackMarkers"</td>
            <td>Send Drawing Markers</td>
            <td>map</td>
            <td></td>
            <td>target</td>
        </tr>
         <tr>
            <td>"drawing_addLineMarker"</td>
            <td>Line Drawn</td>
            <td>map</td>
            <td></td>
            <td>global</td>
        </tr>
         <tr>
            <td>"drawing_removeLineMarker"</td>
            <td>Line Deleted</td>
            <td>map</td>
            <td></td>
            <td>global</td>
        </tr>
        <tr>
            <td>"flashbangExplosion"</td>
            <td>Flashbang Goes Bang</td>
            <td>grenades</td>
            <td></td>
            <td>target</td>
        </tr>
        <tr>
            <td>"zeusUnitAssigned"</td>
            <td>A player was assigned as zeus</td>
            <td>zeus</td>
            <td>[_logic,_player]</td>
            <td>global</td>
        </tr>
    </tbody>
</table>

### 2 Callable Event List:

<table>
    <thead>
        <tr>
            <th>Event Key</th>
            <th>Description</th>
            <th>Parameters</th>
            <th>Owner</th>
            <th>Locality</th>
        </tr>
    </thead>
    <tbody>
        </tr>
            <td>"SetHandcuffed"</td>
            <td>Set the captive (handcuffed) state of a unit</td>
            <td>[_unit, _state]</td>
            <td>captives</td>
            <td>local</td>
        </tr>
        </tr>
            <td>"SetSurrendered"</td>
            <td>Set the surrender state of a unit</td>
            <td>[_unit, _state]</td>
            <td>captives</td>
            <td>local</td>
        </tr>
        <tr>
            <td>"ace_fcs_forceChange"</td>
            <td>force FCS updates</td>
            <td>fcs</td>
            <td>fcs</td>
            <td>local</td>
        </tr>
    </tbody>
</table>
