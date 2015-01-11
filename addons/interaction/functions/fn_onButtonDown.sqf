// by commy2
#include "script_component.hpp"

if (dialog) exitWith {
	closeDialog 0;
};

if (isNull (findDisplay 1713999)) then {
	if (AGM_player == vehicle AGM_player) then {"" call FUNC(openMenu)} else {[AGM_player, vehicle AGM_player] call FUNC(openMenuSelectUI)};
	setMousePosition [0.5, 0.5];
} else {
	(findDisplay 1713999) closeDisplay 1;
};

[_player, "interactionMenuOpened", [_player, GVAR(Target), 0]] call EFUNC(core,callCustomEventHandlers);
