#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Adds an IED to the cellphone list.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Explosive <OBJECT>
 * 2: Magazine classname <STRING>
 * 3: Extra variables <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "SatchelCharge_Remote_Mag", [configFile >> "ACE_Triggers" >> "Command"]] call ace_explosives_fnc_addCellphoneIED
 *
 * Public: No
 */

params ["_unit", "_explosive", "_magazineClass", "_extra"];
TRACE_4("params",_unit,_explosive,_magazineClass,_extra);

private _detonators = _unit call FUNC(getDetonators);

// Config is the last param in extra
// Check if unit has all required detonators for specific trigger
private _hasRequiredItems = (getArray (_extra select -1 >> "requires")) findIf {!((_x call EFUNC(common,getConfigName)) in _detonators)} == -1;

// To avoid race conditions, have server handle distributing of IED codes
[QGVAR(getCellphoneCode), [_unit, _explosive, _magazineClass, _hasRequiredItems]] call CBA_fnc_serverEvent;
