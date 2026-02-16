#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets item's localized name or indicates if not available
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * <STRING>
 *
 * Example:
 * "ACE_Banana" call ace_fieldmanual_fnc_getItemName
 *
 * Public: No
 */
params ["_classname"];
private _config = configFile >> "CfgWeapons" >> _classname;
if (isClass _config) then {
    getText (_config >> "displayName")
} else {
    format ["[N/A] - %1", _classname]
};
