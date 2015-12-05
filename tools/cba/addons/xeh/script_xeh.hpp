/*
    Header: script_xeh.hpp

    Description:
        Used internally.
*/
/////////////////////////////////////////////////////////////////////////////////
// MACRO: EXTENDED_EVENTHANDLERS
// Add all XEH event handlers
/////////////////////////////////////////////////////////////////////////////////
#define EXTENDED_EVENTHANDLERS init = "_this call SLX_XEH_EH_Init"; \
fired              = "_this call SLX_XEH_EH_Fired"; \
animChanged        = "_this call SLX_XEH_EH_AnimChanged"; \
animDone           = "_this call SLX_XEH_EH_AnimDone"; \
animStateChanged   = "_this call SLX_XEH_EH_AnimStateChanged"; \
containerClosed    = "_this call SLX_XEH_EH_ContainerClosed"; \
containerOpened    = "_this call SLX_XEH_EH_ContainerOpened"; \
controlsShifted    = "_this call SLX_XEH_EH_ControlsShifted"; \
dammaged           = "_this call SLX_XEH_EH_Dammaged"; \
engine             = "_this call SLX_XEH_EH_Engine"; \
epeContact         = "_this call SLX_XEH_EH_EpeContact"; \
epeContactEnd      = "_this call SLX_XEH_EH_EpeContactEnd"; \
epeContactStart    = "_this call SLX_XEH_EH_EpeContactStart"; \
explosion          = "_this call SLX_XEH_EH_Explosion"; \
firedNear          = "_this call SLX_XEH_EH_FiredNear"; \
fuel               = "_this call SLX_XEH_EH_Fuel"; \
gear               = "_this call SLX_XEH_EH_Gear"; \
getIn              = "_this call SLX_XEH_EH_GetIn"; \
getOut             = "_this call SLX_XEH_EH_GetOut"; \
handleHeal         = "_this call SLX_XEH_EH_HandleHeal"; \
hit                = "_this call SLX_XEH_EH_Hit"; \
hitPart            = "_this call SLX_XEH_EH_HitPart"; \
incomingMissile    = "_this call SLX_XEH_EH_IncomingMissile"; \
inventoryClosed    = "_this call SLX_XEH_EH_InventoryClosed"; \
inventoryOpened    = "_this call SLX_XEH_EH_InventoryOpened"; \
killed             = "_this call SLX_XEH_EH_Killed"; \
landedTouchDown    = "_this call SLX_XEH_EH_LandedTouchDown"; \
landedStopped      = "_this call SLX_XEH_EH_LandedStopped"; \
local              = "_this call SLX_XEH_EH_Local"; \
respawn            = "_this call SLX_XEH_EH_Respawn"; \
put                = "_this call SLX_XEH_EH_Put"; \
take               = "_this call SLX_XEH_EH_Take"; \
seatSwitched       = "_this call SLX_XEH_EH_SeatSwitched"; \
soundPlayed        = "_this call SLX_XEH_EH_SoundPlayed"; \
weaponAssembled    = "_this call SLX_XEH_EH_WeaponAssembled"; \
weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";

//handleDamage      = "_this call SLX_XEH_EH_HandleDamage"; \
//mpHit             = "_this call SLX_XEH_EH_MPHit"; \
//mpKilled          = "_this call SLX_XEH_EH_MPKilled"; \
//mpRespawn         = "_this call SLX_XEH_EH_MPRespawn";



/* 
   MACRO: DELETE_EVENTHANDLERS

   Removes all event handlers.
 
  Example:
 (begin example)
    class DefaultEventhandlers;
    class Car_F;
    class MRAP_01_base_F: Car_F {
        class EventHandlers;
    };
    class B_MRAP_01_F: MRAP_01_base_F {
        class Eventhandlers: EventHandlers {
            DELETE_EVENTHANDLERS
        };
    };
 (end example)
*/

#define DELETE_EVENTHANDLERS delete init; \
delete fired; \
delete animChanged; \
delete animDone; \
delete animStateChanged; \
delete containerClosed; \
delete containerOpened; \
delete controlsShifted; \
delete dammaged; \
delete engine; \
delete epeContact; \
delete epeContactEnd; \
delete epeContactStart; \
delete explosion; \
delete firedNear; \
delete fuel; \
delete gear; \
delete getIn; \
delete getOut; \
delete handleHeal; \
delete hit; \
delete hitPart; \
delete incomingMissile; \
delete inventoryClosed; \
delete inventoryOpened; \
delete killed; \
delete landedTouchDown; \
delete landedStopped; \
delete local;  \
delete respawn;  \
delete put;  \
delete take; \
delete seatSwitched; \
delete soundPlayed; \
delete weaponAssembled; \
delete weaponDisAssembled;
