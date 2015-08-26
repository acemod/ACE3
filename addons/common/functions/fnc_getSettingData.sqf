/*
 * Author: esteldunedain
 * Returns the metadata of a setting if it exists
 *
 * Arguments:
 * 0: Setting Name <STRING>
 *
 * Return Value:
 * Setting Data (Array)
 * 0: Name <STRING>
 * 1: Type Name <STRING>
 * 2: Is Client Settable <BOOL>
 * 3: Localized Name <STRING>
 * 4: Localized Description <STRING>
 * 5: Possible Values <ARRAY>
 * 6: Is Forced <BOOL>
 * 7: Default Value <ANY>
 * 8: Localized Category <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_value"];

params ["_name"];

_value = [];
{
    if ((_x select 0) == _name) exitWith {_value = _x};
    nil
} count GVAR(settings);

_value
