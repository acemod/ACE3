/*
 * Author: KoffeinFlummi
 *
 * Nothing to see here, move along.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

{
    _hiddenSelections = count (getArray (configFile >> "CfgVehicles" >> (typeOf _x) >> "hiddenSelections"));
    if (_hiddenSelections > 0) then {
        nul = [_x, _hiddenSelections] spawn {
            _vehicle = _this select 0;
            _hSCount = _this select 1;
            _colors = [
                "#(argb,8,8,3)color(1,0,0,1,co)",
                "#(argb,8,8,3)color(1,0.5,0,1,co)",
                "#(argb,8,8,3)color(1,1,0,1,co)",
                "#(argb,8,8,3)color(0,1,0,1,co)",
                "#(argb,8,8,3)color(0,0,1,1,co)",
                "#(argb,8,8,3)color(0.2,0,0.5,1,co)",
                "#(argb,8,8,3)color(0.5,0,1,1,co)"
            ];
            _index = 0;
            while {True} do {
                for "_i" from 0 to (_hSCount - 1) do {
                    _vehicle setObjectTexture [_i, (_colors select _index)];
                };
                _index = (_index + 1) % 7;
                sleep 0.02;
            };
        };
    };
} count _units;

diag_log text "[ACE]: WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE.";
