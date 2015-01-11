//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define __CTRL_PREP (uiNamespace getVariable "ace_arty_ammoprep_Display") displayCtrl 31337
__CTRL_PREP ctrlShow false; __CTRL_PREP ctrlCommit 0;

private "_fuzeTime";

_ok = true;
_fuzeTime = 0;
if (GVAR(currentFuze) == "time") then {
	_fuzeTimeTxt = ctrlText 12560;
	_fuzeTime = parseNumber _fuzeTimeTxt;

	if (_fuzeTime == 0) then {
		hintSilent "Fuze time must be a number greater than 0!";
		_ok = false;
	};
};
if (!_ok) exitWith {
	false
};

// now do the spawn
// this function doesnt return a shell anymore
[position player, GVAR(currentRoundType), GVAR(currentCharge), _fuzeTime] call FUNC(spawnShell);
