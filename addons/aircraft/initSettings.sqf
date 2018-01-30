[
    QGVAR(disableVehicleFreelook),
    "CHECKBOX",
    [LSTRING(SettingDisableVehicleFreelookName), LSTRING(SettingDisableVehicleFreelookDesc)],
    "ACE Uncategorized",
    false,
    false,
    {
        params ["_enabled"];
        if (!_enabled) exitWith {
            if (isNil QGVAR(vehicleFreelookEH)) exitWith {};
            ["vehicle", GVAR(vehicleFreelookEH)] call CBA_fnc_removePlayerEventHandler;
        };
        GVAR(isVehicleFreelookDisabled) = false;
        GVAR(vehicleFreelookEH) = ["vehicle", LINKFUNC(switchVehicleFreelook), true] call CBA_fnc_addPlayerEventHandler;
    }
] call CBA_settings_fnc_init;
