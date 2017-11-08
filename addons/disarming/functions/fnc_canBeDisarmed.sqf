/*
 * Author: PabstMirror
 *
 * Checks the conditions for being able to disarm a unit
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can Be Disarmed <BOOL>
 *
 * Example:
 * [cursorTarget] call ace_disarming_fnc_canBeDisarmed
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

//Check animationState for putDown anim
//This ensures the unit doesn't have to actualy do any animation to drop something
//This should always be true for the 3 possible status effects that allow disarming
private _animationStateCfgMoves = getText (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _target) >> "actions");
if (_animationStateCfgMoves == "") exitWith { false };
private _putDownAnim = getText (configFile >> "CfgMovesBasic" >> "Actions" >> _animationStateCfgMoves >> "PutDown");
if (_putDownAnim != "") exitWith { false };


(alive _target) &&
{(abs (speed _target)) < 1} &&
{(vehicle _target) == _target} &&
{(_target getVariable ["ACE_isUnconscious", false]) ||
    {_target getVariable [QEGVAR(captives,isHandcuffed), false]} ||
    {_target getVariable [QEGVAR(captives,isSurrendering), false]}}
