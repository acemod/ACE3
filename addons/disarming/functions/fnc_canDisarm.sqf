/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm a unit
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [cursorTarget] call ace_disarming_fnc_canDisarm
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_target);

//Check animationState for putDown anim:
_animationStateCfgMoves = getText (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _target) >> "actions");
if (_animationStateCfgMoves == "") exitWith {false};
_putDownAnim = getText (configFile >> "CfgMovesBasic" >> "Actions" >> _animationStateCfgMoves >> "PutDown");
if (_putDownAnim != "") exitWith {false};


(alive _target) &&
{(abs (speed _target)) < 1} &&
{(vehicle _target) == _target} &&
{(_target getVariable ["ACE_isUnconscious", false]) ||
    {_target getVariable [QEGVAR(captives,isHandcuffed), false]} ||
    {_target getVariable [QEGVAR(captives,isSurrendering), false]}}
