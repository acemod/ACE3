// by commy2

if (dialog) exitWith {
	closeDialog 0;
};

if (isNull (findDisplay 1713999)) then {
	"" call AGM_Interaction_fnc_openMenuSelf;
	setMousePosition [0.5, 0.5];
} else {
	(findDisplay 1713999) closeDisplay 1;
};

[_player, "interactionMenuOpened", [_player, AGM_Interaction_Target, 1]] call AGM_Core_fnc_callCustomEventHandlers;
