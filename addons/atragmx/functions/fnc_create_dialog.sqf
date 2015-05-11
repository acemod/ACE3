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

if (GVAR(active)) exitWith { false };
if (underwater ACE_player) exitWith { false };
if (!("ACE_ATragMX" in (uniformItems ACE_player)) && !("ACE_ATragMX" in (vestItems ACE_player))) exitWith { false };

createDialog 'ATragMX_Display';

call FUNC(update_target_selection);

GVAR(showMainPage) call FUNC(show_main_page);

GVAR(showAddNewGun) call FUNC(show_add_new_gun);
GVAR(showAtmoEnvData) call FUNC(show_atmo_env_data);
GVAR(showGunAmmoData) call FUNC(show_gun_ammo_data);
GVAR(showGunList) call FUNC(show_gun_list);
GVAR(showRangeCard) call FUNC(show_range_card);
if (GVAR(showRangeCard)) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 5001);
    [] call FUNC(update_range_card);
};
GVAR(showRangeCardSetup) call FUNC(show_range_card_setup);
GVAR(showSolutionSetup) call FUNC(show_solution_setup);
GVAR(showTargetData)  call FUNC(show_target_data);
GVAR(showTargetRangeAssist) call FUNC(show_target_range_assist);
GVAR(showTargetSpeedAssist) call FUNC(show_target_speed_assist);
GVAR(showTargetSpeedAssistTimer) call FUNC(show_target_speed_assist_timer);

[GVAR(currentGun), false, true] call FUNC(change_gun);

{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

GVAR(active) = true;

true
