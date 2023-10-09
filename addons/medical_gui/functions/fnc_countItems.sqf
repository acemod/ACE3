#include "..\script_component.hpp"

params ["_medic", "_patient", "_items"];

private _medicCount = 0;
private _patientCount = nil;
private _vehicleCount = nil;

{
    private _item = _x;
    _medicCount = _medicCount + ([_medic, _item] call EFUNC(common,getCountOfItem));
} forEach _items;

if (_medic != _patient) then {
    _patientCount = 0;
    {
        private _item = _x;
        _patientCount = _patientCount + ({_x == _item} count (items _patient));
    } forEach _items;
};

private _medicVehicle = objectParent _medic;
private _patientVehicle = objectParent _patient;
private _vehicle = if (!isNull _medicVehicle) then {_medicVehicle} else {_patientVehicle};

if (!isNull _vehicle) then {
    _vehicleCount = 0;
    (getItemCargo _vehicle) params ["_itemTypes", "_itemCounts"];
    {
        private _item = _x;
        private _index = _itemTypes find _item;
        _vehicleCount = _vehicleCount + (_itemCounts param [_index, 0]);
    } forEach _items;
};

[_medicCount, _patientCount, _vehicleCount];
