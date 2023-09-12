#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Handle the mouse wheel.
 *
 * Arguments:
 * 0: Not used
 * 1: onMouseZChanged EH return <ARRAY>
 * - 0: Not used
 * - 1: Mousewheel Z position <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["", "_zPos"];

private _boundingBoxReal = boundingBoxReal GVAR(center);
private _distanceMax = ((_boundingBoxReal select 0) vectorDistance (_boundingBoxReal select 1)) * 1.5;
private _distanceMin = _distanceMax * 0.15;
private _distance = GVAR(cameraPosition) select 0;

_distance = (_distance - (_zPos / 10)) max _distanceMin min _distanceMax;
GVAR(cameraPosition) set [0, _distance];
