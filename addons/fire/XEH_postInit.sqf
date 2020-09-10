#include "script_component.hpp"

[QGVAR(burn), FUNC(burn)] call CBA_fnc_addEventHandler;
[QGVAR(playScream), {
    params ["_scream", "_source"];
    _source say3d _scream;
}] call CBA_fnc_addEventHandler;

["ace_settingsInitialized", {
    TRACE_1("settingsInit", GVAR(enabled));
    if !(GVAR(enabled)) exitWith {};

    // we track when units die to stop adding damage to them
    ["CAManBase", "killed", {
        params ["_unit"];
        _unit setVariable [QGVAR(killed), true];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    if (isServer) then {
        [QGVAR(addFireSource), {
            params ["_source", "_radius", "_intensity", "_key", ["_condition", { true }], ["_conditionArgs", []]];
            private _fireLogic = createVehicle ["ACE_LogicDummy", [0, 0, 0], [], 0, "NONE"];
            if (_source isEqualType objNull) then {
                _fireLogic attachTo [_source];
            } else {
                _fireLogic setPosASL _source;
            };

            [GVAR(fireSources), _key, [_fireLogic, _radius, _intensity, _condition, _conditionArgs]] call CBA_fnc_hashSet;
        }] call CBA_fnc_addEventHandler;
        
        [QGVAR(removeFireSource), {
            params ["_key"];
            [GVAR(fireSources), _key] call CBA_fnc_hashRem;
        }] call CBA_fnc_addEventHandler;

        [{ _this call FUNC(fireManagerPFH) }, FIRE_MANAGER_PFH_DELAY, []] call CBA_fnc_addPerFrameHandler;
        GVAR(fireSources) = [[], nil] call CBA_fnc_hashCreate;
    };
}] call CBA_fnc_addEventHandler;

