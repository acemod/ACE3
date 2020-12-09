#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Adjust tripod height
 *
 * Arguments:
 * 0: tripod <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, tripod] call ace_tripod_fnc_adjust
 *
 * Public: No
 */

params ["_unit", "_tripod"];

_unit setVariable [QGVAR(adjusting), true, true];

// add PFH to adjust the tripod animation
GVAR(adjustPFH) = [{
    (_this select 0) params ["_unit", "_tripod"];

    if (!(_unit getVariable [QGVAR(adjusting), false]) || {isNull _tripod} || {_unit distance _tripod > 5}) exitWith {
        call EFUNC(interaction,hideMouseHint);
        [_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

        [_unit, "DefaultAction", _unit getVariable [QGVAR(Adjust), -1]] call EFUNC(common,removeActionEventHandler);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    {
        _tripod animate [_x, 1 - GVAR(height)];
    } count ["slide_down_tripod", "retract_leg_1", "retract_leg_2", "retract_leg_3"];

}, 0, [_unit, _tripod]] call CBA_fnc_addPerFrameHandler;

[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
// add mouse button action and hint
[LLSTRING(Done), "", LLSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(Adjust), [
    _unit, "DefaultAction",
    {GVAR(adjustPFH) != -1},
    {(_this select 0) setVariable [QGVAR(adjusting), false, true]}
] call EFUNC(common,addActionEventHandler)];
