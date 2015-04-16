/*
 * Author: Ruthberg
 * Creates the ATragMX dialog
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_create_dialog
 *
 * Public: No
 */
#include "script_component.hpp"

//if (dialog) exitWith { false };
if (underwater ACE_player) exitWith { false };
if (!("ACE_ATragMX" in (uniformItems ACE_player)) && !("ACE_ATragMX" in (vestItems ACE_player))) exitWith { false };

createDialog 'ATragMX_Display';

call FUNC(update_target_selection);

GVAR(showMainPage) call FUNC(show_main_page);

GVAR(showAddNewGun) call FUNC(show_add_new_gun);
GVAR(showGunList) call FUNC(show_gun_list);
GVAR(showRangeCard) call FUNC(show_range_card);
if (GVAR(showRangeCard)) then {
    ctrlSetFocus (_dsp displayCtrl 5001);
    [] call FUNC(update_range_card);
};
GVAR(showRangeCardSetup) call FUNC(show_range_card_setup);
GVAR(showTargetRangeAssist) call FUNC(show_target_range_assist);
GVAR(showTargetSpeedAssist) call FUNC(show_target_speed_assist);
GVAR(showTargetSpeedAssistTimer) call FUNC(show_target_speed_assist_timer);

{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

true
