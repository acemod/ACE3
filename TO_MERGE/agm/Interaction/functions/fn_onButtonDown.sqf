// by commy2

if (dialog) exitWith {
	closeDialog 0;
};

if (isNull (findDisplay 1713999)) then {
	if (AGM_player == vehicle AGM_player) then {"" call AGM_Interaction_fnc_openMenu} else {[AGM_player, vehicle AGM_player] call AGM_Interaction_fnc_openMenuSelectUI};
	setMousePosition [0.5, 0.5];
} else {
	(findDisplay 1713999) closeDisplay 1;
};

[_player, "interactionMenuOpened", [_player, AGM_Interaction_Target, 0]] call AGM_Core_fnc_callCustomEventHandlers;
