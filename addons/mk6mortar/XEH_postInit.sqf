#include "script_component.hpp"

[QGVAR(addMagazine), {
    params ["_static", "_magazine"];
    _static addMagazineTurret [_magazine,[0]];
}] call EFUNC(common,addEventHandler);

[QGVAR(removeMagazine), {
    params ["_static", "_magazine"];
    _static removeMagazineTurret [_magazine,[0]];
}] call EFUNC(common,addEventHandler);

[QGVAR(setAmmo), {
    params ["_static", "_magazine","_ammoCount"];
    _static setMagazineTurretAmmo [_magazine, _ammoCount, [0]];
}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitWith {};

["playerVehicleChanged", {_this call FUNC(handlePlayerVehicleChanged);}] call EFUNC(common,addEventHandler);
["infoDisplayChanged", {_this call FUNC(turretDisplayLoaded);}] call EFUNC(common,addEventHandler);
