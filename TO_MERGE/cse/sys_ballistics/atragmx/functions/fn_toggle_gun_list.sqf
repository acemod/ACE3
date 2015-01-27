#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "cse_ab_ATragMX_Display")

if (ctrlVisible 6000) then
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_gun_list.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";

	if (_this) then {
		(lbCurSel 6000) call cse_ab_ATragMX_fnc_change_gun;
	};
} else
{
	false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";
	true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_gun_list.sqf";

	ctrlSetFocus (_dsp displayCtrl 6002);

	lbSetCurSel [6000, (cse_ab_ATragMX_currentGun select cse_ab_ATragMX_currentTarget)];
};
