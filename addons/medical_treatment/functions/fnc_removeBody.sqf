#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Removes a body. Ideally it is deleted the next frame.
 * However, player bodies cannot be deleted until they respawn, so it is hidden and deleted later.
 *
 * Arguments:
 * 0: Body <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_medical_treatment_fnc_removeBody
 *
 * Public: No
 */

params ["_body"];
TRACE_2("removeBody",_body,isPlayer _body);

// Hide the body globally
[QEGVAR(common,hideObjectGlobal), [_body, true]] call CBA_fnc_serverEvent;

// Add body to array of those waiting for deletion
if (isNil QGVAR(bodiesToDelete)) then {
    GVAR(bodiesToDelete) = [];
};

GVAR(bodiesToDelete) pushBack _body;

// Start up the body cleanup loop to delete bodies once they are free
if (count GVAR(bodiesToDelete) == 1) then {
    [] call FUNC(bodyCleanupLoop);
};
