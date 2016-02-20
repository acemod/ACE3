/*
 * Author: PabstMirror
 * Removes corpse. Idealy it is just deleted the next frame,
 * but player bodies cannot be deleted until they respawn, so it is hidden and deleted later.
 *
 * Arguments:
 * 0: Mr Body <OBJECT>
 *
 * Return Value:
 * Nothing
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
["hideObjectGlobal", [_target, true]] call EFUNC(common,serverEvent);

if (isNil QGVAR(bodiesToDelete)) then {GVAR(bodiesToDelete) = [];};
GVAR(bodiesToDelete) pushBack _target;

//Start up PFEH to wait for bodies to be free to delete
if ((count GVAR(bodiesToDelete)) == 1) then {
    TRACE_1("starting PFEH",GVAR(bodiesToDelete));
    [{
        {
            TRACE_2("body",_x,isPlayer _x);
            if ((!isNull _x) && {!isPlayer _x}) then {deleteVehicle _x};
        } forEach GVAR(bodiesToDelete);

        //deleteVehicle doesn't have instant results so it won't usualy be filtered until next run
        GVAR(bodiesToDelete) = GVAR(bodiesToDelete) - [objNull];

        if (GVAR(bodiesToDelete) isEqualTo []) then {
            TRACE_1("array emptied - rem PFEH",GVAR(bodiesToDelete));
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 20, []] call CBA_fnc_addPerFrameHandler;
};

nil
