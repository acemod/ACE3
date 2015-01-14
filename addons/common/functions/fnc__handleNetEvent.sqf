//fnc__handleNetEvent.sqf
// internal handler for net events
#include "script_component.hpp"

private ["_eventType", "_event", "_eventName", "_eventArgs", "_eventNames", "_eventIndex", "_eventTargets", "_sentEvents", "_owner", "_serverFlagged"];

_eventType = _this select 0;
_event = _this select 1;


if(_eventType == "ACEg") then {
    _eventName = _event select 0;
    _eventArgs = _event select 1;
    
    _eventNames = GVAR(netEvents) select 0;
    _eventIndex = _eventNames find _eventName;
    if(_eventIndex != -1) then {
        _events = (GVAR(netEvents) select 1) select _eventIndex;
        {
            if(!isNil "_x") then {
                _eventArgs call CALLSTACK_NAMED(_x, format[ARR_3("Net Event %1 ID: %2",_eventName,_forEachIndex)]);
            };
        } forEach _events;
    };
};

if(_eventType == "ACEc") then {
    if(isServer) then {
        _eventName = _event select 0;
        _eventTargets = _event select 1;
        _eventArgs = _event select 2;
        
        _sentEvents = [];
        if(!IS_ARRAY(_eventTargets)) then {
            _eventTargets = [_eventTargets];
        };
        _serverFlagged = false;
        {
            _owner = _x;
            if(IS_OBJECT(_x)) then {
                 _owner = owner _x;
            };
            if(!(_owner in _sentEvents)) then {
                PUSH(_sentEvents, _owner);
                ACEg = [_eventName, _eventArgs];
                if(isDedicated || {_x != ACE_player}) then {
                    if(isDedicated && {local _x} && {!_serverFlagged}) then {
                        _serverFlagged = true;
                        ["ACEg", ACEg] call FUNC(_handleNetEvent);
                    } else {
                        _owner publicVariableClient "ACEg";
                    };
                } else {
                    ["ACEg", ACEg] call FUNC(_handleNetEvent);
                };
            };
        } forEach _eventTargets;
    };
};