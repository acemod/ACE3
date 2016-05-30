/*
 * Author: voiper
 * Combine a chemlight shield item and a chemlight item into a new lit item.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Chemlight type <STRING>
 * 2: Chemlight shield type <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [_player, "Chemlight_Green", "ACE_Chemlight_Shield_Green"] call ace_flashlights_fnc_combineShield;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_unit", "_args"];
_args params ["_chemlight", "_shieldClass"];

private _displayName = getText (configFile >> "CfgWeapons" >> _shieldClass >> "displayName");

if ("ACE_Chemlight_Shield" in backpackItems _unit) then {
    _unit addItemToUniform _shieldClass;
} else {
    if ("ACE_Chemlight_Shield" in vestItems _unit) then {
        _unit addItemToVest _shieldClass;
    } else {
        _unit addWeapon _shieldClass;
    };
};

_unit removeItem _chemlight;
_unit removeItem "ACE_Chemlight_Shield";

_text = format ["%1 Prepared", _displayName];

[_text] call EFUNC(common,displayTextStructured);
playSound3D [QUOTE(PATHTO_R(sounds\chemlight_prepare.wav)), objNull, false, (eyePos ACE_player), 1, 1, 65];