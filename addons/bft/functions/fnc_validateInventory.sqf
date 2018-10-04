/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

if !(local _unit) exitwith {};

{
    [_unit, _x] call FUNC(checkItem);
} forEach items _unit;

private _ownedDevices = _unit getvariable [QGVAR(ownedDevices), []];
private _matchedIDs = [];
{
    private _magID = [_x] call FUNC(getMagazineID);
    private _data = [_magID] call FUNC(getDeviceData);
    if !(_data isEqualTo []) then {
        if !(_magID in _ownedDevices) then {
            systemChat format["validate - new picked up ID: %1 %2", _unit, _magID];
            diag_log format["validate - new picked up  ID: %1 %2", _unit, _magID];
        };
        [_magID, _unit] call FUNC(setDeviceOwner);
        _matchedIDs pushback _magID;
    } else {
        if (!(_magId in GVAR(pendingIdAssignmentList))) then {
            private _magazine = (magazines _unit) select _forEachIndex;
            private _configText = getText (configFile >> "CfgMagazines" >> _magazine >> QGVAR(type));
            if (_configText != "") then {
                ["bft_itemCreated", [_unit, _configText, _magazine, _magID]] call CBA_fnc_serverEvent;
            };
        };
    };
}foreach (magazinesDetail _unit);

private _unMatchedDevices = _ownedDevices - _matchedIDs;
{
    systemChat format["validate - no longer has ID: %1 %2", _unit, _x];
    diag_log format["validate - no longer has ID: %1 %2", _unit, _x];
    ["bft_updateDeviceOwner", [_x, objNull]] call CBA_fnc_globalEvent;
    systemChat format["Dropped a bft device: %1 - %2", _unit, _X];
    diag_log format["Dropped a bft device: %1 - %2", _unit, _X];
} forEach _unMatchedDevices;
