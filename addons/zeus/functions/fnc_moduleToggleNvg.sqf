#include "script_component.hpp"
/*
 * Author: alganthe, mharis001
 * Zeus module function to toggle NVGs.
 *
 * Arguments:
 * 0: Logic object <OBJECT>
 * 1: Toggle mode <BOOL>
 * 2: Target units (-1 - Selected group, 0 - BLUFOR, 1 - OPFOR, 2 - Independent, 3 - Civilian) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, true, -1] call ace_zeus_fnc_moduleToggleNvg
 *
 * Public: No
 */

params ["_logic", "_toggle", "_target"];
TRACE_1("params",_this);

// Create array of target units
private _units = [];

if (_target == -1) then {
    _units = (units attachedTo _logic) select {alive _x && {!([_x] call EFUNC(common,isPlayer))}};
} else {
    private _side = [west, east, independent, civilian] select _target;
    _units = allUnits select {alive _x && {side _x == _side} && {!([_x] call EFUNC(common,isPlayer))}};
};

// Add or remove NVGs from units
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgWeapons = configFile >> "CfgWeapons";

if (_toggle) then {
    {
        if (hmd _x isEqualTo "") then {
            // Get NVG item and helmet from unit config
            private _linkedItems = getArray (_cfgVehicles >> typeOf _x >> "linkedItems");
            private _nvgItem = _linkedItems select {_x isKindOf ["NVGoggles", _cfgWeapons]};
            private _nvgHelmet = _linkedItems select {!(getArray (_cfgWeapons >> _x >> "subItems") isEqualTo [])};

            // Add NVG helmet if defined
            if !(_nvgHelmet isEqualTo []) exitWith {
                _x addHeadgear (_nvgHelmet select 0);
            };

            // Add NVGs if defined
            if !(_nvgItem isEqualTo []) exitWith {
                _x linkItem (_nvgItem select 0);
            };

            // Default: add basic NVGs
            _x linkItem "NVGoggles";
        };
    } forEach _units;
} else {
    {
        // Get unit current NVGs or helmet with NVG built-in
        private _nvgItem = hmd _x;
        private _nvgHelmet = getArray (_cfgWeapons >> headgear _x >> "subItems") isEqualTo [];

        // Remove NVG equipment from unit
        if !(_nvgHelmet) then {
            removeHeadgear _x;
        };

        if !(_nvgItem isEqualTo "") then {
            _x unlinkItem _nvgItem;
        };
    } forEach _units;
};

deleteVehicle _logic;
