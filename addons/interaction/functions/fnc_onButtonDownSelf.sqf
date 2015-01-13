// by commy2
#include "script_component.hpp"

if (dialog) exitWith {
	closeDialog 0;
};

if (isNull (findDisplay 1713999)) then {
	"" call FUNC(openMenuSelf);
	setMousePosition [0.5, 0.5];
} else {
	(findDisplay 1713999) closeDisplay 1;
};

[_player, "interactionMenuOpened", [_player, GVAR(Target), 1]] call EFUNC(common,callCustomEventHandlers);
