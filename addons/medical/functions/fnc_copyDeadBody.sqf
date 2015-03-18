/*
 * Author: Glowbal
 * Makes a copy of a dead body. For handling dead bodies for actions such as load and carry.
 *
 * Arguments:
 * 0: The oldbody <OBJECT>
 * 1: The caller <OBJECT>
 *
 * Return Value:
 * OBJECT Returns the copy of the unit. If no copy could be made, returns the oldBody
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_oldBody","_newUnit","_class","_group","_position","_side","_allVariables"];
_oldBody = _this select 0;
_caller = _this select 1;

if (alive _oldBody) exitwith {_oldBody}; // we only want to do this for dead bodies

_name = _oldBody getvariable ["ACE_name", "unknown"];
_class = typeof _oldBody;
_side = side _caller;
_group = createGroup _side;
_position = getPos _oldBody;

_newUnit = _group createUnit [typeof _oldBody, _position, [], 0, "NONE"];

_allVariables = [_oldBody] call EFUNC(common,getAllDefinedSetVariables);
//  [NAME (STRING), TYPENAME (STRING), VALUE (ANY), DEFAULT GLOBAL (BOOLEAN)]
{
    [_newUnit,_x select 0, _x select 2] call EFUNC(common,setDefinedVariable);
}foreach _allVariables;

_allVars = allVariables _oldBody;
_public = !(local _oldBody);
{
    _newUnit setvariable [_x, (_oldBody getvariable _x), false];
}foreach _allVars;

// find the remaining variables?
if !(_public) then {
    // exec on server?
} else {
    // Exec on client
};

_newUnit setVariable ["ACE_name", _name, true];

_newUnit disableAI "TARGET";
_newUnit disableAI "AUTOTARGET";
_newUnit disableAI "MOVE";
_newUnit disableAI "ANIM";
_newUnit disableAI "FSM";
_newUnit setvariable ["ACE_isDead", true, true];

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

// TODO sometimes the old body does not get cleaned up properly.
// TODO Maybe it is better to hide the body, attach it as well, and remove the copy once we are done with it instead?
deleteVehicle _oldBody;

_newUnit setDamage 0.89;

_newUnit;
