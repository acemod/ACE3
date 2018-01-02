/*
 * Author: Garth 'L-H' de Wet
 * Adds an IED to the cellphone list
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
 * Handled by PlaceExplosive.
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_explosive", "_magazineClass", "_extra"];
TRACE_4("params",_unit,_explosive,_magazineClass,_extra);

// Config is the last item in the list of passed in items.
private _config = (_this select 3) select (count (_this select 3) - 1);

private _requiredItems = getArray (_config >> "requires");
private _hasRequired = true;
private _detonators = [_unit] call FUNC(getDetonators);

{
    if !(_x in _detonators) exitWith{
        _hasRequired = false;
    };
} count _requiredItems;

private _code = "";
while {true} do {
    _code = [floor(random 10000), 4] call CBA_fnc_formatNumber;
    if (([_code] call FUNC(getSpeedDialExplosive)) isEqualTo []) exitWith {};
};

if (isNil QGVAR(CellphoneIEDs)) then {
    GVAR(CellphoneIEDs) = [];
};

private _count = GVAR(CellphoneIEDs) pushBack [_explosive, _code, getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> "Cellphone" >> "FuseTime")];
_count = _count + 1;
publicVariable QGVAR(CellphoneIEDs);

//display IED number message:
[format ["IED %1 code: %2", _count, _code]] call EFUNC(common,displayTextStructured);

if !(_hasRequired) exitWith {};
[format ["IED %1", _count], _code] call FUNC(addToSpeedDial);
