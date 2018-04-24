/*
 * Author: Garth 'L-H' de Wet
 * Adds an explosive as a clacker item to the passed unit if the unit has the required item.
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
 * [player, _explosive, "SatchelCharge_Remote_Mag", [ConfigFile >> "ACE_Triggers" >> "Command"]] call ACE_Explosives_fnc_addClacker;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_explosive", "_magazineClass"];
TRACE_3("params",_unit,_explosive,_magazineClass);

// Config is the last item in the list of passed in items.
private _config = (_this select 3) select (count (_this select 3) - 1);

private _requiredItems = getArray(_config >> "requires");
private _hasRequired = true;
private _detonators = [_unit] call FUNC(getDetonators);
{
    if !(_x in _detonators) exitWith{
        _hasRequired = false;
    };
} count _requiredItems;

if !(_hasRequired) exitWith {};
private _config = ConfigFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> configName _config;

private _clacker = _unit getVariable [QGVAR(Clackers), []];
GVAR(PlacedCount) = GVAR(PlacedCount) + 1;

_clacker pushBack [_explosive, getNumber(_config >> "FuseTime"), format [localize LSTRING(DetonateCode),
    GVAR(PlacedCount)], _magazineClass, configName ((_this select 3) select (count (_this select 3) - 1))];

_unit setVariable [QGVAR(Clackers), _clacker, true];

//display clacker code message:
[format [localize LSTRING(DetonateCode), GVAR(PlacedCount)]] call EFUNC(common,displayTextStructured);
