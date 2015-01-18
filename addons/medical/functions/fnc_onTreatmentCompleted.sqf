/**
 * fnc_handleTreatmentCompleted.sqf
 * @Descr: Called when a treatment action has been completed.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller", "_target","_selectionName","_removeItem"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

[_caller,false] call FUNC(treatmentMutex);

// TODO: BUG: if AI finishes treatment, it will also hide the icon for the player
[QGVAR(treatmentIconID), false, "", [1,1,1,1]] call EFUNC(gui,displayIcon);