/*
 * Author: commy2
 * Report death (used for unconsciousness) animation of unit inside vehicle.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * ReturnValue:
 * The animtaion <STRING>
 *
 * Example:
 * player call ace_medical_engine_fnc_getUnitDeathAnim
 *
 * Public: no
 */
#include "script_component.hpp"

params ["_unit"];

private _awakeAnim = _unit call FUNC(getUnitAwakeAnim);

// --- no animation, on foot
if (_awakeAnim isEqualTo "") exitWith {""};

// --- inside vehicle
private _animConfigAction = configFile >> "CfgMovesMaleSdr" >> "States" >> _awakeAnim >> "actions";

if (isText _animConfigAction) exitWith {
    getText (configFile >> "CfgMovesBasic" >> "Actions" >> getText _animConfigAction >> "die");
};

""
