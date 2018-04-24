/*
 * Author: Ruthberg
 * Evalutes input from the option menu
 *
 * Arguments:
 * option menu id <number>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_evaluate_option_menu_input
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_optionID"];

switch (_optionID) do {
    case 0: {};                                                     // Accuracy 1st
    case 1: { 0 call FUNC(toggle_muzzle_velocity_data); };          // MuzVel Table
    case 2: { 0 call FUNC(toggle_c1_ballistic_coefficient_data); }; // Bal Coef Table
    case 3: { 0 call FUNC(toggle_target_speed_assist); };           // Target Speed Est
    case 4: { 0 call FUNC(toggle_target_range_assist); };           // Target Range Est
    case 5: { 0 call FUNC(toggle_truing_drop); };                   // Truing Drop
    case 6: { 0 call FUNC(toggle_coriolis); };                      // Show Coriolis
    case 7: { 0 call FUNC(toggle_solution_setup); };                // Set Clicks
    case 8: {};                                                     // Gun Note
};
