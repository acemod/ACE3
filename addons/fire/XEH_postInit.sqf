#include "script_component.hpp"

[QGVAR(burn), LINKFUNC(burn)] call CBA_fnc_addEventHandler;
[QGVAR(burnEffects), LINKFUNC(burnEffects)] call CBA_fnc_addEventHandler;
[QGVAR(burnSimulation), LINKFUNC(burnSimulation)] call CBA_fnc_addEventHandler;

// Only play sound if enabled in settings
[QGVAR(playScream), {
    if (!GVAR(enableScreams)) exitWith {};

    params ["_scream", "_source"];

    _source say3D _scream;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    ["CBA_settingsInitialized", {
        TRACE_1("settingsInit", GVAR(enabled));

        if (!GVAR(enabled)) exitWith {};

        GVAR(fireSources) = createHashMap;

        [QGVAR(addFireSource), {
            params ["_source", "_radius", "_intensity", "_key", ["_condition", {true}], ["_conditionArgs", []]];

            private _fireLogic = createVehicle ["ACE_LogicDummy", [0, 0, 0], [], 0, "NONE"];

            if (_source isEqualType objNull) then {
                _fireLogic attachTo [_source];
            } else {
                _fireLogic setPosASL _source;
            };

            GVAR(fireSources) set [_key, [_fireLogic, _radius, _intensity, _condition, _conditionArgs]];
        }] call CBA_fnc_addEventHandler;

        [QGVAR(removeFireSource), {
            params ["_key"];

            GVAR(fireSources) deleteAt _key;
        }] call CBA_fnc_addEventHandler;

        [LINKFUNC(fireManagerPFH), FIRE_MANAGER_PFH_DELAY, []] call CBA_fnc_addPerFrameHandler;
    }] call CBA_fnc_addEventHandler;
};
