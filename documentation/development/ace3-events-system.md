---
layout: wiki
title: ACE3 Events System
group: dev
parent: wiki
order: 3
---

## Event Handlers

Event handlers in ACE3 are implemented through our event system. They should be used to trigger or allow triggering of specific functionality.

The commands are listed below.

* `[eventName, eventCodeBlock] call ace_common_fnc_addEventHandler` <br/> adds an event handler with the event name and returns the event handler id.
* `[eventName, args] call ace_common_fnc_globalEvent` <br/> calls an event with the listed args on all machines, the local machine, and the server.
* `[eventName, args] call ace_common_fnc_serverEvent` <br/> calls an event just on the server computer (dedicated or self-hosted).
* `[eventName, targetObject(s), args] call ace_common_fnc_targetEvent` <br/> calls an event just on the targeted object or list of objects.
* `[eventName, args] call ace_common_fnc_localEvent` <br/> calls an event just on the local machine, useful for inter-module events.

Events can be removed or cleared with the following commands.

* `[eventName, eventHandlerId] call ace_common_fnc_removeEventHandler` <br/> will remove a specific event handler of the event name, using the ID returned from `ace_common_fnc_addEventHandler`.
* `[eventName] call ace_common_fnc_removeAllEventHandlers` <br/> will remove all event handlers for that type of event.

### Pattern:
```c++
// tapper machine
["tapShoulder", [_target], [otherArguments]] call EFUNC(common,targetEvent);

// target machine XEH_preInit.sqf
PREP(onTapShoulder);
["tapShoulder", FUNC(onTapShoulder) ] call EFUNC(common,addEventHandler);
```

### Listenable Event List:
<table>
    <thead>
        <tr>
            <th>Event Key</th>
            <th>Description</th>
            <th>Source(s)</th>
            <th>Locality</th>
        </tr>
    </thead>
    <tbody>
         <tr>
            <td>"playerChanged"</td>
            <td>`player` changed (zeus/respawn)</td>
            <td>common</td>
            <td>local</td>
        </tr>
        </tr>    
         <tr>
            <td>"playerInventoryChanged"</td>
            <td>Inventory changed</td>
            <td>common</td>
            <td>local</td>
        </tr>  
        </tr>    
         <tr>
            <td>"playerVisionModeChanged"</td>
            <td>Vision mode changed (e.g. NVG on)</td>
            <td>common</td>
            <td>local</td>
        </tr>  
        </tr>    
         <tr>
            <td>"zeusDisplayChanged"</td>
            <td>Zeus display opened/closed</td>
            <td>common</td>
            <td>local</td>
        </tr>
        </tr>    
        <tr>
            <td>"cameraViewChanged"</td>
            <td>Camera view changed</td>
            <td>common</td>
            <td>local</td>
        </tr>    
        <tr>
            <td>"playerVehicleChanged"</td>
            <td>Player vehicle changed</td>
            <td>common</td>
            <td>local</td>
        </tr>    
        <tr>
            <td>"playerTurretChanged"</td>
            <td>Player turret changed</td>
            <td>common</td>
            <td>local</td>
        </tr>  
        <tr>
            <td>"infoDisplayChanged"</td>
            <td>On info box change (e.g. entering and leaving a vehicle)</td>
            <td>common</td>
            <td>local</td>
        </tr>  
         <tr>
            <td>"inventoryDisplayLoaded"</td>
            <td>On opening the inventory display</td>
            <td>common</td>
            <td>local</td>
        </tr>  
        <tr>
            <td>"interactionMenuOpened"</td>
            <td>Interaction Menu Opened</td>
            <td>interaction</td>
            <td>local</td>
        </tr>    
         <tr>
            <td>"killedByFriendly"</td>
            <td>On TK/Civilian Killed</td>
            <td>respawn</td>
            <td>local</td>
        </tr>
         <tr>
            <td>"drawing_requestMarkers"</td>
            <td>Request Drawing Markers</td>
            <td>map</td>
            <td>target</td>
        </tr>  
         <tr>
            <td>"drawing_sendbackMarkers"</td>
            <td>Send Drawing Markers</td>
            <td>map</td>
            <td>target</td>
        </tr>
         <tr>
            <td>"drawing_addLineMarker"</td>
            <td>Line Drawn</td>
            <td>map</td>
            <td>global</td>
        </tr>  
         <tr>
            <td>"drawing_removeLineMarker"</td>
            <td>Line Deleted</td>
            <td>map</td>
            <td>global</td>
        </tr>     
        <tr>
            <td>"flashbangExplosion"</td>
            <td>Flashbang Goes Bang</td>
            <td>grenades</td>
            <td>target</td>
        </tr> 
    </tbody>
</table>

### Callable Event List:
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
         <tr>
            <td>"ace_fcs_forceChange"</td>
            <td>force FCS updates</td>
            <td>fcs</td>
            <td>fcs</td>
            <td>local</td>
        </tr>
        </tr>   
    </tbody>
</table>
