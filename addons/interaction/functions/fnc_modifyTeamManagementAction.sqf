#include "script_component.hpp"
/*
 * Author: veteran29
 * Modifies the ACE_TeamManagement action to show current group color.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 *
 * Public: No
 */

params ["_target", "", "", "_actionData"];

private _color = switch (assignedTeam _target) do {
    case "RED": {"#FF0000"};
    case "GREEN": {"#00FF00"};
    case "BLUE": {"#0000FF"};
    case "YELLOW": {"#FFFF00"};
    default {"#FFFFFF"};
};

_actionData set [2, [QPATHTOF(UI\team\team_management_ca.paa), _color]];

nil
