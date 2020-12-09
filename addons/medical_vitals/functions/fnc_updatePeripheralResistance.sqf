#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update the peripheral resistance
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Peripheral Resistance Adjustments <NUMBER>
 * 2: Time since last update <NUMBER>
 * 3: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0, 1, false] call ace_medical_vitals_fnc_updatePeripheralResistance
 *
 * Public: No
 */

params ["_unit", "_peripheralResistanceAdjustment", "_deltaT", "_syncValue"];

_unit setVariable [VAR_PERIPH_RES, 0 max (DEFAULT_PERIPH_RES + _peripheralResistanceAdjustment), _syncValue];
