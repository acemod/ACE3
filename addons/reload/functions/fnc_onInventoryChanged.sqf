/*
 * Author: BaerMitUmlaut
 * Handles unit weight coefficient for empty magazines.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Previous loadout <ARRAY>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_unit", "_previousLoadout"];

private _loadout = getUnitLoadout _unit;
_loadout params ["", "", "", "_uniformInventory", "_vestInventory", "_backpackInventory"];

private _prevEmptyMagsWeight = _unit getVariable [QGVAR(emptyMagazinesWeight), 0];
private _emptyMagsWeight = 0;

if (isNil QGVAR(magWeightCache)) then {
    GVAR(magWeightCache) = [] call CBA_fnc_createNamespace;
};

{
    if !(_x isEqualTo []) then {
        private _mags = _x select 1;
        {
            _x params ["_classname", "_ammoCount", "_magCount"];

            if (_ammoCount == 0) then {
                private _weight = GVAR(magWeightCache) getVariable _classname;
                if (isNil "_weight") then {
                    _weight = getNumber (configFile >> "CfgMagazines" >> _classname >> "mass");
                    GVAR(magWeightCache) setVariable [_classname, _weight];
                    systemChat "nocache";
                };
                _emptyMagsWeight = _emptyMagsWeight + _weight * _magCount;
            };
        } forEach _mags;
    };
} forEach [_uniformInventory, _vestInventory, _backpackInventory];

if (_emptyMagsWeight != _prevEmptyMagsWeight) then {
    _unit setVariable [QGVAR(emptyMagazinesWeight), _emptyMagsWeight];
    [_unit, _unit, -0.8 * (_emptyMagsWeight - _prevEmptyMagsWeight)] call EFUNC(movement,addLoadToUnitContainer);
};
