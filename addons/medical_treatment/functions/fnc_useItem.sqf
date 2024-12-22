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
<<<<<<< HEAD
 * User and Item and Litter Created<ARRAY>
=======
 * User and Item and Litter Created <ARRAY>
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 *
 * Example:
 * [player, cursorObject, ["bandage"]] call ace_medical_treatment_fnc_useItem
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];

if (_medic isEqualTo player && {!isNull findDisplay 312}) exitWith {
<<<<<<< HEAD
    [_medic, _items select 0]
=======
    [_medic, _items select 0, false] // return
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
};

scopeName "Main";

<<<<<<< HEAD
private _useOrder = [[_patient, _medic], [_medic, _patient], [_medic]] select GVAR(allowSharedEquipment);
=======
private _allowSharedEquipment = GVAR(allowSharedEquipment);
if (_allowSharedEquipment == 3) then { _allowSharedEquipment = [0, 1] select ([_medic] call FUNC(isMedic)) };
private _useOrder = [[_patient, _medic], [_medic, _patient], [_medic]] select _allowSharedEquipment;
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673

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
<<<<<<< HEAD
                [_unit, _x, false] breakOut "Main";
            };
            case (_x in _vehicleMagazines): {
                [_unitVehicle, _x] call EFUNC(common,adjustMagazineAmmo);
                [_unit, _x, false] breakOut "Main";
            };
            case (_x in _unitItems): {
                _unit removeItem _x;
                [_unit, _x, true] breakOut "Main";
=======
                [_unit, _x, false] breakOut "Main"; // return
            };
            case (_x in _vehicleMagazines): {
                [_unitVehicle, _x] call EFUNC(common,adjustMagazineAmmo);
                [_unit, _x, false] breakOut "Main"; // return
            };
            case (_x in _unitItems): {
                _unit removeItem _x;
                [_unit, _x, true] breakOut "Main"; // return
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
            };
            case (_x in _unitMagazines): {
                private _magsStart = count magazines _unit;
                [_unit, _x] call EFUNC(common,adjustMagazineAmmo);
                private _magsEnd = count magazines _unit;
<<<<<<< HEAD
                [_unit, _x, (_magsEnd < _magsStart)] breakOut "Main";
=======
                [_unit, _x, (_magsEnd < _magsStart)] breakOut "Main"; // return
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
            };
        };
    } forEach _items;
} forEach _useOrder;

<<<<<<< HEAD
[objNull, "", false]
=======
[objNull, "", false] // return
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
