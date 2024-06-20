// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(minDistance) = 10;
GVAR(holdKeyHandler) = -1;
GVAR(isShowGameTime) = false;
GVAR(isKeyDownAzimuth) = false;
GVAR(isKeyDownDistance) = false;
GVAR(isKeyDownDistance2) = false;
GVAR(keyDownTimeAzimuth) = -1;
GVAR(keyDownTimeDistance) = -1;
GVAR(keyDownTimeDistance2) = -1;
GVAR(useMil) = false;
GVAR(useFeet) = false;
GVAR(modeReticle) = 0;
GVAR(illuminate) = false;

ACE_player addEventHandler [
  "OpticsSwitch",
  { 
    params ["_unit", "_isADS"];
	if !(currentWeapon ACE_player isKindOf ["ACE_Vector", configFile >> "CfgWeapons"] && _isADS) then {
		GVAR(isShowGameTime) = false;
        ["time"] call FUNC(clearDisplay);
        ["strobe"] call FUNC(clearDisplay);
	} else {
		[missionNamespace, "StrobeChanged", []] call BIS_fnc_callScriptedEventHandler;
		if (!GVAR(isShowGameTime)) then {
			GVAR(isShowGameTime) = true;
			call FUNC(showGameTime);
			0 spawn {
				waitUntil {
					_until = diag_tickTime + 1;
					waitUntil {
						sleep 0.1;
						diag_tickTime > _until;
					};

					if (!GVAR(isShowGameTime)) then {
						["time"] call FUNC(clearDisplay);
						true;
					} else {
						call FUNC(showGameTime);
						false;
					}
				};
			};
		}
    }
}];

[missionNamespace, "StrobeChanged", { call FUNC(showStrobe) }] call BIS_fnc_addScriptedEventHandler;

#include "initKeybinds.inc.sqf"
