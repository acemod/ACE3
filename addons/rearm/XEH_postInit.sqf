#include "script_component.hpp"

["medical_onUnconscious", {
    if (local (_this select 0)) then {
        private ["_unit", "_dummy"];
        _unit = _this select 0;
        if (_this select 1) then {
            _dummy = _unit getVariable [QGVAR(dummy), objNull];
            if !(isNull _dummy) then {
                detach _dummy;
                deleteVehicle _dummy; // TODO remove when moved to CfgVehicles
            };
            _unit setVariable [QGVAR(dummy), nil];
        };
    };
}] call EFUNC(common,addEventHandler);

["medical_onSetDead", {
    if (local (_this select 0)) then {
        private ["_unit"];
        _unit = _this select 0;
        if (_this select 1) then {
            _unit setVariable [QGVAR(selectedWeaponOnRearm), nil];
            _unit setVariable [QGVAR(carriedMagazine), nil];
        };
    };
}] call EFUNC(common,addEventHandler); 