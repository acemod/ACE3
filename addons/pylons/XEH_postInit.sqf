#include "script_component.hpp"

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    private _filter = "isClass (_x >> 'Components' >> 'TransportPylonsComponent')";
    GVAR(aircraftWithPylons) = (_filter configClasses (configFile >> "CfgVehicles")) apply {configName _x};
    {
        [_x, "init", {
            params ["_aircraft"];

            private _loadoutAction = [
                QGVAR(loadoutAction),
                localize LSTRING(ConfigurePylons),
                "",
                {[_target] call FUNC(showDialog)},
                {
                    private _rearmVehicles = _target nearObjects ["LandVehicle", GVAR(searchDistance) + 10];
                    FILTER(_rearmVehicles,(_x getVariable [QEGVAR(rearm,magazineSupply), 0]) > 0);

                    (!(_rearmVehicles isEqualTo []) && {[ace_player, _target] call FUNC(canConfigurePylons)})
                }
            ] call EFUNC(interact_menu,createAction);

            [_aircraft, 0, ["ACE_MainActions"], _loadoutAction] call EFUNC(interact_menu,addActionToObject);
        }] call CBA_fnc_addClassEventHandler;
    } forEach GVAR(aircraftWithPylons);
}] call CBA_fnc_addEventHandler;
