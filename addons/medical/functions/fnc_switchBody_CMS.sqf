/**
 * fn_switchBody_CMS.sqf
 * @Descr: DEPCRECATED
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_oldBody","_newUnit","_class","_group","_position","_side","_allVariables"];
_oldBody = _this select 0;
_caller = _this select 1;

if (alive _oldBody) exitwith {};
_name = _oldBody getvariable [QEGVAR(common,name),"unknown"];
_class = typeof _oldBody;
_side = side _caller;
_group = createGroup _side;
_position = getPos _oldBody;

//_group = (group _oldBody);
//_newUnit = _group createUnit [_class, _position, [], 3, "FORM"];
_newUnit = _group createUnit [typeof _oldBody, _position, [], 0, "NONE"];

_allVariables = [_oldBody] call EFUNC(common,getAllDefinedSetVariables);
//  [NAME (STRING), TYPENAME (STRING), VALUE (ANY), DEFAULT GLOBAL (BOOLEAN)]
{
	[_newUnit,_x select 0, _x select 2] call EFUNC(common,setDefinedVariable);
}foreach _allVariables;
_newUnit setVariable [QEGVAR(common,name),_name,true];

_newUnit disableAI "TARGET";
_newUnit disableAI "AUTOTARGET";
_newUnit disableAI "MOVE";
_newUnit disableAI "ANIM";
_newUnit disableAI "FSM";
_newUnit setvariable [QEGVAR(common,isDead),true,true];

_newUnit setvariable [QGVAR(heartRate), 0];
_newUnit setvariable [QGVAR(bloodPressure), [0,0]];

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
[_newUnit,([_newUnit] call EFUNC(common,getDeathAnim))] call EFUNC(common,broadcastAnim);

if (GVAR(INTERACTION_TARGET) == _oldBody) then {
	GVAR(INTERACTION_TARGET) = _newUnit;
};

deleteVehicle _oldBody;
_newUnit