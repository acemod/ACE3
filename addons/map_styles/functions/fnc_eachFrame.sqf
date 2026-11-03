#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Runs each frame the map is visible (uses EachFrame EH because it runs before map draw EH)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_map_styles_fnc_eachFrame
 *
 * Public: No
 */

private _display = findDisplay 12;
if (isNull _display || GVAR(shownIDC) == -1) exitWith {};

private _real = _display displayCtrl 51;
private _fake = _display displayCtrl GVAR(shownIDC);

private _scale = ctrlMapScale _real;
private _center = _real ctrlMapScreenToWorld GVAR(mapCenter);

_fake ctrlMapAnimAdd [0, _scale, _center];
ctrlMapAnimCommit _fake;
