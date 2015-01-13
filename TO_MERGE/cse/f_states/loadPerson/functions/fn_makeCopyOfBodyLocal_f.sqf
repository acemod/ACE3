/**
 * fn_makeCopyOfBodyLocal_f.sqf
 * @Descr: Makes a copy of a dead body. For handling dead bodies for actions such as load and carry.
 * @Author: Glowbal
 *
 * @Arguments: [oldBody OBJECT, newUnit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */

private ["_oldBody","_newUnit","_class","_group","_position","_side","_allVariables"];
_oldBody = _this select 0;
_newUnit = _this select 1;

	if (alive _oldBody) exitwith {}; // we only want to do this for dead bodies
	_name = _oldBody getvariable ["cse_name","unknown"];
	_allVariables = [_oldBody] call cse_fnc_getAllSetVariables;
	//  [NAME (STRING), TYPENAME (STRING), VALUE (ANY), DEFAULT GLOBAL (BOOLEAN)]
	{
		[_newUnit,_x select 0, _x select 2] call cse_fnc_setVariable;
	}foreach _allVariables;
	_newUnit setVariable ["cse_name",_name,true];

	_newUnit disableAI "TARGET";
	_newUnit disableAI "AUTOTARGET";
	_newUnit disableAI "MOVE";
	_newUnit disableAI "ANIM";
	_newUnit disableAI "FSM";
	_newUnit setvariable ["cse_isDead",true,true];

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
	//[_newUnit,([_newUnit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;

	deleteVehicle _oldBody;