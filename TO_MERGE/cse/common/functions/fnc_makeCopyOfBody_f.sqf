/**
 * fn_makeCopyOfBody_f.sqf
 * @Descr: Makes a copy of a dead body. For handling dead bodies for actions such as load and carry.
 * @Author: Glowbal
 *
 * @Arguments: [oldBody OBJECT, caller OBJECT]
 * @Return: newUnit OBJECT Returns the copy of the unit. If no copy could be made, returns the oldBody
 * @PublicAPI: false
 */

private ["_oldBody","_newUnit","_class","_group","_position","_side","_allVariables"];
_oldBody = _this select 0;
_caller = _this select 1;

	if (alive _oldBody) exitwith {_oldBody}; // we only want to do this for dead bodies
	_name = _oldBody getvariable [QGVAR(name),"unknown"];
	_class = typeof _oldBody;
	_side = side _caller;
	_group = createGroup _side;
	_position = getPos _oldBody;

	_newUnit = _group createUnit [typeof _oldBody, _position, [], 0, "NONE"];

	_allVariables = [_oldBody] call FUNC(getAllDefinedSetVariables);
	//  [NAME (STRING), TYPENAME (STRING), VALUE (ANY), DEFAULT GLOBAL (BOOLEAN)]
	{
		[_newUnit,_x select 0, _x select 2] call FUNC(setDefinedVariable);
	}foreach _allVariables;
	_newUnit setVariable [QGVAR(name),_name,true];

	_newUnit disableAI "TARGET";
	_newUnit disableAI "AUTOTARGET";
	_newUnit disableAI "MOVE";
	_newUnit disableAI "ANIM";
	_newUnit disableAI "FSM";
	_newUnit setvariable [QGVAR(isDead),true,true];

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
	//_newUnit playMoveNow ([_newUnit] call FUNC(getDeathAnim));

	deleteVehicle _oldBody;

	// TODO sometimes the old body does not get cleaned up properly. Look into garbage collection.

	_newUnit setDamage 0.9;
_newUnit