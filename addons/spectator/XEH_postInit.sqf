#include "script_component.hpp"


// Add interaction menu exception
["isNotSpectating", {!((_this select 0) getVariable [QGVAR(isSpectator), false])}] call EFUNC(common,addCanInteractWithCondition);

// Run spectator framework if enabled
["SettingsInitialized", {
    if !GVAR(enabled) exitWith {};

    //check if respawn is set up properly
    _fail = if (getNumber (missionConfigFile >> "respawn") != 3 && getText (missionConfigFile >> "respawn") != "Base") then {true} else {false};
    if (_fail) exitWith {
        _errorMsg = "This mission does not have respawn set up properly. Add 'respawn=3' or 'respawn=""BASE""' to description.ext.";
        ["[ACE_Spectator] ERROR", _errorMsg, {}] call EFUNC(common,errorMessage);
        diag_log text format ["[ACE_Spectator] ERROR: %1", _errorMsg];
    };

    if (GVAR(endMission) && isServer) then {
        [{
            if ({(isPlayer _x) && (alive _x) && !(_x getVariable [QGVAR(isSpectator), false])} count allUnits == 0) then {
                [["endDeath", false], "BIS_fnc_endMission"] call BIS_fnc_MP;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        }, 2] call CBA_fnc_addPerFrameHandler;
    };

    if !(hasInterface) exitWith {};

    if GVAR(tracking) then {
        [FUNC(checkUnits), 2] call CBA_fnc_addPerFrameHandler;
        [FUNC(trackUnits), 20] call CBA_fnc_addPerFrameHandler;
    };

    player addEventHandler ["Killed", {
        [player] joinSilent grpNull;
        if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {EGVAR(hearing,disableVolumeUpdate) = true};
        _delay = getNumber (missionConfigFile >> "respawnDelay");
        _delay fadeSound 0;
        999999 cutText ["", "BLACK", _delay];
    }];

    player addEventHandler ["Respawn", FUNC(setSpectator)];

    #include "initKeybinds.sqf";

}] call EFUNC(common,addEventHandler);
