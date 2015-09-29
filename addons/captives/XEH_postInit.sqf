#include "script_component.hpp"


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

["zeusDisplayChanged",   {_this call FUNC(handleZeusDisplayChanged)}] call EFUNC(common,addEventHandler);
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);
["MoveInCaptive", {_this call FUNC(vehicleCaptiveMoveIn)}] call EFUNC(common,addEventHandler);
["MoveOutCaptive", {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);

["SetHandcuffed", {_this call FUNC(setHandcuffed)}] call EFUNC(common,addEventHandler);
["SetSurrendered", {_this call FUNC(setSurrendered)}] call EFUNC(common,addEventHandler);

//Medical Integration Events???
["medical_onUnconscious", {_this call ACE_Captives_fnc_handleOnUnconscious}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitWith {};

["isNotEscorting", {!(GETVAR(_this select 0,GVAR(isEscorting),false))}] call EFUNC(common,addCanInteractWithCondition);
["isNotHandcuffed", {!(GETVAR(_this select 0,GVAR(isHandcuffed),false))}] call EFUNC(common,addCanInteractWithCondition);
["isNotSurrendering", {!(GETVAR(_this select 0,GVAR(isSurrendering),false))}] call EFUNC(common,addCanInteractWithCondition);
