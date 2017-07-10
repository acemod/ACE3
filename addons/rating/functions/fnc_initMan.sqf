/*
 * Author: chris579
 * Inits the object with the rating eventhandler
 *
 * Arguments:
 * 0: The man object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_rating_fnc_initMan
 *
 * Public: No
 */

#include "script_component.hpp"

params["_unit"];

// only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(initMan), _this];
};

if (local _unit) then {
    [QGVAR(initManLocal), _this] call CBA_fnc_localEvent;
} else {
    [QGVAR(initManLocal), _this, _unit] call CBA_fnc_targetEvent;
};
