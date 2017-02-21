/*
    Header: script_xeh.hpp

    Description:
        Used internally.
*/
/////////////////////////////////////////////////////////////////////////////////
// MACRO: EXTENDED_EVENTHANDLERS
// Add all XEH event handlers
/////////////////////////////////////////////////////////////////////////////////

#define EXTENDED_EVENTHANDLERS init = "(_this select 0) call CBA_fnc_initEvents; (_this select 0) call CBA_fnc_init"; \
fired = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_fired"")"; \
animChanged = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_animChanged"")"; \
animDone = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_animDone"")"; \
animStateChanged = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_animStateChanged"")"; \
containerClosed = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_containerClosed"")"; \
containerOpened = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_containerOpened"")"; \
controlsShifted = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_controlsShifted"")"; \
dammaged = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_dammaged"")"; \
engine = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_engine"")"; \
epeContact = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_epeContact"")"; \
epeContactEnd = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_epeContactEnd"")"; \
epeContactStart = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_epeContactStart"")"; \
explosion = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_explosion"")"; \
firedNear = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_firedNear"")"; \
fuel = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_cba_xeh_fuel"")"; \
gear = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_gear"")"; \
getIn = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_getIn"")"; \
getInMan = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_getInMan"")"; \
getOut = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_getOut"")"; \
getOutMan = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_getOutMan"")"; \
handleHeal = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_handleHeal"")"; \
hit = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_hit"")"; \
hitPart = "{_this call _x} forEach ((_this select 0 select 0) getVariable ""cba_xeh_hitPart"")"; \
incomingMissile = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_incomingMissile"")"; \
inventoryClosed = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_inventoryClosed"")"; \
inventoryOpened = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_inventoryOpened"")"; \
killed = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_killed"")"; \
landedTouchDown = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_landedTouchDown"")"; \
landedStopped = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_landedStopped"")"; \
local = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_local"")"; \
respawn = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_respawn"")"; \
put = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_put"")"; \
take = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_take"")"; \
seatSwitched = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_seatSwitched"")"; \
seatSwitchedMan = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_seatSwitchedMan"")"; \
soundPlayed = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_soundPlayed"")"; \
weaponAssembled = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_weaponAssembled"")"; \
weaponDisassembled = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_weaponDisassembled"")"; \
weaponDeployed = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_weaponDeployed"")"; \
weaponRested = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_weaponRested"")"; \
reloaded = "{_this call _x} forEach ((_this select 0) getVariable ""cba_xeh_reloaded"")";


/* 
   MACRO: DELETE_EVENTHANDLERS

    Removes all event handlers.
*/

#define DELETE_EVENTHANDLERS init = ""; \
fired = ""; \
animChanged = ""; \
animDone = ""; \
animStateChanged = ""; \
containerClosed = ""; \
containerOpened = ""; \
controlsShifted = ""; \
dammaged = ""; \
engine = ""; \
epeContact = ""; \
epeContactEnd = ""; \
epeContactStart = ""; \
explosion = ""; \
firedNear = ""; \
fuel = ""; \
gear = ""; \
getIn = ""; \
getInMan = ""; \
getOut = ""; \
getOutMan = ""; \
handleHeal = ""; \
hit = ""; \
hitPart = ""; \
incomingMissile = ""; \
inventoryClosed = ""; \
inventoryOpened = ""; \
killed = ""; \
landedTouchDown = ""; \
landedStopped = ""; \
local = ""; \
respawn = ""; \
put = ""; \
take = ""; \
seatSwitched = ""; \
soundPlayed = ""; \
weaponAssembled = ""; \
weaponDisassembled = ""; \
weaponDeployed = ""; \
weaponRested = ""; \
reloaded = "";
