#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Returns the metadata of a setting if it exists
 *
 * Arguments:
 * 0: Setting Name <STRING>
 *
 * Return Value:
 * Setting Data <ARRAY>
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
 * Example:
 * ["setting"] call ace_common_fnc_getSettingData
 *
 * Public: No
 */

params ["_name"];

scopeName "main";

{
    if (_x select 0 == _name) then {
        _x breakOut "main";
    };
    false
} count GVAR(settings);

[]
