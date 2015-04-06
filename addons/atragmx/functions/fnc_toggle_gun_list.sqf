#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 6000) then
{
	false execVM "\atragmx\fnc_show_gun_list.sqf";
	true execVM "\atragmx\fnc_show_main_page.sqf";
	
	if (_this) then {
		(lbCurSel 6000) call compile preprocessFile ("\atragmx\fnc_change_gun.sqf");
	};
} else
{
	false execVM "\atragmx\fnc_show_main_page.sqf";
	true execVM "\atragmx\fnc_show_gun_list.sqf";
	
	ctrlSetFocus (_dsp displayCtrl 6002);

	lbSetCurSel [6000, (GVAR(ATragMX_currentGun) select GVAR(ATragMX_currentTarget))];
};
