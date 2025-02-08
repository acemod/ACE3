#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, commy2
 * Handles explosions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Example:
 * [bob] call ace_goggles_fnc_handleExplosion
 *
 * Public: No
 */

params ["_unit"];

if (_unit != ACE_player) exitWith {true};

call FUNC(applyDirtEffect);

if (GETBROKEN) exitWith {true};

private _config = configFile >> "CfgGlasses" >> goggles _unit;

if ((_this select 1) call FUNC(getExplosionIndex) < getNumber (_config >> "ACE_Resistance")) exitWith {true};

[] call FUNC(applyCrackEffect);
