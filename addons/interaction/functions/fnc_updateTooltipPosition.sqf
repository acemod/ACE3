/*
 * Author: commy2
 * Updates tooltip's position
 *
 * Arguments:
 * 0: Tooltip Display <NUMBER>
 * 1: X Coordinate <NUMBER>
 * 2: Y Coordinate <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [player, 0.5, 0.5] call ace_interaction_fnc_updateTooltipPosition
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_tooltip,_coordinateX,_coordinateY);

private["_ctrl"];

disableSerialization;
_ctrl = ctrlParent _tooltip displayCtrl 40;

_ctrl ctrlSetPosition [
    _coordinateX + 0.01 * safezoneW,
    _coordinateY + 0.01 * safezoneH,
    2.0 / 16 * safezoneW,
    0.3 / 9 * safezoneH
];
_ctrl ctrlCommit 0;
