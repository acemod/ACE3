/*
 * Author: KoffeinFlummi, joko // Jonas
 *
 * Nothing to see here, move along.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_units", "_activated"];

if !(_activated) exitWith {};

if (isNil QGVAR(LSD_Vehicles)) then {
    GVAR(LSD_Vehicles) = [];
};

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

if (isNil QGVAR(LSD_index)) then {
    GVAR(LSD_index) = 0;
};

GVAR(LSD_ColorsCount) = count GVAR(LSD_Colors);

{
    _hSCount = count (getArray (configFile >> "CfgVehicles" >> typeOf _x >> "hiddenSelections"));
    if (_hSCount > 0) then {
        GVAR(LSD_Vehicles) pushBack [_x, _hSCount];
    };
    nil
} count _units;

if (isNil QGVAR(LSD_PFH)) then {
    GVAR(LSD_PFH) = [{
        {
            params ["_vehicle", "_hSCount"];
            for "_i" from 0 to (_hSCount - 1) do {
                _vehicle setObjectTexture [_i, _colors select GVAR(LSD_index)];
            };
            nil
        } count GVAR(LSD_Vehicles);
        GVAR(LSD_index) = ((GVAR(LSD_index) + 1) % 7) mod GVAR(LSD_ColorsCount);
    }, 0.02, []] call CBA_fnc_addPerFrameHandler;
};
ACE_LOGINFO("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEED.");
