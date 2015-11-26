#include "script_component.hpp"

if (!hasInterface) exitWith {};


["SettingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    //Start on ACE_player
    if (!isNull ACE_player) then {
        [ACE_player] call FUNC(legacyFatigue);
        ACE_LOGINFO("Starting fatigue on %1", _newPlayer);
    };

    //Add EH for ACE_player change
    ["playerChanged", {
        params ["_newPlayer","_oldPlayer"];
        if (!isNull _oldPlayer) then {

        };
        if (!isNull _newPlayer) then {
            ACE_LOGINFO("Starting fatigue on %1", _newPlayer);
            [_newPlayer] call FUNC(legacyFatigue);
        };
    }] call EFUNC(common,addEventHandler);

}] call EFUNC(common,addEventHandler);
