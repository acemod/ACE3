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

if (hasInterface) then {
    ["ace_infoDisplayChanged", FUNC(turretDisplayLoaded)] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    TRACE_1("ace_settingsInitialized",GVAR(useAmmoHandling));

    ["vehicle", FUNC(handlePlayerVehicleChanged), true] call CBA_fnc_addPlayerEventHandler;

    if (GVAR(useAmmoHandling)) then {
        ["Mortar_01_base_F", "init", {
            TRACE_2("mortar init",_this,(_this select 0) turretLocal [0]);

            //wait for proper turret locality change
            [{
                TRACE_2("after delay",_this,(_this select 0) turretLocal [0]);
                ["ace_initMortar", _this] call CBA_fnc_localEvent;
            }, _this, 0.5] call CBA_fnc_waitAndExecute;

        }, true, [], true] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;
