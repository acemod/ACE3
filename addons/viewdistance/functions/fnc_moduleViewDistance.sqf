/*
 * Author: Winter
 * Initialises the view distance limiter module
 * 
 *
 * Arguments:
 * 
 *
 * Return Value:
 * View Distance Limit <SCALAR>
 *
 * Example:
 * 
 */

#include "script_component.hpp"

if (!isServer) exitWith {
    GVAR(modulePresent) = false
};

PARAMS_2(_logic,_activated);

if !(_activated) exitWith {};

GVAR(modulePresent) = true;
publicVariable QGVAR(modulePresent);

diag_log text "[ACE]: ViewDistance Module Initialized.";