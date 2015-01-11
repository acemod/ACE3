//#define DEBUG_MODE_FULL
#include "script_component.hpp"
/*
private["_shell", "_prepArray"];
PARAMS_1(_gun);

_shell = player getVariable "ACE_ARTY_CARRY_SHELL";
_prepArray = _shell getVariable "ACE_ARTY_PREP";

// Drop carried shell
player setVariable ["ACE_ARTY_CARRY_SHELL", nil, false];
detach _shell;
["","","",["stop",player getVariable "ace_sys_cargo_carried_object"]] call ace_sys_cargo_fnc_carry; TRACE_1("Dropped shell from player into gun","");
deleteVehicle _shell;

_gun setVariable ["ace_sys_arty_currentRound", _prepArray, true];

// Call GlobalEvent
[QGVAR(reload), [_gun]] call CBA_fnc_globalEvent;

*/
// Why is this function so complicated, a simple reload and addmagazine should do?
// Because it needs to be. This function delegates loading to whoever is local to the gun
// and if no one is local to the gun then we handle the loading on our client. The reason it
// is handled this way is to prevent network data race conditions with the round data, on the
// M119 the gunner is waiting for the round info to populate before he loads the round.

private["_shell", "_prepArray"];
PARAMS_1(_gun);

// remove the shell from the person and save its variables
_shell = player getVariable "ACE_ARTY_CARRY_SHELL";
_prepArray = _shell getVariable "ACE_ARTY_PREP";

TRACE_2("START LOAD",_shell,_prepArray);

// we now have roundtype, charge and fuze in the preparray and we are ready to give it to the gun
// play the action, give the "working" hint, and then laod it

//PARAMS_3(_gun,_prepArray,_shell);
if (count (magazines _gun) == 0) then {
	// remove it from player so he is not carrying anymore
	player setVariable ["ACE_ARTY_CARRY_SHELL", nil, false];
	_shellType = typeOf _shell;
	detach _shell;
	["","","",["stop",player getVariable "ace_sys_cargo_carried_object"]] call ace_sys_cargo_fnc_carry; 
	TRACE_1("Dropped shell from player into gun","");
	deleteVehicle _shell;

	TRACE_2("Setting ace_sys_arty_currentRound on gun", _gun, _prepArray);
	_gun setVariable ["ace_sys_arty_currentRound", _prepArray, true];
	[_shellType, _gun, _prepArray] spawn {
	PARAMS_3(_shellType,_gun,_prepArray);
		_uniqueNumber = _prepArray select 2;
		waitUntil {
			_exit = false;
			_roundList = _gun getVariable ["ace_sys_arty_roundData", []]; TRACE_1("Roundlist",_roundList);
			{
				_firedShell = _x;
				if ((_firedShell select 3) == _uniqueNumber) then {
					_exit = true;
					TRACE_1("FiredShell == UniqueNumber","");
				};
			} forEach _roundList;
			/*
				This checks to make sure that two rounds were not loaded at once.
				If you have entered this loop it is assumed you have loaded a round,
				and the check below checks to make sure that the currently loaded
				round is the same round (via the unique number) that you loaded. If its
				been fired, then the check above this comment will see it in the list of
				fired rounds. If its not in the fired rounds, and the unique id of the
				loaded round is not the same as the one you are checking for then that
				means that two rounds were loaded at once and we should unload our round
				so we do not lose it. This happens very very rarely, but its a good case
				to handle.
			*/
			if (!_exit) then {
				TRACE_1("FiredShell =! UniqueNumber","");
				_currentRound = _gun getVariable ["ace_sys_arty_currentRound", []];
				if ((count _currentRound) != 0) then {
					if ((_currentRound select 2) != _uniqueNumber) then {
						_exit = true;
						_shell = _shellType createVehicle (getPos _gun);
						_shell setVariable ["ACE_ARTY_PREP", _prepArray, true];
						{
							(group _x) reveal _shell;
						} forEach playableUnits;
						(group player) reveal _shell;
					};
				} else {
					_exit = true;
				};
			};
			sleep 0.25;
			_exit
		};
	};
	
	// TODO: does the gun have a gunner? if it doesnt, then *we* add the magazine
	if (isNull (gunner _gun)) then {
		_mag = _prepArray select 0;
		_weapon = (weapons _gun) select 0;                                                                                                                                       // remove, re-add, select, reload the weapon so that it's reloaded
		_gun removeWeapon _weapon;
		_gun addMagazine _mag;                                                                                                                                                           // load Magazine
		_gun addWeapon _weapon;
		_gun selectWeapon _weapon;
		reload _gun;
		
		// Send Event to Server to create a monitoring trigger if FOR is enabled for M224
		// Create trigger for the other mortars on init (send the event immediately)
		// On disassemble or destroy, remove trigger
		// / Trigger checks wether gun is loaded and FOR is enabled or autoenabled
		// / Then call a FUNC to make the AI fire
		// / Add failsafe, if AI is not there create a new one
	};
} else {
	hintSilent "Gun is already loaded!"; // TODO: Fix this !
};