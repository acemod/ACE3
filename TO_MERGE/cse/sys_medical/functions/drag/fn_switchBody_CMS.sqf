/**
 * fn_switchBody_CMS.sqf
 * @Descr: DEPCRECATED
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_oldBody","_newUnit","_class","_group","_position","_side","_allVariables"];
_oldBody = _this select 0;
_caller = _this select 1;

	if (alive _oldBody) exitwith {};
	_name = _oldBody getvariable ["cse_name","unknown"];
	_class = typeof _oldBody;
	_side = side _caller;
	_group = createGroup _side;
	_position = getPos _oldBody;

	//_group = (group _oldBody);
	//_newUnit = _group createUnit [_class, _position, [], 3, "FORM"];
	_newUnit = _group createUnit [typeof _oldBody, _position, [], 0, "NONE"];



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

	_newUnit setvariable ["cse_heartRate", 0];
	_newUnit setvariable ["cse_bloodPressure", [0,0]];

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
	[_newUnit,([_newUnit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;

	if (CSE_SYS_MEDICAL_INTERACTION_TARGET == _oldBody) then {
		CSE_SYS_MEDICAL_INTERACTION_TARGET = _newUnit;
	};
//	[[_oldBody,_newUnit],_name,"cse_fnc_onBodySwtich_CMS",true,false] spawn BIS_fnc_MP;

	deleteVehicle _oldBody;
_newUnit