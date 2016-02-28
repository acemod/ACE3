#include "script_component.hpp"

disableSerialization;

params ["_display"];

_display displayAddEventHandler ["KeyDown", {
    if ((_this select 1) in actionKeys "ReloadMagazine") then {
        if (isNull ACE_player || {!alive ACE_player}) exitWith {false};

        private _weapon = currentWeapon ACE_player;

        if (_weapon != "") then {
            GVAR(ReloadMutex) = false;

            private _gesture  = getText (configfile >> "CfgWeapons" >> _weapon >> "reloadAction");
            private _isLauncher = _weapon isKindOf ["Launcher", configFile >> "CfgWeapons"];
            private _config = ["CfgGesturesMale", "CfgMovesMaleSdr"] select _isLauncher;
            private _duration = getNumber (configfile >> _config >> "States" >> _gesture >> "speed");

            if (_duration != 0) then {
                _duration = if (_duration < 0) then { abs _duration } else { 1 / _duration };
            } else {
                _duration = 3;
            };

            TRACE_2("Reloading, blocking gestures",_weapon,_duration);
            [{GVAR(ReloadMutex) = true;}, [], _duration] call EFUNC(common,waitAndExecute);
        };
    };
    false
}];
