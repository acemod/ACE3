#include "script_component.hpp"
/*
 * Author: Salluci
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

private _list = ["ACE_suture"]; // ugly workaround for sutures
private _config = configFile >> QGVAR(actions);
{
    _list append (getArray (_x >> "items"));
} forEach ("true" configClasses _config);

uiNamespace setVariable [QGVAR(treatmentItems), _list arrayIntersect _list]
