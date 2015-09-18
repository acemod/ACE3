/*
 * Author: jaynus
 * Internal net event handler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_eventType", "_event"];

if (_eventType == "ACEg") then {
    _event params ["_eventName", "_eventArgs"];

    private ["_eventNames", "_eventIndex"];

    _eventNames = GVAR(events) select 0;
    _eventIndex = _eventNames find _eventName;

    if (_eventIndex != -1) then {
        private "_events";
        _events = (GVAR(events) select 1) select _eventIndex;

        #ifdef DEBUG_EVENTS
            ACE_LOGINFO_1("* Net Event %1",_eventName);
            ACE_LOGINFO_1("    args=%1",_eventArgs);
        #endif

        {
            if (!isNil "_x") then {
                _eventArgs call CALLSTACK_NAMED(_x, FORMAT_2("Net Event %1 ID: %2",_eventName,_forEachIndex));
                #ifdef DEBUG_EVENTS_CALLSTACK
                    ACE_LOGINFO_1("    ID: %1",_forEachIndex);
                #endif
            };
        } forEach _events;
    };
};

if (_eventType == "ACEc") then {
    if (isServer) then {
        _event params ["_eventName", "_eventTargets", "_eventArgs"];

        private ["_sentEvents", "_owner", "_serverFlagged"];

        _sentEvents = [];
        if (!IS_ARRAY(_eventTargets)) then {
            _eventTargets = [_eventTargets];
        };

        //If not multiplayer, and there are targets, then just run localy
        if (!isMultiplayer && {count _eventTargets > 0}) exitWith {
            ACEg = [_eventName, _eventArgs];
            ["ACEg", ACEg] call FUNC(_handleNetEvent);
        };

        _serverFlagged = false;
        {
            _owner = _x;
            if (IS_OBJECT(_x)) then {
                _owner = owner _x;
            };
            if !(_owner in _sentEvents) then {
                _sentEvents pushBack _owner;
                ACEg = [_eventName, _eventArgs];

                if (isDedicated || {_x != ACE_player}) then {
                    if (isDedicated && {local _x} && {!_serverFlagged}) then {
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
