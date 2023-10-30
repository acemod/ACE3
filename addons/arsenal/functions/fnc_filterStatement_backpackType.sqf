#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Statement to differentiate regular backpacks, deployable objects, and special cases
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 * 1: Type <STRING>
 *
 * Return Value:
 * Passed filter <BOOL>
 *
 * Public: No
*/

params ["_config", "_targetType"];

private _isBag = (getContainerMaxLoad configName _config > 0); // Bags have non-zero load
private _isDeployable = isClass (_config >> "assembleInfo"); // Deployables have `assembleInfo` config entry

private _return = false;
switch (true) do {
    case (_isBag && {!_isDeployable} && {_targetType == "bag"});
    case (_isDeployable && {_targetType == "deployable"});
    case (!_isBag && {!_isDeployable} && {_targetType == "other"}): {
        _return = true;
    };
    default {
        _return = false;
    };
};

#ifdef DEBUG_MODE_FULL
private _name = getText (_config >> "displayName");
#endif
TRACE_3("Bag filter", _name, _targetType, _return);

_return
