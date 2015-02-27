/*
 * Author: NouberNou and CAA-Picard
 * Render all available nearby interactions
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_cursorPos1", "_cursorPos2", "_cursorVec", "_p1", "_p2", "_p", "_v", "_cp", "_forEachIndex", "_renderTargets", "_x", "_cursorScreenPos", "_closestDistance", "_closestSelection", "_pos", "_sPos", "_disSq", "_closest", "_cTime", "_delta", "_foundTarget", "_misMatch", "_hoverPath", "_i"];
_foundTarget = false;
_cursorPos1 = positionCameraToWorld [0, 0, 0];
_cursorPos2 = positionCameraToWorld [0, 0, 2];

GVAR(currentOptions) = [];

private ["_actionsVarName","_classActions","_objectActions","_target","_player","_actionItem","_active"];
if (GVAR(keyDown)) then {
    [] call FUNC(updateVecLineMap);

    // Render all nearby interaction menus
    _nearestObjects = nearestObjects [(getPos ACE_player), ["All"], 15];
    {
        _target = _x;
        _player = ACE_player;

        // Iterate through object actions, find base level actions and render them if appropiate
        _actionsVarName = format [QGVAR(Act_%1), typeOf _target];
        GVAR(objectActions) = _target getVariable [QGVAR(actions), []];
        {
            _actionItem = _x;
            // Only render them directly if they are base level actions
            if (count (_actionItem select 8) == 1) then {
                _active = [_target, ACE_player] call (_actionItem select 4);

                if (_active) then {
                    GVAR(renderDepth) = 0;
                    [_target, _actionItem, 0, [180, 360]] call FUNC(renderMenu);
                };
            };
        } forEach GVAR(objectActions);

        // Iterate through base level class actions and render them if appropiate
        _classActions = missionNamespace getVariable [_actionsVarName, []];
        {
            _actionItem = _x;
            _active = [_target, ACE_player] call (_actionItem select 4);

            if (_active) then {
                GVAR(renderDepth) = 0;
                [_target, _actionItem, 0, [180, 360]] call FUNC(renderMenu);
            };
        } forEach _classActions;



    } forEach _nearestObjects;

} else {
    if (GVAR(keyDownSelfAction)) then {

        [] call FUNC(updateVecLineMap);

        // Render only the self action menu
        _target = vehicle ACE_player;
        _player = ACE_player;

        // Iterate through object actions, find base level actions and render them if appropiate
        _actionsVarName = format [QGVAR(SelfAct_%1), typeOf _target];
        GVAR(objectActions) = _target getVariable [QGVAR(selfActions), []];
        {
            _actionItem = _x;
            // Only render them directly if they are base level actions
            if (count (_actionItem select 8) == 1) then {
                _active = [_target, ACE_player] call (_actionItem select 4);

                if (_active) then {
                    GVAR(renderDepth) = 0;
                    [_target, _actionItem, 0, [180, 360]] call FUNC(renderMenu);
                };
            };
        } forEach GVAR(objectActions);

        // Iterate through base level class actions and render them if appropiate
        _actionsVarName = format [QGVAR(SelfAct_%1), typeOf _target];
        _classActions = missionNamespace getVariable [_actionsVarName, []];
        {
            _actionItem = _x;
            _active = [_target, ACE_player] call (_actionItem select 4);

            if (_active) then {
                GVAR(renderDepth) = 0;
                _pos = (ACE_player modelToWorld (ACE_player selectionPosition "spine3")) vectorAdd GVAR(selfMenuOffset) vectorAdd [0,0,0.25];
                [ACE_player, _actionItem, 0, [180, 360], _pos] call FUNC(renderMenu);
            };
        } forEach _classActions;
    };
};


if(GVAR(keyDown) || GVAR(keyDownSelfAction)) then {
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selected_ca.paa", [1,0,0,1], _cursorPos2, 1, 1, 0, "", 0.5, 0.025, "TahomaB"];

    _cursorScreenPos = worldToScreen _cursorPos2;
    _closestDistance = 1000000;
    _closestSelection = -1;
    {
        _pos = _x select 1;
        _sPos = worldToScreen _pos;
        if(count _sPos > 0) then {
            _disSq = (((_cursorScreenPos select 0) - (_sPos select 0))^2 + ((_cursorScreenPos select 1) - (_sPos select 1))^2);
            if(_disSq < 0.0125 && _disSq < _closestDistance) then {
                _closestDistance = _disSq;
                _closestSelection = _forEachIndex;
            };
        };
    } forEach GVAR(currentOptions);


    if(_closestSelection == -1) exitWith {};

    _closest = GVAR(currentOptions) select _closestSelection;

    _pos = _closest select 1;
    _cTime = diag_tickTime;
    _delta = _cTime - GVAR(lastTime);
    GVAR(lastTime) = _cTime;
    GVAR(rotationAngle) = GVAR(rotationAngle) + (180*_delta);
    if(GVAR(rotationAngle) > 360) then {
        GVAR(rotationAngle) = GVAR(rotationAngle) - 360;
    };
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,.75], _pos, 0.6*SafeZoneW, 0.6*SafeZoneW, GVAR(rotationAngle), "", 0.5, 0.025, "TahomaB"];
    _foundTarget = true;
    GVAR(actionSelected) = true;
    GVAR(selectedTarget) = (_closest select 0) select 0;
    GVAR(selectedAction) = ((_closest select 0) select 1) select 3;
    _misMatch = false;
    _hoverPath = (_closest select 2);
    if((count GVAR(lastPath)) != (count _hoverPath)) then {
        _misMatch = true;
    } else {
        {
            if(_x != (_hoverPath select _forEachIndex)) exitWith {
                _misMatch = true;
            };
        } forEach GVAR(lastPath);
    };

    if(_misMatch) then {
        GVAR(lastPath) = _hoverPath;
        GVAR(startHoverTime) = diag_tickTime;
        GVAR(expanded) = false;
    } else {
        if(!GVAR(expanded) && diag_tickTime-GVAR(startHoverTime) > 0.25) then {
            GVAR(expanded) = true;
            GVAR(menuDepthPath) = +GVAR(lastPath);
        };
    };
    //diag_log format ["GVAR(menuDepthPath): %1", GVAR(menuDepthPath)];

};

if(!_foundTarget && GVAR(actionSelected)) then {
    GVAR(actionSelected) = false;
    GVAR(expanded) = false;
    GVAR(lastPath) = [];
    if(!GVAR(keyDown)) then {
        GVAR(vecLineMap) = [];
    };
};
for "_i" from GVAR(iconCount) to (count GVAR(iconCtrls))-1 do {
    ctrlDelete (GVAR(iconCtrls) select _i);
};
GVAR(iconCtrls) resize GVAR(iconCount);
GVAR(iconCount) = 0;
