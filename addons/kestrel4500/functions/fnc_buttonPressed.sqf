/*
 * Author: Ruthberg
 * Handles the Kestrel 4500 dialog button actions
 *
 * Arguments:
 * buttonID <integer>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * 2 call ace_kestrel4500_fnc_buttonPressed
 *
 * Public: No
 */
#include "script_component.hpp"

switch (_this) do {
	case 0: { // Enter
		if (!GVAR(Kestrel4500_MinAvgMAx) && (GVAR(Kestrel4500_Menu) == 2 || GVAR(Kestrel4500_Menu) == 3)) then {
			Kestrel4500_RefHeading = getDir ACE_player;
		};
		if (GVAR(Kestrel4500_MinAvgMAx) && GVAR(Kestrel4500_Menu) > 0 && GVAR(Kestrel4500_Menu) < 4) then {
			if (GVAR(Kestrel4500_MinAvgMAxMode) != 1) then {
				{
					GVAR(Kestrel4500_MIN) set [_x, 0];
					GVAR(Kestrel4500_MAX) set [_x, 0];
					GVAR(Kestrel4500_TOTAL) set [_x, 0];
					GVAR(Kestrel4500_ENTRIES) set [_x, 0];
				} forEach [1, 2, 3];
			};
			GVAR(Kestrel4500_MinAvgMaxMode = (GVAR(Kestrel4500_MinAvgMaxMode + 1) % 3;
		};
	};
	case 1: { // Top
		GVAR(Kestrel4500_Menu) = (GVAR(Kestrel4500_Menu) - 1 + (count GVAR(Kestrel4500_Menu)s)) % (count GVAR(Kestrel4500_Menu)s);
	};
	case 2: { // Bottom
		GVAR(Kestrel4500_Menu) = (GVAR(Kestrel4500_Menu) + 1 + (count GVAR(Kestrel4500_Menu)s)) % (count GVAR(Kestrel4500_Menu)s);
	};
	case 3: { // Left
		GVAR(Kestrel4500_MinAvgMaxMode) = !GVAR(Kestrel4500_MinAvgMaxMode);
	};
	case 4: { // Right
		GVAR(Kestrel4500_MinAvgMaxMode) = !GVAR(Kestrel4500_MinAvgMaxMode);
	};
	case 5: { // Memory
	};
	case 6: { // Backlight
	};
};

[] call FUNC(updateDisplay);
