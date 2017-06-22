/*
 * Author: Ruthberg
 * Creates the ATragMX dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_create_dialog
 *
 * Public: No
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "ATragMX_Display")
#define __ctrlBackground (__dsp displayCtrl 720000)

// Do all initialisation now
if (!GVAR(initialised)) then {
    [] call FUNC(initGunList);
    [] call FUNC(init);
    [] call FUNC(restore_user_data);
    [] call FUNC(read_gun_list_entries_from_config);
    GVAR(initialised) = true;
    TRACE_1("",GVAR(initialised));
};

if (GVAR(active)) exitWith { false };
if (underwater ACE_player) exitWith { false };
if (!("ACE_ATragMX" in (uniformItems ACE_player)) && !("ACE_ATragMX" in (vestItems ACE_player))) exitWith { false };

createDialog 'ATragMX_Display';

call FUNC(update_target_selection);

GVAR(showMainPage) call FUNC(show_main_page);

GVAR(showAddNewGun) call FUNC(show_add_new_gun);
GVAR(showAtmoEnvData) call FUNC(show_atmo_env_data);
GVAR(showC1BallisticCoefficientData) call FUNC(show_c1_ballistic_coefficient_data);
GVAR(showGunAmmoData) call FUNC(show_gun_ammo_data);
GVAR(showGunList) call FUNC(show_gun_list);
GVAR(showMuzzleVelocityData) call FUNC(show_muzzle_velocity_data);
GVAR(showRangeCard) call FUNC(show_range_card);
if (GVAR(showRangeCard)) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 5001);
    [] call FUNC(update_range_card);
};
GVAR(showRangeCardSetup) call FUNC(show_range_card_setup);
GVAR(showSolutionSetup) call FUNC(show_solution_setup);
GVAR(showTargetData) call FUNC(show_target_data);
GVAR(showTargetRangeAssist) call FUNC(show_target_range_assist);
GVAR(showTargetSpeedAssist) call FUNC(show_target_speed_assist);
GVAR(showTargetSpeedAssistTimer) call FUNC(show_target_speed_assist_timer);
GVAR(showTruingDrop) call FUNC(show_truing_drop);

[GVAR(currentGun), false, true] call FUNC(change_gun);

{
    lbAdd [6000, _x select 0];
} forEach GVAR(gunList);

ctrlShow [3001, false];
ctrlShow [3002, false];

{
    (__dsp displayCtrl _x) ctrlEnable false;
} forEach [18006, 18007, 18008];

GVAR(active) = true;

GVAR(DialogPFH) = [{
    if (!GVAR(active)) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
    __ctrlBackground ctrlSetText format [QPATHTOF(UI\ATRAG_%1.paa), ["N", "D"] select (call EFUNC(common,ambientBrightness))];
}, 60, []] call CBA_fnc_addPerFrameHandler;

true
