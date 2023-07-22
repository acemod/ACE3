#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Handles assigning a unique intel index to a magazine id.
 *
 * Arguments:
 * 0: Magazine id <STRING>
 *
 * Return Value:
 * Intel Index <NUMBER>
 *
 * Example:
 * ["001"] call ace_intelitems_fnc_handleMagIndex
 *
 * Public: No
 */

params ["_magazineId"];

private _index = GVAR(intelMap) getVariable _magazineId;

if (isNil "_index") then {
    _index = GVAR(intelCount);
    GVAR(intelCount) = GVAR(intelCount) + 1;
};

GVAR(intelMap) setVariable [_magazineId, _index, true];

_index
