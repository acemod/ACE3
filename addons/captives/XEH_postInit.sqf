#include "script_component.hpp"

["SettingsInitialized", {
    // Hold on a little bit longer to ensure anims will work
    [{
        GVAR(captivityEnabled) = true;
    }, [], 0.05] call CFUNC(waitAndExecute);
}] call CFUNC(addEventHandler);

//Handles when someone starts escorting and then disconnects, leaving the captive attached
//This is normaly handled by the PFEH in doEscortCaptive, but that won't be running if they DC

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_disconnectedPlayer"];
        private "_escortedUnit";
        _escortedUnit = _disconnectedPlayer getVariable [QGVAR(escortedUnit), objNull];
        if ((!isNull _escortedUnit) && {(attachedTo _escortedUnit) == _disconnectedPlayer}) then {
            detach _escortedUnit;
        };
        if (_disconnectedPlayer getVariable [QGVAR(isEscorting), false]) then {
            _disconnectedPlayer setVariable [QGVAR(isEscorting), false, true];
        };
    }];
};

["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CFUNC(addEventhandler);
["MoveInCaptive", {_this call FUNC(vehicleCaptiveMoveIn)}] call CFUNC(addEventHandler);
["MoveOutCaptive", {_this call FUNC(vehicleCaptiveMoveOut)}] call CFUNC(addEventHandler);

["SetHandcuffed", {_this call FUNC(setHandcuffed)}] call CFUNC(addEventHandler);
["SetSurrendered", {_this call FUNC(setSurrendered)}] call CFUNC(addEventHandler);

//Medical Integration Events
["medical_onUnconscious", {_this call ACE_Captives_fnc_handleOnUnconscious}] call CFUNC(addEventHandler);

if (!hasInterface) exitWith {};

["isNotEscorting", {!(GETVAR(_this select 0,GVAR(isEscorting),false))}] call CFUNC(addCanInteractWithCondition);
["isNotHandcuffed", {!(GETVAR(_this select 0,GVAR(isHandcuffed),false))}] call CFUNC(addCanInteractWithCondition);
["isNotSurrendering", {!(GETVAR(_this select 0,GVAR(isSurrendering),false))}] call CFUNC(addCanInteractWithCondition);
