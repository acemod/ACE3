#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Caches all item classnames used as field rations
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_field_rations_fnc_scanFieldRations
 *
 * Public: No
 */

private _list = createHashMap;
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";

private _fnc_isFieldRationItem = toString {
    (getNumber (_x >> "ACE_isFieldRationItem") isEqualTo 1) || {(getNumber (_x >> QXGVAR(thirstQuenched))) > 0} || {(getNumber (_x >> QXGVAR(hungerSatiated))) > 0} || {(getText (_x >> QXGVAR(refillItem))) isNotEqualTo ""}
};

{
    _list set [configName _x, ""];
} forEach (_fnc_isFieldRationItem configClasses _cfgWeapons);

private _magsMissingItemProperty = [];
{
    _list set [configName _x, ""];
    if (getNumber (_x >> "ACE_asItem") == 0 && {getNumber (_x >> "ACE_isUnique") == 0}) then {
        _magsMissingItemProperty pushBack configName _x;
    };
} forEach (_fnc_isFieldRationItem configClasses _cfgMagazines);

if (_magsMissingItemProperty isNotEqualTo []) then {
    WARNING_1("[ACE] field_rations - the following magazines are valid rations but do not have item property - %1",_magsMissingItemProperty joinString ", ");
};

uiNamespace setVariable [QXGVAR(fieldRationItems), compileFinal _list];
