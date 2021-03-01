#include "script_component.hpp"
/*
 * Author: mharis001, Dystopian
 * Switches weapon attachment.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Action params <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [currentWeapon player, "acc_flashlight", ""]] call ace_interaction_fnc_switchWeaponAttachment
 *
 * Public: No
 */

params ["_unit", "", "_actionParams"];
_actionParams params ["_weapon", "_newAttachment", "_oldAttachment"];
TRACE_3("Switching attachment",_weapon,_newAttachment,_oldAttachment);

[_unit, "Gear"] call EFUNC(common,doGesture);

private _addNew = _newAttachment isNotEqualTo "";
private _removeOld = _oldAttachment isNotEqualTo "";

if (_addNew) then {
    _unit removeItem _newAttachment;
};

if (_removeOld && {!([_unit, _oldAttachment] call CBA_fnc_canAddItem)}) exitWith {
    LOG("no space");
    [LELSTRING(common,Inventory_Full)] call EFUNC(common,displayTextStructured);
    if (_addNew) then {
        _unit addItem _newAttachment;
    };
};

if (_removeOld) then {
    [{
        params ["_unit", "_weapon", "_oldAttachment"];
        switch (_weapon) do {
            case (primaryWeapon _unit): {_unit removePrimaryWeaponItem _oldAttachment;};
            case (handgunWeapon _unit): {_unit removeHandgunItem _oldAttachment;};
            default {_unit removeSecondaryWeaponItem _oldAttachment;};
        };
        _unit addItem _oldAttachment;
    }, [_unit, _weapon, _oldAttachment], 0.3] call CBA_fnc_waitAndExecute;
};

if (!_addNew) exitWith {};

[{
    params ["_unit", "_weapon", "_newAttachment"];
    _unit addWeaponItem [_weapon, _newAttachment];
    [[getText (configFile >> "CfgWeapons" >> _newAttachment >> "picture"), 4], true] call CBA_fnc_notify;
}, [_unit, _weapon, _newAttachment], 1] call CBA_fnc_waitAndExecute;
