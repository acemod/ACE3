//fnc_probe.sqf
#include "script_component.hpp"

private ["_nearestObjects", "_actionObject", "_x", "_actionData", "_renderData", "_actionItem", "_active", "_renderItem", "_object", "_forEachIndex"];
if(!GVAR(keyDown)) then {
    _nearestObjects = nearestObjects [(getPos player), ["All"], 100];

    GVAR(toRender) = [];
    {
        _actionObject = _x;
        _actionData = _actionObject getVariable [QUOTE(GVAR(actionData)), []];
        
        if((count _actionData) > 0) then {
            _renderData = [];
            {
                _actionItem = _x;
                this = _actionObject;
                _target = _actionObject;
                _player = ACE_player;
                _active = [_target, ACE_player] call (_actionItem select 4);
                // player sideChat format["_active: %1 %2", _actionItem select 0, _active];
                if(_active) then {
                    _renderItem = +_actionItem;
                    _renderItem set[4, true];
                    _renderData set[(count _renderData), _renderItem];
                };
            } forEach _actionData;
            if((count _renderData) > 0) then {
                GVAR(toRender) set[(count GVAR(toRender)), [_actionObject, _renderData]];
            };
        };
    } forEach _nearestObjects;
    // player sideChat format["p: %1", count GVAR(toRender)];
} else {
    GVAR(filter) = [];
    {
        _object = _x select 0;
        if(_object distance player > 100) then {
            GVAR(filter) set[(count GVAR(filter)), _forEachIndex];
        };
    } forEach GVAR(toRender);
};
