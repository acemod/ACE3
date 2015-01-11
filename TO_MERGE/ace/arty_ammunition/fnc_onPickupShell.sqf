//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_curShell", "_pos"];
TRACE_1("", _this);
PARAMS_1(_targetShell);

// are we already carrying a shell? if so, drop it first and re-assign
_curShell = player getVariable "ACE_ARTY_CARRY_SHELL";
if (!isNil "_curShell") then {
	[_curShell] call FUNC(dropShell);
};

//player playMove "AinvPknlMstpSlayWrflDnon_medic";
//sleep 3;

// take ownership of it, and give it to ourselves
_targetShell setVariable ["ACE_ARTY_OWNER", player, true];
player setVariable ["ACE_ARTY_CARRY_SHELL", _targetShell, false];
_targetShell attachTo [player, [0,0.25,1.15]];

// force player down weapon
player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";
player selectWeapon (primaryWeapon player);