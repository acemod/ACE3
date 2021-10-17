#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, joko // Jonas
 * Nothing to see here, move along.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, target, []] call ace_common_fnc_moduleLSDVehicles
 *
 * Public: No
 */

params ["", "_units", "_activated"];

if (!_activated || {GVAR(epilepsyFriendlyMode)}) exitWith {};

if (isNil QGVAR(LSD_Vehicles)) then {
    GVAR(LSD_Vehicles) = [];
};

{
    _hSCount = count (getArray (configOf _x >> "hiddenSelections"));
    if (_hSCount > 0) then {
        GVAR(LSD_Vehicles) pushBack [_x, _hSCount];
    };
    nil
} count _units;

if (isNil QGVAR(LSD_Colors)) then {
    GVAR(LSD_Colors) = [
        "#(argb,8,8,3)color(1,0,0,1,co)",
        "#(argb,8,8,3)color(1,0.5,0,1,co)",
        "#(argb,8,8,3)color(1,1,0,1,co)",
        "#(argb,8,8,3)color(0,1,0,1,co)",
        "#(argb,8,8,3)color(0,0,1,1,co)",
        "#(argb,8,8,3)color(0.2,0,0.5,1,co)",
        "#(argb,8,8,3)color(0.5,0,1,1,co)"
    ];
};

if (isNil QGVAR(LSD_PFH)) then {
    GVAR(LSD_PFH) = [{
        (_this select 0) params ["_index"];
        {
            _x params ["_vehicle", "_hSCount"];
            for "_i" from 0 to (_hSCount - 1) do {
                _vehicle setObjectTexture [_i, GVAR(LSD_Colors) select _index];
            };
            nil
        } count GVAR(LSD_Vehicles);

        _index = ((_index + 1) % 7) mod count GVAR(LSD_Colors);
        (_this select 0) set [0, _index];

    }, 0.02, [0]] call CBA_fnc_addPerFrameHandler;
};
INFO("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEED.");
