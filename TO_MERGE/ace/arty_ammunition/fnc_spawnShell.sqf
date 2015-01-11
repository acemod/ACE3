//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define __CTRL_PREP (uiNamespace getVariable "ace_arty_ammoprep_Display") displayCtrl 31337
#define __roundData configFile >> "CfgMagazines" >> _roundClass

_this spawn {
	private ["_shell", "_shells", "_finalPos", "_distGood", "_dis"];
	PARAMS_4(_pos,_roundClass,_charge,_fuzeTime);
	
	GVAR(fuzeTime) = _fuzeTime;
	
	_magazineFormat = getText(__roundData >> "ACE_ARTY_MAGAZINE_FORMAT");
	_magazineClass = format[_magazineFormat, GVAR(currentFuze), _charge];
	_vehicleClass = getText(__roundData >> "ACE_ARTY_SHELL_VEHICLE");
	
	[1,[localize "STR_ACE_ARTY_PREP_PROGRESS"],true,true] spawn ace_progressbar;
	
	if !(GVAR(currentAmmoCrate) isKindOf "ACE_Arty_ShellHolder") then {
		// TODO: Player animation
		
		[GVAR(currentAmmoCrate), _roundClass, 1] call ACE_fnc_removemagazinecargo; // Fancy remove magazines from box, yay
		sleep 0.2;
		
		_cargoArray = getMagazineCargo GVAR(currentAmmoCrate);
		_selIndex = 0;
		lbClear ROUNDS_LISTBOX_ID;
		{
			_mag = _x;
			_isRound = [_mag, "ace_arty_howitzer_default", "CfgMagazines"] call FUNC(isKindOf);
			TRACE_2("", _mag,_isRound);
			if (_isRound) then {
				_count = (_cargoArray select 1) select _forEachIndex;
				_displayName = getText (configFile >> "CfgMagazines" >> _mag >> "displayName");
				_index = lbAdd [ROUNDS_LISTBOX_ID, format["%1 -- %2", _count, _displayName]];
				TRACE_2("",_count,_displayName);
				lbSetData [ROUNDS_LISTBOX_ID, _index, _mag];
				if (_roundClass == _mag) then {
					_selIndex = _index;
				};
			};
		} forEach (_cargoArray select 0);
		lbSetCurSel [ROUNDS_LISTBOX_ID, _selIndex];

		// this spawns the rounds directly ontop of eaachother. handle collision?
		_shells = (player modelToWorld [0,-1,0]) nearObjects ["ACE_Arty_ShellHolder",5];
		_finalPos = player modelToWorld [0,-1,0];
		_distGood = false;
		_dis = 0.1;
		while { !_distGood } do {
			_distGood = true;
			{
				TRACE_1("dist", (_finalPos distance _x));
				if (_finalPos distance _x < 0.5) exitWith {
					_distGood = false;
				};
			} forEach _shells;
			_finalPos = [_finalPos select 0, (_finalPos select 1) + (_dis * GVAR(shellSpawnDir)), _finalPos select 2];
		};
		GVAR(shellSpawnDir) = GVAR(shellSpawnDir) * -1;
		_shell = _vehicleClass createVehicle _finalPos;
		_shell setPos _finalPos;
		_shell setVariable [QGVAR(belongsToBox),GVAR(currentAmmoCrate),true];
		

		{
			(group _x) reveal _shell;
		} forEach playableUnits;
		(group player) reveal _shell; // reveal it after its positioned correctly.
		
		__CTRL_PREP ctrlShow true; __CTRL_PREP ctrlCommit 0;
	} else {
		sleep 1;
		__CTRL_PREP ctrlShow true; __CTRL_PREP ctrlCommit 0;
		closeDialog 0;
		_shell = GVAR(currentAmmoCrate);
	};

	_shell setVariable ["ACE_ARTY_PREP",[_magazineClass,[_fuzeTime],abs(random 10000),_charge,GVAR(currentFuze)], true];
	
	_confirm_data = _shell getVariable "ACE_ARTY_PREP";
	TRACE_1("",_confirm_data);
	// Check if there is ammo left that fits the scheme
	_cargoArray = getMagazineCargo GVAR(currentAmmoCrate);
	_isRound = false;
	{
		_isRound = [_x, "ace_arty_howitzer_default", "CfgMagazines"] call FUNC(isKindOf);
		if (_isRound) exitWith {};
	} foreach (_cargoArray select 0);
	if (!_isRound) then {
		__CTRL_PREP ctrlShow false; __CTRL_PREP ctrlCommit 0;
	};	
	_shell call FUNC(AddModelIncrements); // Animate Mortarshell if increments added
};
