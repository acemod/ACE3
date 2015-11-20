#include "script_component.hpp"

if (!hasInterface) exitWith {};

#include "key.sqf"

// reload mutex, you can't play signal while reloading
GVAR(ReloadMutex) = true;

// Event for main display to be loaded:
["mainDisplayLoaded", {
    // handle reloading
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1) in actionKeys "ReloadMagazine") then {
            if ((isNull ACE_player) || {!alive ACE_player}) exitWith {false};
            private _weapon = currentWeapon ACE_player;

            if (_weapon != "") then {
                GVAR(ReloadMutex) = false;

                private _gesture  = getText (configfile >> "CfgWeapons" >> _weapon >> "reloadAction");
                private _isLauncher = _weapon isKindOf ["Launcher", (configFile >> "CfgWeapons")];
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
}] call EFUNC(common,addEventHandler);
