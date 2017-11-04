/*
 * Author: Glowbal
 * Makes a copy of a dead body. For handling dead bodies for actions such as load and carry.
 *
 * Arguments:
 * 0: The oldbody <OBJECT>
 * 1: The caller <OBJECT>
 *
 * Return Value:
 * Returns the copy of the unit. If no copy could be made, returns the oldBody <OBJECT>
 *
 * Example:
 * [bob, kevin] call ACE_medical_fnc_copyDeadBody
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_oldBody", "_caller"];

if (alive _oldBody) exitWith {_oldBody}; // we only want to do this for dead bodies

private _name = _oldBody getVariable ["ACE_name", "unknown"];
private _class = typeOf _oldBody;
private _side = side _caller;
private _group = createGroup _side;
private _position = getPos _oldBody;

private _newUnit = _group createUnit [typeOf _oldBody, _position, [], 0, "NONE"];
_newUnit setVariable ["ACE_name", _name, true];

_newUnit disableAI "TARGET";
_newUnit disableAI "AUTOTARGET";
_newUnit disableAI "MOVE";
_newUnit disableAI "ANIM";
_newUnit disableAI "FSM";

removeallweapons _newUnit;
removeallassigneditems _newUnit;
removeUniform _newUnit;
removeHeadgear _newUnit;
removeBackpack _newUnit;
removeVest _newUnit;

_newUnit addHeadgear (headgear _oldBody);
_newUnit addBackpack (backpack _oldBody);
clearItemCargoGlobal (backpackContainer _newUnit);
clearMagazineCargoGlobal (backpackContainer _newUnit);
clearWeaponCargoGlobal (backpackContainer _newUnit);

_newUnit addVest (vest _oldBody);
clearItemCargoGlobal (backpackContainer _newUnit);
clearMagazineCargoGlobal (backpackContainer _newUnit);
clearWeaponCargoGlobal (backpackContainer _newUnit);

_newUnit addUniform (uniform _oldBody);
clearItemCargoGlobal (backpackContainer _newUnit);
clearMagazineCargoGlobal (backpackContainer _newUnit);
clearWeaponCargoGlobal (backpackContainer _newUnit);

{_newUnit addMagazine _x} count (magazines _oldBody);
{_newUnit addWeapon _x} count (weapons _oldBody);
{_newUnit addItem _x} count (items _oldBody);

_newUnit selectWeapon (primaryWeapon _newUnit);

// We are attaching the old unit and hiding it, so we can keep the original unit until later.
_oldBody attachTo [_newUnit, [0,0,0]];
if (isMultiplayer) then {
    hideObjectGlobal _oldBody;
} else {
    hideObject _oldBody;
};

_newUnit setVariable [QGVAR(copyOfUnit), _oldBody, true];
_oldBody setVariable [QGVAR(hasCopy), _newUnit, true];
_newUnit setVariable ["ACE_isDead", true, true];
_newUnit setVariable ["ACE_isUnconscious", true, true];
_newUnit setVariable [QGVAR(disableInteraction), true, true];
_oldBody setVariable [QGVAR(disableInteraction), true, true];

[_newUnit, 0.89] call FUNC(setStructuralDamage);
_newUnit;
