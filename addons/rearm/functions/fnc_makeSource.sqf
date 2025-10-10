#include "..\script_component.hpp"
/*
 * Author: shukari (template from refuel makeSource)
 * Makes an object into a rearm source.
 * Run on server only.
 *
 * Arguments:
 * 0: Rearm Source <OBJECT>
 * 1: Rearm amount <NUMBER> (default: 0)
 * 2: add rearm amount instead of set <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 1200] call ace_rearm_fnc_makeSource
 *
 * Public: Yes
 */
if (!isServer) exitWith {};

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(makeSource), _this];
};

params [
        ["_source", objNull, [objNull]],
        ["_rearmCargo", 0, [0]],
        ["_addToCurrent", false, [false]]
    ];
TRACE_3("makeSource",_source,_rearmCargo,_addToCurrent);

if (isNull _source) exitWith {};

private _currentSupply = if (_addToCurrent) then {
    _source getVariable [QGVAR(currentSupply), 0]
} else {
    0
};

_source setVariable [QGVAR(currentSupply), _currentSupply + _rearmCargo, true];

private _config = configOf _source;
private _rearmCargoConfig = getNumber (_config >> QGVAR(defaultSupply));
if (_rearmCargoConfig == 0) then {
    _rearmCargoConfig = getNumber (_config >> "transportAmmo");
};

// initialize if it's not a config rearm vehicle
if (!(_rearmCargoConfig > 0 && _source getVariable [QGVAR(isSupplyVehicle), false])) then {
    _source setVariable [QGVAR(isSupplyVehicle), true, true];

    // only add if menu does not already exist
    if ((_source isNil QGVAR(initSupplyVehicle_jipID))) then {
        private _jipID = [QGVAR(initSupplyVehicle), [_source]] call CBA_fnc_globalEventJIP;
        [_jipID, _source] call CBA_fnc_removeGlobalEventJIP;
        _source setVariable [QGVAR(initSupplyVehicle_jipID), _jipID];
    };
};

[QGVAR(rearmSourceInitalized), [_source]] call CBA_fnc_globalEvent;
