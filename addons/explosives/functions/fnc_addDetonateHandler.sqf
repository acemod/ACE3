/*
 * Author: PabstMirror
 * Add a explosive detonation handler.
 * Should be called on all machines.
 * Code needs to return BOOL: true(allowed) / false(blocked)
 *
 * Arguments:
 * 0: Code <CODE>
 *  - Passed [Unit<OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]
 *
 * Return Value:
 * None
 *
 * Example (blocks wireless triggers):
 * [{
 *    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
 *   if (_range < 0) exitWith {true};
 *   if (_triggerItem == "ace_cellphone") exitWith { systemChat "Blocking Cell Phone"; false }; // always block cell phones
 *   if (_triggerItem == "ace_m26_clacker") exitWith {
 *       _range = _range / 1000;
 *        private _actualRange = _unit distance _explosive;
 *        systemChat format ["Limited Range For RF Clacker [%1m / %2m]", _actualRange toFixed 1, _range toFixed 1];
 *       (_actualRange < _range) // return bool
 *   };
 *   true
 * }] call ace_explosives_fnc_addDetonateHandler;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_code", {true}, [{}]]];

GVAR(detonationHandlers) pushBack _code;
