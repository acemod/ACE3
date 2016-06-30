#include "script_component.hpp"

[QGVAR(addMagazine), {
    params ["_static", "_magazine"];
    _static addMagazineTurret [_magazine,[0]];
}] call CBA_fnc_addEventHandler;

[QGVAR(removeMagazine), {
    params ["_static", "_magazine"];
    _static removeMagazineTurret [_magazine,[0]];
}] call CBA_fnc_addEventHandler;

[QGVAR(setAmmo), {
    params ["_static", "_magazine","_ammoCount"];
    _static setMagazineTurretAmmo [_magazine, _ammoCount, [0]];
}] call CBA_fnc_addEventHandler;

["ace_initMortar", {_this call FUNC(mortarInit);}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

["vehicle", FUNC(handlePlayerVehicleChanged)] call CBA_fnc_addPlayerEventHandler;
["ace_infoDisplayChanged", FUNC(turretDisplayLoaded)] call CBA_fnc_addEventHandler;
