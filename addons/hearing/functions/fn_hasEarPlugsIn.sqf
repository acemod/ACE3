/*
 * Author: commy2
 *
 * Check if the unit has earplugs put in.
 * 
 * Argument:
 * A soldier (Object)
 * 
 * Return value:
 * Boolean (Bool)
 */

private "_unit";

_unit = _this select 0;

_unit getVariable ["AGM_hasEarPlugsin", false] || {_unit getVariable ["X39_MedSys_var_hasEarplugs", false]}
