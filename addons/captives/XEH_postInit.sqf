#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["ace_settingsInitialized", {
    // Hold on a little bit longer to ensure anims will work
    [{
        GVAR(captivityEnabled) = true;
    }, [], 0.05] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

//Handles when someone starts escorting and then disconnects, leaving the captive attached
//This is normaly handled by the PFEH in doEscortCaptive, but that won't be running if they DC

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_disconnectedPlayer"];
        private _escortedUnit = _disconnectedPlayer getVariable [QGVAR(escortedUnit), objNull];
        if ((!isNull _escortedUnit) && {(attachedTo _escortedUnit) == _disconnectedPlayer}) then {
            detach _escortedUnit;
        };
        if (_disconnectedPlayer getVariable [QGVAR(isEscorting), false]) then {
            _disconnectedPlayer setVariable [QGVAR(isEscorting), false, true];
        };
    }];
};

["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
[QGVAR(moveInCaptive), FUNC(vehicleCaptiveMoveIn)] call CBA_fnc_addEventHandler;
[QGVAR(moveOutCaptive), FUNC(vehicleCaptiveMoveOut)] call CBA_fnc_addEventHandler;

[QGVAR(setHandcuffed), FUNC(setHandcuffed)] call CBA_fnc_addEventHandler;
[QGVAR(setSurrendered), FUNC(setSurrendered)] call CBA_fnc_addEventHandler;

//Medical Integration Events
["ace_unconscious", FUNC(handleOnUnconscious)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

["ACE3 Common", QGVAR(captives), [(localize LSTRING(SetCaptive)), (localize LSTRING(KeyComb_description))],
{
    private _target = cursorObject;
    if !([ACE_player, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if !(_target isKindOf "CAManBase") exitWith {false};
    if ((_target distance ACE_player) > getNumber (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_Actions" >> "ACE_ApplyHandcuffs" >> "distance")) exitWith {false};

    if ([ACE_player, _target] call FUNC(canApplyHandcuffs)) exitWith {
        [ACE_player, _target] call FUNC(doApplyHandcuffs);
        true
    };
    false
},
{false},
[DIK_F1, [true, false, false]], true] call CBA_fnc_addKeybind; // Shift + F1

["isNotEscorting", {!GETVAR(_this select 0,GVAR(isEscorting),false)}] call EFUNC(common,addCanInteractWithCondition);
["isNotHandcuffed", {!GETVAR(_this select 0,GVAR(isHandcuffed),false)}] call EFUNC(common,addCanInteractWithCondition);
["isNotSurrendering", {!GETVAR(_this select 0,GVAR(isSurrendering),false)}] call EFUNC(common,addCanInteractWithCondition);
