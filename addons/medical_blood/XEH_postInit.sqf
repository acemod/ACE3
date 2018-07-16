#include "script_component.hpp"

GVAR(useAceMedical) = ["ace_medical"] call EFUNC(common,isModLoaded);

// To support public API regardless of component settings
[QGVAR(spurt), FUNC(spurt)] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(bloodDrops) = [];

    [QGVAR(bloodDropCreated), {
        params ["_bloodDrop"];
        // Add to created queue with format [expireTime, object]
        private _index = GVAR(bloodDrops) pushBack [(CBA_missionTime + BLOOD_OBJECT_LIFETIME), _bloodDrop];

        if (count GVAR(bloodDrops) >= MAX_BLOOD_OBJECTS) then {
            (GVAR(bloodDrops) deleteAt 0) params ["", "_deletedBloodDrop"];
            deleteVehicle _deletedBloodDrop;
        };

        if (_index == 1) then { // Start the waitAndExecute loop
            [FUNC(serverCleanupBlood), [], BLOOD_OBJECT_LIFETIME] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    TRACE_1("settingsInitialized", GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!hasInterface}) exitWith {}; // 1: enabledFor_OnlyPlayers

    private _listcode = if (GVAR(enabledFor) == 1) then {
        {[ACE_player] select {[_x] call FUNC(isBleeding)}} // ace_player is only possible local player
    } else {
        {allUnits select {(local _x) && {[_x] call FUNC(isBleeding)}}}; // filter all local bleeding units
    };

    private _stateMachine = [_listcode, true] call CBA_statemachine_fnc_create;
    [_stateMachine, {call FUNC(onBleeding)}, {}, {}, "Bleeding"] call CBA_statemachine_fnc_addState;

    [QEGVAR(medical,woundReceived), FUNC(handleWoundReceived)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
