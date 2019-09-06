#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Loop that cleans up blood
 *
 * Arguments:
 * None
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */
        
(GVAR(bloodDrops) deleteAt 0) params ["", "_deletedBloodDrop"];
deleteVehicle _deletedBloodDrop;

// If we cleaned out the array, exit loop
if (GVAR(bloodDrops) isEqualTo []) exitWith {};

// Wait until the next blood drop in the queue will expire
(GVAR(bloodDrops) select 0) params ["_expireTime"];
[FUNC(serverCleanupBlood), [], (_expireTime - CBA_missionTime)] call CBA_fnc_waitAndExecute;
