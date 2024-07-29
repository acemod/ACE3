#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Uses one of the treatment items. Respects the priority defined by the allowSharedEquipment setting.
 * Can use items from vehicle inventory if either unit is in a vehicle.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY>
 *
 * Return Value:
 * User and Item and Litter Created<ARRAY>
 *
 * Example:
 * [player, cursorObject, ["bandage"]] call ace_medical_treatment_fnc_useItem
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];

if (_medic isEqualTo player && {!isNull findDisplay 312}) exitWith {
    [_medic, _items select 0]
};

scopeName "Main";

private _useOrder = [[_patient, _medic], [_medic, _patient], [_medic]] select GVAR(allowSharedEquipment);

{
    private _unit = _x;
    private _unitVehicle = objectParent _unit;
    private _unitItems = [_x, 0] call EFUNC(common,uniqueItems);
    private _unitMagazines = [_x, 2] call EFUNC(common,uniqueItems);
    private _vehicleItems = itemCargo _unitVehicle; // [] for objNull
    private _vehicleMagazines = magazineCargo _unitVehicle; // same

    {
        switch (true) do {
            case (_x in _vehicleItems): {
                _unitVehicle addItemCargoGlobal [_x, -1];
                [_unit, _x, false] breakOut "Main";
            };
            case (_x in _vehicleMagazines): {
                [_unitVehicle, _x] call EFUNC(common,adjustMagazineAmmo);
                [_unit, _x, false] breakOut "Main";
            };
            case (_x in _unitItems): {
                _unit removeItem _x;
                [_unit, _x, true] breakOut "Main";
            };
            case (_x in _unitMagazines): {
                private _magsStart = count magazines _unit;
                [_unit, _x] call EFUNC(common,adjustMagazineAmmo);
                private _magsEnd = count magazines _unit;
                [_unit, _x, (_magsEnd < _magsStart)] breakOut "Main";
            };
        };
    } forEach _items;
} forEach _useOrder;

[objNull, "", false]
