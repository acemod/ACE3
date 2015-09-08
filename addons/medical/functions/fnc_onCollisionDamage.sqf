// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_selection", "_totalDamage"];

_selection = "body";

if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {GVAR(enableVehicleCrashes)}) then {
    _selection = GVAR(SELECTIONS) select floor random count GVAR(SELECTIONS);
};

_totalDamage = (_unit getHit _selection) + _newDamage;

[_unit] call FUNC(addToInjuredCollection);

_unit setHit [_selection, _totalDamage];

systemChat format ["collision: %1", _this];
