/*
    Header: script_xeh.hpp

    Description:
        Used internally.
*/
/////////////////////////////////////////////////////////////////////////////////
// MACRO: EXTENDED_EVENTHANDLERS
// Add all XEH event handlers
/////////////////////////////////////////////////////////////////////////////////

#define EXTENDED_EVENTHANDLERS init = "call cba_xeh_fnc_init"; \
fired = "call cba_xeh_fnc_fired"; \
animChanged = "call cba_xeh_fnc_animChanged"; \
animDone = "call cba_xeh_fnc_animDone"; \
animStateChanged = "call cba_xeh_fnc_animStateChanged"; \
assembled = "call cba_xeh_fnc_assembled"; \
attached = "call cba_xeh_fnc_attached"; \
cargoLoaded = "call cba_xeh_fnc_cargoLoaded"; \
cargoUnloaded = "call cba_xeh_fnc_cargoUnloaded"; \
containerClosed = "call cba_xeh_fnc_containerClosed"; \
containerOpened = "call cba_xeh_fnc_containerOpened"; \
controlsShifted = "call cba_xeh_fnc_controlsShifted"; \
dammaged = "call cba_xeh_fnc_dammaged"; \
deleted = "call cba_xeh_fnc_deleted"; \
detached = "call cba_xeh_fnc_detached"; \
disassembled = "call cba_xeh_fnc_disassembled"; \
engine = "call cba_xeh_fnc_engine"; \
epeContact = "call cba_xeh_fnc_epeContact"; \
epeContactEnd = "call cba_xeh_fnc_epeContactEnd"; \
epeContactStart = "call cba_xeh_fnc_epeContactStart"; \
explosion = "call cba_xeh_fnc_explosion"; \
firedMan = "call cba_xeh_fnc_firedMan"; \
firedNear = "call cba_xeh_fnc_firedNear"; \
fuel = "call cba_xeh_fnc_cba_xeh_fuel"; \
gear = "call cba_xeh_fnc_gear"; \
gestureChanged = "call cba_xeh_fnc_gestureChanged"; \
gestureDone = "call cba_xeh_fnc_gestureDone"; \
getIn = "call cba_xeh_fnc_getIn"; \
getInMan = "call cba_xeh_fnc_getInMan"; \
getOut = "call cba_xeh_fnc_getOut"; \
getOutMan = "call cba_xeh_fnc_getOutMan"; \
handleHeal = "call cba_xeh_fnc_handleHeal"; \
hit = "call cba_xeh_fnc_hit"; \
hitPart = "call cba_xeh_fnc_hitPart"; \
incomingMissile = "call cba_xeh_fnc_incomingMissile"; \
inventoryClosed = "call cba_xeh_fnc_inventoryClosed"; \
inventoryOpened = "call cba_xeh_fnc_inventoryOpened"; \
killed = "call cba_xeh_fnc_killed"; \
landedTouchDown = "call cba_xeh_fnc_landedTouchDown"; \
landedStopped = "call cba_xeh_fnc_landedStopped"; \
leaningChanged = "call cba_xeh_fnc_leaningChanged"; \
local = "call cba_xeh_fnc_local"; \
magazineReloading = "call cba_xeh_fnc_magazineReloading"; \
opticsModeChanged = "call cba_xeh_fnc_opticsModeChanged"; \
opticsSwitch = "call cba_xeh_fnc_opticsSwitch"; \
put = "call cba_xeh_fnc_put"; \
reloaded = "call cba_xeh_fnc_reloaded"; \
respawn = "call cba_xeh_fnc_respawn"; \
ropeAttach = "call cba_xeh_fnc_ropeAttach"; \
ropeBreak = "call cba_xeh_fnc_ropeBreak"; \
seatSwitched = "call cba_xeh_fnc_seatSwitched"; \
seatSwitchedMan = "call cba_xeh_fnc_seatSwitchedMan"; \
slotItemChanged = "call cba_xeh_fnc_slotItemChanged"; \
suppressed = "call cba_xeh_fnc_suppressed"; \
soundPlayed = "call cba_xeh_fnc_soundPlayed"; \
take = "call cba_xeh_fnc_take"; \
turnIn = "call cba_xeh_fnc_turnIn"; \
turnOut = "call cba_xeh_fnc_turnOut"; \
visionModeChanged = "call cba_xeh_fnc_visionModeChanged"; \
weaponAssembled = "call cba_xeh_fnc_weaponAssembled"; \
weaponChanged = "call cba_xeh_fnc_weaponChanged"; \
weaponDisassembled = "call cba_xeh_fnc_weaponDisassembled"; \
weaponDeployed = "call cba_xeh_fnc_weaponDeployed"; \
weaponRested = "call cba_xeh_fnc_weaponRested";


/*
   MACRO: DELETE_EVENTHANDLERS

    Removes all event handlers.
*/

#define DELETE_EVENTHANDLERS init = ""; \
fired = ""; \
animChanged = ""; \
animDone = ""; \
animStateChanged = ""; \
assembled = ""; \
attached = ""; \
cargoLoaded = ""; \
cargoUnloaded = ""; \
containerClosed = ""; \
containerOpened = ""; \
controlsShifted = ""; \
dammaged = ""; \
deleted = ""; \
detached = ""; \
disassembled = ""; \
engine = ""; \
epeContact = ""; \
epeContactEnd = ""; \
epeContactStart = ""; \
explosion = ""; \
firedMan = ""; \
firedNear = ""; \
fuel = ""; \
gear = ""; \
gestureChanged = ""; \
gestureDone = "" \
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
leaningChanged = ""; \
local = ""; \
magazineReloading = ""; \
opticsModeChanged = ""; \
opticsSwitch = ""; \
put = ""; \
reloaded = ""; \
respawn = ""; \
ropeAttach = ""; \
ropeBreak = ""; \
seatSwitched = ""; \
seatSwitchedMan = ""; \
soundPlayed = ""; \
suppressed = ""; \
take = ""; \
turnIn = ""; \
turnOut = ""; \
visionModeChanged = ""; \
weaponAssembled = ""; \
weaponChanged = ""; \
weaponDisassembled = ""; \
weaponDeployed = ""; \
weaponRested = "";
