#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Create one action per FOB.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [target, player, [params]] call acex_fority_fnc_teleport;
 *
 * Public: No
 */

// Parameter init
params ["_terminal", "_player"];
private _actions = [];

// Children Action Loop - FOBs
{
    private _units = _x nearEntities [["CAManBase","Car","Tank"], ace_fortify_blockDistance];
    if (({!([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _units) < (({side _x == playerSide} count _units) + 1) || count _units == 0) then {
        _code = [
                    format ["%1", _x],
                    format ["FOB %1", (mapGridPosition (getPos _x))],
                    "",
                    { 
                        player setPos (getPos (_this select 2 select 0));
                    },
                    {true},
                    {},
                    [_x]
                ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_code,[],_terminal];
    };
} forEach  ace_fobs;

// Children Action Loop - Rally Points
{
    private _friendlies = _x nearEntities [["CAManBase","Car","Tank"], 25];
    private _enemies = _x nearEntities [["CAManBase","Car","Tank"], ace_fortify_blockDistance];
    if (({!([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _enemies < ({([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _enemies) + 1) && ({([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _friendlies) > 0) then {
        _code = [
                    format ["%1", _x],
                    format ["RP %1", (mapGridPosition (getPos _x))],
                    "",
                    { 
                        player setPos (getPos (_this select 2 select 0));
                    },
                    {true},
                    {},
                    [_x]
                ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_code,[],_terminal];
    };
} forEach  ace_rally;

// Return
_actions