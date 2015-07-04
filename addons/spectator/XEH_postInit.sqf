#include "script_component.hpp"

["SettingsInitialized", {
    if !GVAR(enabled) exitWith {};

    //check if respawn is set up properly
    _fail = if (getNumber (missionConfigFile >> "respawn") != 3 && getText (missionConfigFile >> "respawn") != "Base") then {true} else {false};
    if (_fail) exitWith {
        _text = "[ACE_Spectator] ERROR: This mission does not have respawn set up properly. Add 'respawn=3' or 'respawn=""BASE""' to description.ext.";
        systemChat _text;
        diag_log text _text;
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

    GVAR(playerSide) = side (group player);

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
