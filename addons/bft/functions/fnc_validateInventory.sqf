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

private ["_unit", "_magazine", "_previousMags", "_newMagName", "_newMags", "_magID", "_unMatchedDevices", "_ownedDevices", "_matchedIDs"];
_unit = _this select 0;

if !(local _unit) exitwith {};

{
    [_unit, _x] call FUNC(checkItem);
}foreach items _unit;

_ownedDevices = _unit getvariable [QGVAR(ownedDevices), []];
_matchedIDs = [];
{
    _magID = [_x] call FUNC(getMagazineID);
    _data = [_magID] call FUNC(getDeviceData);
    if (count _data > 0) then {
        if !(_magID in _ownedDevices) then {
            systemChat format["validate - new picked up ID: %1 %2", _unit, _magID];
            diag_log format["validate - new picked up  ID: %1 %2", _unit, _magID];
        };
        [_magID, _unit] call FUNC(setDeviceOwner);
        _matchedIDs pushback _magID;
    } else {
        _magazine = magazines _unit select _foreachIndex;
        if (getText (configFile >> "CfgMagazines" >> _magazine >> GVAR(type)) != "") then {
            ["bft_itemCreated", [_unit, getText (configFile >> "CfgMagazines" >> _magazine >> GVAR(type)), _magazine, _magID]] call EFUNC(common,serverEvent);
        };
    };
}foreach (magazinesDetail _unit);

_unMatchedDevices = _ownedDevices - _matchedIDs;
{
    systemChat format["validate - no longer has ID: %1 %2", _unit, _x];
    diag_log format["validate - no longer has ID: %1 %2", _unit, _x];
    ["bft_updateDeviceOwner", [_x, objNull]] call EFUNC(common,globalEvent);
}foreach _unMatchedDevices;

systemChat format["validate - devices: %1 %2", GVAR(deviceData)];
diag_log format["validate - devices: %1 %2", GVAR(deviceData)];
