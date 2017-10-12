#include "script_component.hpp"

if (isServer) then {
	[QGVAR(addObjectToServer), {
		params["_object"];
		_object setOwner 2;
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(addCSWAmmo), {
	params["_object", "_weapon", "_ammo"];
	if (local _object) then {
		_object setAmmo[_weapon, _ammo];
	}
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(cswTripod) = objNull;

// Cancel movement if interact menu is open
["ace_interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel movement on player changed
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;

// Handle falling uncon
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;