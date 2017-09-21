/*
 * Author: alganthe
 * Zeus module function to toggle NVGs
 *
 * Arguments:
 * 0: Logic object <OBJECT>
 * 1: Toggle mode <BOOL>
 * 2: Target of the toggle <SCALAR> 0: blufor; 1: opfor; 2: indep; 3: civ; 4: selected group
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, true, 4] call ace_zeus_fnc_moduleToggleNvg
 *
 * Public: No
*/

#include "script_component.hpp"

params ["_logic", "_toggle", "_target"];

private _units = [];

if (_target == 4) then {
    _units = units (attachedTo _logic);
} else {
    _units = allUnits select {alive _x && {side _x == ([blufor, opfor, independent, civilian] select _target)}},
};

if (_toggle) then {
    {
        if (!isplayer _x && {hmd _x isEqualTo ""}) then {
            private _cfgArray = getArray (configFile >> 'CfgVehicles' >> typeOf _x >>'linkedItems');

            private _nvgClass = _cfgArray select {_x isKindOf ["NVGoggles",(configFile >> "CfgWeapons")]};
            private _nvgHelmet =_cfgArray select {count (getArray (configFile >> "CfgWeapons" >> _x >> "subItems")) > 0};

            // Can't have more than 1 assigned by default
            if (count _nvgClass == 1 || {count _nvgHelmet == 1}) then {
                if (count _nvgHelmet == 1) then {
                    _x addHeadgear (_nvgHelmet select 0);
                } else {
                    _x linkItem  (_nvgClass select 0);
                };

            } else {
                _x linkItem "NVGoggles";
            };
        };
    } foreach _units;

} else {
    {
        if (!isplayer _x) then {
            private _cfgArray = getArray (configFile >> 'CfgVehicles' >> typeOf _x >>'linkedItems');

            private _nvgHelmet =_cfgArray select {count (getArray (configFile >> "CfgWeapons" >> _x >> "subItems")) > 0};

            if (count _nvgHelmet == 1) then {
                removeHeadgear _x;
            } else {
                _x unlinkItem (hmd _x);
            };
        };
    } foreach _units;
};

deleteVehicle _logic;
