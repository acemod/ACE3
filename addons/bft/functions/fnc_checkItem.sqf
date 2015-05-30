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

#include "script_component.hpp"

PARAMS_2(_unit,_item);

private ["_magazine", "_previousMags", "_newMagName", "_newMags", "_magID"];

if !(local _unit) exitwith {};


if (isText (configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType)) && {getText(configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType)) != ""}) then {

    if !(isClass (configFile >> "ACE_BFT" >> "Devices" >> (getText(configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType))))) exitwith {};

    systemChat format["%1 BFT enabled item %2", _unit, _item];
    diag_log format["%1 BFT enabled item %2", _unit, _item];

    _magazine = getText (configFile >> "CfgWeapons" >> _item >> QGVAR(magazineItem));
    if (_magazine != "") then {
        systemChat format["%1 replacing by %2", _item, _magazine];
        diag_log format["%1 replacing by %2", _item, _magazine];

        _unit removeItem _item;
        _previousMags = magazinesDetail _unit;
        _unit addMagazine _magazine;
        _newMags = (magazinesDetail _unit) - _previousMags;
        if ((count _newMags) == 0) exitWith {ERROR("failed to add magazine (inventory full?)");};
        _newMagName = _newMags select 0;

        _magID = [_newMagName] call FUNC(getMagazineID);
        systemChat format["%1 id %2", _item, _magID];
        diag_log format["%1 id %2", _item, _magID];

        if (_magID != "") then {
            ["bft_itemCreated", [_unit, _item, _magazine, _magID]] call EFUNC(common,serverEvent);
        };
    };
};