#include "script_component.hpp"

//if (dialog) exitWith { false };
if (underwater ACE_player) exitWith { false };
if (!("ACE_ATragMX" in (uniformItems ACE_player)) && !("ACE_ATragMX" in (vestItems ACE_player))) exitWith { false };

createDialog 'ATragMX_Display';

call FUNC(update_target_selection);

true call FUNC(show_main_page);

false call FUNC(show_add_new_gun);
false call FUNC(show_gun_list);
false call FUNC(show_range_card);
false call FUNC(show_range_card_setup);
false call FUNC(show_target_range_assist);
false call FUNC(show_target_speed_assist);
false call FUNC(show_target_speed_assist_timer);

{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

true
