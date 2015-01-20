#include "script_component.hpp"

switch (_this) do {
	case 0: { // Enter
		if (!cse_ab_Kestrel4500_MinAvgMax && (cse_ab_Kestrel4500_Menu == 2 || cse_ab_Kestrel4500_Menu == 3)) then {
			cse_ab_Kestrel4500_RefHeading = getDir player;
		};
		if (cse_ab_Kestrel4500_MinAvgMax && cse_ab_Kestrel4500_Menu > 0 && cse_ab_Kestrel4500_Menu < 4) then {
			if (cse_ab_Kestrel4500_MinAvgMaxMode != 1) then {
				{
					cse_ab_Kestrel4500_MIN set [_x, 0];
					cse_ab_Kestrel4500_MAX set [_x, 0];
					cse_ab_Kestrel4500_TOTAL set [_x, 0];
					cse_ab_Kestrel4500_ENTRIES set [_x, 0];
				} forEach [1, 2, 3];
			};
			cse_ab_Kestrel4500_MinAvgMaxMode = (cse_ab_Kestrel4500_MinAvgMaxMode + 1) % 3;
		};
	};
	case 1: { // Top
		cse_ab_Kestrel4500_Menu = (cse_ab_Kestrel4500_Menu - 1 + (count cse_ab_Kestrel4500_Menus)) % (count cse_ab_Kestrel4500_Menus);
	};
	case 2: { // Bottom
		cse_ab_Kestrel4500_Menu = (cse_ab_Kestrel4500_Menu + 1 + (count cse_ab_Kestrel4500_Menus)) % (count cse_ab_Kestrel4500_Menus);
	};
	case 3: { // Left
		cse_ab_Kestrel4500_MinAvgMAx = !cse_ab_Kestrel4500_MinAvgMAx;
	};
	case 4: { // Right
		cse_ab_Kestrel4500_MinAvgMAx = !cse_ab_Kestrel4500_MinAvgMAx;
	};
	case 5: { // Memory
	};
	case 6: { // Backlight
	};
};

_null = _this spawn cse_ab_Kestrel4500_fnc_update_display;

nil;