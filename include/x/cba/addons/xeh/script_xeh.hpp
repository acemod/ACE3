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
containerClosed = "call cba_xeh_fnc_containerClosed"; \
containerOpened = "call cba_xeh_fnc_containerOpened"; \
controlsShifted = "call cba_xeh_fnc_controlsShifted"; \
dammaged = "call cba_xeh_fnc_dammaged"; \
engine = "call cba_xeh_fnc_engine"; \
epeContact = "call cba_xeh_fnc_epeContact"; \
epeContactEnd = "call cba_xeh_fnc_epeContactEnd"; \
epeContactStart = "call cba_xeh_fnc_epeContactStart"; \
explosion = "call cba_xeh_fnc_explosion"; \
firedNear = "call cba_xeh_fnc_firedNear"; \
fuel = "call cba_xeh_fnc_cba_xeh_fuel"; \
gear = "call cba_xeh_fnc_gear"; \
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
local = "call cba_xeh_fnc_local"; \
respawn = "call cba_xeh_fnc_respawn"; \
put = "call cba_xeh_fnc_put"; \
take = "call cba_xeh_fnc_take"; \
seatSwitched = "call cba_xeh_fnc_seatSwitched"; \
seatSwitchedMan = "call cba_xeh_fnc_seatSwitchedMan"; \
soundPlayed = "call cba_xeh_fnc_soundPlayed"; \
weaponAssembled = "call cba_xeh_fnc_weaponAssembled"; \
weaponDisassembled = "call cba_xeh_fnc_weaponDisassembled"; \
weaponDeployed = "call cba_xeh_fnc_weaponDeployed"; \
weaponRested = "call cba_xeh_fnc_weaponRested"; \
reloaded = "call cba_xeh_fnc_reloaded"; \
firedMan = "call cba_xeh_fnc_firedMan"; \
turnIn = "call cba_xeh_fnc_turnIn"; \
turnOut = "call cba_xeh_fnc_turnOut"; \
deleted = "call cba_xeh_fnc_deleted"; \
disassembled = "call cba_xeh_fnc_disassembled"; \
Suppressed = "call cba_xeh_fnc_Suppressed"; \
gestureChanged = "call cba_xeh_fnc_gestureChanged"; \
gestureDone = "call cba_xeh_fnc_gestureDone";

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
seatSwitchedMan = ""; \
soundPlayed = ""; \
weaponAssembled = ""; \
weaponDisassembled = ""; \
weaponDeployed = ""; \
weaponRested = ""; \
reloaded = ""; \
firedMan = ""; \
turnIn = ""; \
turnOut = ""; \
deleted = ""; \
disassembled = ""; \
Suppressed = ""; \
gestureChanged = ""; \
gestureDone = ""
