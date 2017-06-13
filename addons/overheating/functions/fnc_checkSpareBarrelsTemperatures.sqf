/*
 * Author: esteldunedain
 * Make the player check the temperature of his spare barrels
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_overheating_fnc_checkSpareBarrelsTemperature
 *
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

// Check canInteractWith:
if (!([_player, objNull, ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))) exitWith {};

// Make the unit go kneeling
[_player] call EFUNC(common,goKneeling);

// Spawn a progress bar
[
    5.0,
    [_player],
    {
        params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
        _args params ["_player"];
        // Time has enlapsed, ask the server to send the hint
        [QGVAR(sendSpareBarrelTemperatureHint), [_player, _player]] call CBA_fnc_serverEvent;
    },
    {},
    (localize LSTRING(CheckingSpareBarrelsTemperatures)),
    {true},
    ["isNotInside", "isNotSitting"]
] call EFUNC(common,progressBar);
