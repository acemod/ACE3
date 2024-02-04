#include "..\script_component.hpp"

if !(GVAR(enableInventoryEditing)) exitWith {[]};

private _typesToSkip = ["CAManBase", "WeaponHolder"];
(GVAR(center) nearSupplies 10) select {
    private _object = _x;
    _object != GVAR(currentBox) &&
    {_typesToSkip findIf {_object isKindOf _x} == -1} &&
    {[GVAR(center), _x] call EFUNC(common,canInteractWith)} &&
    {GVAR(vehicleMap) set [hashValue _x, _x]; true}
} // return
