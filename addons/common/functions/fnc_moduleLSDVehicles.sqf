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
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

{
    private "_hSCount";
    _hSCount = count (getArray (configFile >> "CfgVehicles" >> typeOf _x >> "hiddenSelections"));

    if (_hSCount > 0) then {
        [_x, _hSCount] spawn {
            params ["_vehicle", "_hSCount"];

            private ["_colors", "_index"];

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

            while {true} do {
                for "_i" from 0 to (_hSCount - 1) do {
                    _vehicle setObjectTexture [_i, _colors select _index];
                };

                _index = (_index + 1) % 7;

                sleep 0.02;
            };
        };
    };
    false
} count _units;

ACE_LOGINFO("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE.");
