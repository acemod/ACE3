#include "script_component.hpp"

["ace_settingsInitialized",{
    // Only add an InitPost EH if setting is enabled (and apply retroactively)
    if (isServer && {GVAR(autoAddObjects)}) then {
        ["AllVehicles", "InitPost", FUNC(addObjectToCurator), true, [], true] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// Global skill module PVs values for persistence, just listen for the PV
QGVAR(GlobalSkillAI) addPublicVariableEventHandler FUNC(moduleGlobalSetSkill);

[QGVAR(moveToRespawnPosition), BIS_fnc_moveToRespawnPosition] call CBA_fnc_addEventHandler;
[QGVAR(moduleDefendArea), CBA_fnc_taskDefend] call CBA_fnc_addEventHandler;
[QGVAR(modulePatrolArea), CBA_fnc_taskPatrol] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchNearby), CBA_fnc_searchNearby] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchArea), CBA_fnc_taskSearchArea] call CBA_fnc_addEventHandler;
[QGVAR(suppressiveFire), LINKFUNC(moduleSuppressiveFireLocal)] call CBA_fnc_addEventHandler;

// Editable object commands must be ran on server, this events are used in the respective module
if (isServer) then {
    [QGVAR(equipFries), EFUNC(fastroping,equipFRIES)] call CBA_fnc_addEventHandler;
    [QGVAR(addObjects), {
        params ["_objects", ["_curator", objNull]];

        if !(isNull _curator) exitWith { _curator addCuratorEditableObjects [_objects, true]; };

        {
            _x addCuratorEditableObjects [_objects, true];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(removeObjects), {
        params ["_objects", ["_curator", objNull]];

        if !(isNull _curator) exitWith { _curator removeCuratorEditableObjects [_objects, true]; };

        {
            _x removeCuratorEditableObjects [_objects, true];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;
};
