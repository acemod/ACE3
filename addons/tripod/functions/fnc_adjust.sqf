/*
 * Author: Ruthberg
 * Adjust tripod height
 *
 * Arguments:
 * 0: tripod <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [tripod] call ace_tripod_fnc_adjust
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_tripod"];

GVAR(adjuster) = ACE_player;
GVAR(adjusting) = true;

GVAR(adjustPFH) = [{
    params ["_args", "_pfhId"];
    _args params ["_tripod"];

    if (GVAR(adjuster) != ACE_player || !GVAR(adjusting)) exitWith {
        call EFUNC(interaction,hideMouseHint);
        [ACE_player, "DefaultAction", ACE_player getVariable [QGVAR(Adjust), -1]] call EFUNC(Common,removeActionEventHandler);
        [_pfhId] call cba_fnc_removePerFrameHandler;
    };

    {
        _tripod animate [_x, 1 - GVAR(height)];
    } count ["slide_down_tripod", "retract_leg_1", "retract_leg_2", "retract_leg_3"];

}, 0, [_tripod]] call CBA_fnc_addPerFrameHandler;

[localize "STR_ACE_Tripod_Done", "", localize "STR_ACE_Tripod_ScrollAction"] call EFUNC(interaction,showMouseHint);

ACE_player setVariable [QGVAR(Adjust),
    [ACE_player, "DefaultAction",
    {GVAR(adjustPFH) != -1 && GVAR(adjusting)},
    {GVAR(adjusting) = false;}
] call EFUNC(common,AddActionEventHandler)];
