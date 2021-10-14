#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror, drofseh
 * Cool a weapon with an item and consume the item being used to cool it.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, ACE_player, "ACE_WaterBottle"] call ace_overheating_fnc_coolWeaponWithItem
 *
 * Public: No
 */

params ["_target", "_unit", "_item"];

private _config = configFile >> "CfgWeapons" >> _item;

// Get values
private _weapon = currentWeapon _target;
private _tempVarName = format [QGVAR(%1_temp), _weapon];
private _temperature = _target getVariable [_tempVarName, 0];
private _replacementItem = getText (_config >> "acex_field_rations_replacementItem");
private _liquidAmount = getNumber (_config >> "acex_field_rations_thirstQuenched");
private _consumeText = format [LLSTRING(CoolingWeaponWithItem), getText (configFile >> "CfgWeapons" >> _weapon >> "displayName"), getText (_config >> "displayName")];

/* // to be added when licence compatible audio can be found or recorded
private _pouringSound = QPATHTO_R(sounds\sizzling_short.ogg);

if (_temperature < 100) then {
    if (_liquidAmount > 5) then {
        _pouringSound = QPATHTO_R(sounds\pouring_long.ogg);
    } else {
        _pouringSound = QPATHTO_R(sounds\pouring_short.ogg);
    };
} else {
    if (_liquidAmount > 5) then {
        _pouringSound = QPATHTO_R(sounds\sizzling_long.ogg);
    };
};

playSound3D [_pouringSound, _target, false, AGLToASL (_target modelToWorld (_target selectionPosition "RightHand")), 5, 1, 10];
*/

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_target", "_unit", "_item", "_weapon", "_tempVarName", "_temperature", "_replacementItem", "_liquidAmount"];
    TRACE_1("Cool weapon with item successful",_args);

    // remove the item
    _unit removeItem _item;

    // Add replacement item if needed
    if (_replacementItem != "") then {
        [_unit, _replacementItem] call EFUNC(common,addToInventory);
    };

    // cool the weapon
    private _barrelMass = _weapon call FUNC(getBarrelMass);
    _temperature = [_temperature, _barrelMass, _liquidAmount * 10] call FUNC(calculateCooling);
    [_target, _tempVarName, _temperature, TEMP_TOLERANCE] call EFUNC(common,setApproximateVariablePublic);
};

/*
private _fnc_onFailure = {
    params ["_args","_elapsedTime"];
    _args params ["_target", "_unit"];
};
*/

private _fnc_condition = {
    params ["_args"];
    _args params ["", "_unit", "_item"];
    _item in (_unit call EFUNC(common,uniqueItems))
};

[
    _liquidAmount,
    [
        _target,
        _unit,
        _item,
        _weapon,
        _tempVarName,
        _temperature,
        _replacementItem,
        _liquidAmount
    ],
    _fnc_onSuccess,
    {}, //_fnc_onFailure,
    _consumeText,
    _fnc_condition
] call EFUNC(common,progressBar);