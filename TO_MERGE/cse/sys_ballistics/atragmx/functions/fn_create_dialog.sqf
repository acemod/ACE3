#include "script_component.hpp"

if (underwater player) exitWith { false };
if (!([player, "cse_ab_ATragMX"] call cse_fnc_hasItem_CC)) exitWith { false };

execVM "cse\cse_sys_ballistics\atragmx\functions\fn_update_target_selection.sqf";

createDialog 'cse_ab_ATragMX_Display';

true execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_main_page.sqf";

false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_add_new_gun.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_gun_list.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_range_card_setup.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_range_assist.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist.sqf";
false execVM "cse\cse_sys_ballistics\atragmx\functions\fn_show_target_speed_assist_timer.sqf";

{
	lbAdd [6000, _x select 0];
} forEach cse_ab_ATragMX_gunList;

true
