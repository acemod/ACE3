#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Condition for whether or not this object is a simulation type which can be a tow parent (TankX or CarX)
 *
 * Arguments:
 * 0: Vehicle to tow from <OBJECT>
 * 1: Check type - Parent or Child <NUMBER>
 *
 * Return Value:
 * Whether or not this vehicle can tow <BOOLEAN>
 *
 * Example:
 * [cursorObject] call ace_towing_fnc_isSuitableSimulation
 *
 * Public: No
 */
params ["_target"];

// need toLower since apparently this isn't case sensitive
private _simulationType = getText ((configOf _target) >> "simulation");
TRACE_1("sim type",_simulationType);

// Biki lies, you can both tow and tow as either TankX or CarX
(toLower _simulationType) in ["tankx", "carx"]

