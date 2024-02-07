#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Returns the equivalent of 100m in screen coordinates.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Map scale <NUMBER>
 *
 * Example:
 * call ace_maptools_fnc_calculateMapScale
 *
 * Public: No
 */

private _mapCtrl = (findDisplay 12) displayCtrl 51;
private _pos = _mapCtrl ctrlMapScreenToWorld [0.5, 0.5];
private _screenOffset = _mapCtrl posWorldToScreen (_pos vectorAdd [100, 0]);

(_screenOffset select 0) - 0.5
