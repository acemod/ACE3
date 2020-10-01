#include "script_component.hpp"
/*
 * Author: ?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_onRemoteControl
 *
 * Public: No
 */

private _units = curatorSelected select 0;
private _index = _units findIf {
    (side _x) in [east, west, resistance, civilian]
    && !(isPlayer _x)
};
private _unit = _units param [_index, objNull];
bis_fnc_curatorObjectPlaced_mouseOver = ["OBJECT", _unit];
private _rc = (group _target) createUnit ["ModuleRemoteControl_F", [0,0,0], [], 0, "NONE"];
_rc setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
