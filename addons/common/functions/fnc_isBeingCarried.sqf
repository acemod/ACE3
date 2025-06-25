#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Returns if an object is being carried. (from ace_dragging)
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Is being carried <BOOL>
 *
 * Example:
 * bob call ace_common_fnc_isBeingCarried
 *
 * Public: Yes
 */

params ["_target"];

private _owner = _target getVariable [QEGVAR(common,owner), objNull];

!(isNull _owner)
    && {(_owner getVariable [QEGVAR(dragging,carriedObject), objNull]) == _target}
