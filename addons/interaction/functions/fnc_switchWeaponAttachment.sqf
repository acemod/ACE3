#include "..\script_component.hpp"
/*
 * Author: mharis001, Dystopian
 * Switches weapon attachment.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Action params <ARRAY>
 * - 0: Weapon <STRING>
 * - 1: New Attachment <STRING>
 * - 2: Old Attachment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [currentWeapon player, "acc_flashlight", ""]] call ace_interaction_fnc_switchWeaponAttachment
 *
 * Public: No
 */

params ["", "_unit", "_actionParams"];
_actionParams params ["_weapon", "_newAttachment", "_oldAttachment"];
TRACE_3("Switching attachment",_weapon,_newAttachment,_oldAttachment);

private _currWeaponType = [_unit, _weapon] call EFUNC(common,getWeaponIndex);

if (_currWeaponType == -1) exitWith {};

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

[_unit, "Gear"] call EFUNC(common,doGesture);

if (_removeOld) then {
    [{
        params ["_unit", "_oldAttachment", "_currWeaponType"];

        switch (_currWeaponType) do {
            case 0: {_unit removePrimaryWeaponItem _oldAttachment};
            case 1: {_unit removeSecondaryWeaponItem _oldAttachment};
            case 2: {_unit removeHandgunItem _oldAttachment};
            default {};
        };

        _unit addItem _oldAttachment;
    }, [_unit, _oldAttachment, _currWeaponType], 0.3] call CBA_fnc_waitAndExecute;
};

if (!_addNew) exitWith {};

[{
    params ["_unit", "_newAttachment", "_weapon"];

    // Delete weapon from array, to be able to pass _this to EH
    _unit addWeaponItem [_weapon, _newAttachment];

    [[getText (configFile >> "CfgWeapons" >> _newAttachment >> "picture"), 4], true] call CBA_fnc_notify;

    if (_unit == ACE_player) then {
        playSound "click";
    };
}, [_unit, _newAttachment, _weapon], 1] call CBA_fnc_waitAndExecute;
