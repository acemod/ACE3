#include "script_component.hpp"
/*
 * Author: veteran29
 * Modifies the ACE_TeamManagement or join team action with given group color and icon.
 *
 * Arguments:
 * 0: Team color <STRING>
 * 1: Icon to show on action <STRING>
 * 2: Action Data to modifiy <ARRAY>
 *
 * Return Value:
 * None
 *
 *
 * Public: No
 */

params ["_teamColor", "_icon", "_actionData"];

private _color = switch (toUpper _teamColor) do {
    case "RED": {missionNamespace getVariable [QEGVAR(nametags,nametagColorRed), [221, 0, 0]]};
    case "GREEN": {missionNamespace getVariable [QEGVAR(nametags,nametagColorGreen), [0, 221, 0]]};
    case "BLUE": {missionNamespace getVariable [QEGVAR(nametags,nametagColorBlue), [0, 0, 221]]};
    case "YELLOW": {missionNamespace getVariable [QEGVAR(nametags,nametagColorYellow), [221, 221, 0]]};
    default {missionNamespace getVariable [QEGVAR(nametags,nametagColorMain), [255, 255, 255]]};
};

_actionData set [2, [_icon, _color call BIS_fnc_colorRGBtoHTML]];

nil
