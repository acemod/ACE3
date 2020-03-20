#include "script_component.hpp"

GVAR(useAceMedical) = ["ace_medical"] call EFUNC(common,isModLoaded);

// To support public API regardless of component settings
[QGVAR(spurt), {
    _this call FUNC(spurt);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(bloodDrops) = [];

    [QGVAR(bloodDropCreated), {
        params ["_bloodDrop"];
        GVAR(bloodDrops) pushBack _bloodDrop;
        if (count GVAR(bloodDrops) >= MAX_BLOOD_OBJECTS) then {
            private _deletedBloodDrop = GVAR(bloodDrops) deleteAt 0;
            deleteVehicle _deletedBloodDrop;
        };

        [{deleteVehicle _this}, _bloodDrop, BLOOD_OBJECT_LIFETIME] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    TRACE_1("settingsInitialized", GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!hasInterface}) exitWith {}; // 1: enabledFor_OnlyPlayers

    private _listcode = if (GVAR(enabledFor) == 1) then {
        {[ACE_player]} // ace_player is only possible local player
    } else {
        EFUNC(common,getLocalUnits) // filter all local units
    };
    
    private _stateMachine = [_listcode, true] call CBA_statemachine_fnc_create;
    [_stateMachine, {call FUNC(onBleeding)}, {}, {}, "Bleeding"] call CBA_statemachine_fnc_addState;


    ["CAManBase", "hit", {
        params ["_unit"];
        if (GVAR(enabledFor) == 1 && {!isPlayer _unit && {_unit != ACE_player}}) exitWith {};
        _this call FUNC(hit);
    }] call CBA_fnc_addClassEventHandler;

}] call CBA_fnc_addEventHandler;
