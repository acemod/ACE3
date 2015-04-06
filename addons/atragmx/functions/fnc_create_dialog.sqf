#include "script_component.hpp"

systemChat "create_dialog";

if (dialog) exitWith { false };
if (underwater ACE_player) exitWith { false };
if (!("ACE_ATragMX" in (uniformItems ACE_player)) && !("ACE_ATragMX" in (vestItems ACE_player))) exitWith { false };

execVM "\atragmx\fnc_update_target_selection.sqf";

createDialog 'ATragMX_Display';

true execVM "\atragmx\fnc_show_main_page.sqf";

false execVM "\atragmx\fnc_show_add_new_gun.sqf";
false execVM "\atragmx\fnc_show_gun_list.sqf";
false execVM "\atragmx\fnc_show_range_card.sqf";
false execVM "\atragmx\fnc_show_range_card_setup.sqf";
false execVM "\atragmx\fnc_show_target_range_assist.sqf";
false execVM "\atragmx\fnc_show_target_speed_assist.sqf";
false execVM "\atragmx\fnc_show_target_speed_assist_timer.sqf";

{
	lbAdd [6000, _x select 0];
} forEach GVAR(ATragMX_gunList);

true
