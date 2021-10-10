#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, Rocko, Rommel, Ruthberg
 * Handle new sound souce near ace_player and apply hearing damage
 *
 * Arguments:
 * 0: strength of ear ringing <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_strength] call ace_hearing_fnc_earRinging
 *
 * Public: No
 */
params ["_strength"];

if (_strength < 0.05) exitWith {};
if (!isNull curatorCamera) exitWith {};
if ((!GVAR(enabledForZeusUnits)) && {player != ACE_player}) exitWith {};

TRACE_2("adding",_strength * GVAR(damageCoefficent),GVAR(deafnessDV));

GVAR(deafnessDV) = GVAR(deafnessDV) + (_strength * GVAR(damageCoefficent));
