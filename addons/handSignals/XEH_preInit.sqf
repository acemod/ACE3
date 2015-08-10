#include "script_component.hpp"

ADDON = false;

PREP(playSignal);

ADDON = true;


if !(hasInterface) exitWith {};

// reload mutex, you can't play signal while reloading
CRP_var_ThsReloadMutex = true;

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

{
    _x params ["_currentName","_Key"];
    _code = (compile format [QUOTE('%1' call FUNC(playSignal)),QGVAR(ani_%2), _currentName]);
    [
        "ACE Hand Signals",
        _currentName,
        format ["%1 %2", localize format[LSTRING(%1), _currentName],localize LSTRING(FREELOOK)],
        _code,
        {},
        [_Key, [false, true, false]],
        false
    ] call cba_fnc_addKeybind;
    if (56 in (actionKeys "LookAround")) then {
        [
            "ACE Hand Signals",
            _currentName + "ALT",
            localize format[LSTRING(%1), _currentName],
            _code,
            {},
            [_Key, [false, true, true]],
            false
        ] call cba_fnc_addKeybind;
    };
    true
} count [
    ["STOP", DIK_2],
    ["COVERS", DIK_3],
    ["FORWARD", DIK_4],
    ["REGROUP", DIK_5],
    ["ENGAGE", DIK_6],
    ["POINT", DIK_7],
    ["HOLD", DIK_8],
    ["WARNING", DIK_9]
];

[{
    if (isNull (findDisplay 46)) exitWith {};
        // handle reloading
        GVAR(ReloadMutex) = true;
        (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1) in actionKeys "ReloadMagazine") then {
            _weapon = currentWeapon ACE_player;

            if (_weapon != "") then {
                GVAR(ReloadMutex) = false;

                _gesture    = getText (configfile >> "CfgWeapons" >> _this >> "reloadAction");
                _isLauncher    = "Launcher" in ([configFile >> "CfgWeapons" >> _this, true] call BIS_fnc_returnParents);
                _config        = if (_isLauncher) then { "CfgMovesMaleSdr" } else { "CfgGesturesMale" };
                _duration    = getNumber (configfile >> _config >> "States" >> _gesture >> "speed");

                if (_duration != 0) then {
                    _duration = if (_duration < 0) then { abs _duration } else { 1 / _duration };
                } else {
                    _duration = 3;
                };

                [{GVAR(ReloadMutex) = true;}, [], _duration] call EFUNC(common,waitAndExecute);
            };
        };
        false
        }];
    [_this select 1] call CBA_fnc_removePerFrameHandler;
}, 0,[]] call CBA_fnc_addPerFrameHandler;
