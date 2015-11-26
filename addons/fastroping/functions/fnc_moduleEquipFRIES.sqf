/*
 * Author: BaerMitUmlaut
 * Equips synched helicopters with a FRIES.
 *
 * Arguments:
 * 0: Module <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_cutRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_module"];
private ["_synchedUnits", "_config", "_fries"];

_synchedUnits = synchronizedObjects _module;
{
    if (_x isKindOf "CAManBase") then {
        _x = vehicle _x;
    };
    _config = configFile >> "CfgVehicles" >> typeOf _x;
    if !(isNumber (_config >> QGVAR(enabled))) then {
        ["%1 has not been configured for ACE_Fastroping.", getText (_config >> "DisplayName")] call BIS_fnc_error;
    } else {
        if (getNumber (_config >> QGVAR(enabled)) == 2) then {
            _fries = (getText (_config >> QGVAR(friesType))) createVehicle [0, 0, 0];
            _fries attachTo [_x, (getArray (_config >> QGVAR(friesAttachmentPoint)))];
            _x setVariable [QGVAR(FRIES), _fries, true];
        };
    };
    false
} count _synchedUnits;
