#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 6000) then
{
	false execVM QUOTE(PATHTOF(functions\fnc_show_gun_list.sqf));
	true execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
	
	if (_this) then {
		(lbCurSel 6000) call FUNC(change_gun);
	};
} else
{
	false execVM QUOTE(PATHTOF(functions\fnc_show_main_page.sqf));
	true execVM QUOTE(PATHTOF(functions\fnc_show_gun_list.sqf));
	
	ctrlSetFocus (_dsp displayCtrl 6002);

	lbSetCurSel [6000, (GVAR(ATragMX_currentGun) select GVAR(ATragMX_currentTarget))];
};
