["ace_settingsInitialized", {
    if (!GVAR(enableLoadoutMenu)) exitWith {};

    private _filter = "isClass (_x >> 'Components' >> 'TransportPylonsComponent')";
    private _aircraftWithPylons = _filter configClasses (configFile >> "CfgVehicles" >> "Air");
    {
        [configName _x, "init", {
            params ["_aircraft"];

            private _loadoutAction = [
                QGVAR(loadoutAction),
                localize LSTRING(ConfigurePylons),
                "",
                {[_target] call FUNC(showDialog)},
                {
                    // TODO
                    private _rearmVehicles = _target nearObjects ["LandVehicle", GVAR(searchDistance) + 10];

                    if (["ace_rearm"] call EFUNC(common,isModLoaded)) then {
                        FILTER(_rearmVehicles,(_x getVariable [QEGVAR(rearm,magazineSupply), 0]) > 0);
                    } else {
                        FILTER(_rearmVehicles,getAmmoCargo _x > 0);
                    };

                    ({([_x, _target] call EFUNC(interaction,getInteractionDistance)) < GVAR(searchDistance)} count _rearmVehicles) > 0
                }
            ] call EFUNC(interact_menu,createAction);

            [_aircraft, 0, ["ACE_MainActions"], _loadoutAction] call EFUNC(interact_menu,addActionToObject);
        }] call CBA_fnc_addClassEventHandler;
    } forEach _aircraftWithPylons;
}] call CBA_fnc_addEventHandler;
