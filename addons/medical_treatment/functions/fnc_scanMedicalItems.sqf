#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Caches all item classnames used in ACE_Medical_Treatment_Actions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_medical_treatment_fnc_scanMedicalItems
 *
 * Public: No
 */

private _list = [];
private _cfgActions = configFile >> QGVAR(actions);

private _fnc_isMedicalItem = toString {
    getNumber (_x >> "ACE_isMedicalItem") isEqualTo 1
};

// Get items in ACE_Medical_Treament_Actions, fallback for items without API config property
{
    _list append (getArray (_x >> "items"));
} forEach ("true" configClasses _cfgActions);

{
    _list pushBack (configName _x);
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgWeapons"));

{
    _list pushBack (configName _x);
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgMagazines"));

uiNamespace setVariable [QGVAR(treatmentItems), compileFinal (_list createHashMapFromArray [])]
