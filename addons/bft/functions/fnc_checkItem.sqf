#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: object <OBJECT>
 * 1: item <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_unit", "_item"];

if !(local _unit) exitwith {};

private _configEntry = configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType);
if (isText _configEntry && {(getText _configEntry) != ""}) then {

    if !(isClass (configFile >> "ACE_BFT" >> "Devices" >> (getText _configEntry))) exitwith {};

    systemChat format["%1 BFT enabled item %2", _unit, _item];
    diag_log format["%1 BFT enabled item %2", _unit, _item];

    private _magazine = getText (configFile >> "CfgWeapons" >> _item >> QGVAR(magazineItem));
    if (_magazine != "") then {
        systemChat format["%1 replacing by %2", _item, _magazine];
        diag_log format["%1 replacing by %2", _item, _magazine];

        _unit removeItem _item;
        private _previousMags = magazinesDetail _unit;
        _unit addMagazine _magazine;
        private _newMags = (magazinesDetail _unit) - _previousMags;
        if (_newMags isEqualTo []) exitWith {ERROR("failed to add magazine (inventory full?)");};
        private _newMagName = _newMags select 0;

        private _magID = [_newMagName] call FUNC(getMagazineID);
        systemChat format["%1 id %2", _item, _magID];
        diag_log format["%1 id %2", _item, _magID];

        if (_magID != "") then {
            GVAR(pendingIdAssignmentList) pushback _magID;
            ["bft_itemCreated", [_unit, _item, _magazine, _magID]] call CBA_fnc_serverEvent;
        };
    };
};
