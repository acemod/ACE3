/*
 * Author: PabstMirror
 * Removes corpse. Idealy it is just deleted the next frame,
 * but player bodies cannot be deleted until they respawn, so it is hidden and deleted later.
 *
 * Arguments:
 * 0: Mr Body <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call ace_medical_fnc_serverRemoveBody
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target"];
TRACE_2("",_target,isPlayer _target);

//Hide the body globaly
[QEGVAR(common,hideObjectGlobal), [_target, true]] call CBA_fnc_serverEvent;

if (isNil QGVAR(bodiesToDelete)) then {GVAR(bodiesToDelete) = [];};
GVAR(bodiesToDelete) pushBack _target;

// Start up a loop to wait for bodies to be free to delete
if ((count GVAR(bodiesToDelete)) == 1) then {
    [] call FUNC(bodyCleanupLoop);
};

nil
