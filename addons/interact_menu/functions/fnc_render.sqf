/*
 * Author: NouberNou and esteldunedain
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
 #define ENABLE_PERFORMANCE_COUNTERS 
#include "script_component.hpp"

BEGIN_COUNTER(fnc_render);

private ["_cursorPos2", "_p1", "_p2", "_forEachIndex", "_x", "_cursorScreenPos", "_closestDistance", "_closestSelection", "_sPos", "_disSq", "_closest", "_cTime", "_delta", "_foundTarget", "_misMatch", "_hoverPath", "_i", "_actionData", "_player", "_target"];

_foundTarget = false;

if (GVAR(openedMenuType) >= 0) then {
    // _cursorPos1 = positionCameraToWorld [0, 0, 2];
    _cursorPos2 = positionCameraToWorld [0, 0, 2];

    // Render all available nearby interactions
    call FUNC(renderActionPoints);

    // Draw the red selector only when there's no cursor
    if !(uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
        [[0.5,0.5], "\a3\ui_f\data\IGUI\Cfg\Cursors\selected_ca.paa"] call FUNC(renderSelector);
    };

    _cursorScreenPos = [worldToScreen _cursorPos2, GVAR(cursorPos)] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);

    _closestDistance = 1000000;
    _closestSelection = -1;
    {
        _sPos = _x select 1;
        _disSq = (((_cursorScreenPos select 0) - (_sPos select 0))^2 + ((_cursorScreenPos select 1) - (_sPos select 1))^2);
        if(_disSq < 0.0125 && _disSq < _closestDistance) then {
            _closestDistance = _disSq;
            _closestSelection = _forEachIndex;
        };
    } forEach GVAR(currentOptions);


    if(_closestSelection == -1) exitWith {};

    _closest = GVAR(currentOptions) select _closestSelection;

    _sPos = _closest select 1;
    _cTime = ACE_diagTime;
    _delta = _cTime - GVAR(lastTime);
    GVAR(lastTime) = _cTime;

    GVAR(rotationAngle) = (GVAR(rotationAngle) + (270*_delta)) mod 360;
    [_sPos, format [QUOTE(PATHTOF(ui\selector%1.paa)), floor (((abs GVAR(rotationAngle)) mod 90) / 6)]] call FUNC(renderSelector);

    _foundTarget = true;
    GVAR(actionSelected) = true;
    GVAR(selectedAction) = (_closest select 0) select 1;
    GVAR(selectedTarget) = (GVAR(selectedAction)) select 2;

    _misMatch = false;
    _hoverPath = (_closest select 2);

    if((count GVAR(lastPath)) != (count _hoverPath)) then {
        _misMatch = true;
    } else {
        {
            if !(_x isEqualTo (_hoverPath select _forEachIndex)) exitWith {
                _misMatch = true;
            };
        } forEach GVAR(lastPath);
    };

    if(_misMatch && {ACE_diagTime-GVAR(expandedTime) > 0.25}) then {
        GVAR(startHoverTime) = ACE_diagTime;
        GVAR(lastPath) = _hoverPath;
        GVAR(expanded) = false;
    } else {
        if(!GVAR(expanded) && ACE_diagTime-GVAR(startHoverTime) > 0.25) then {
            GVAR(expanded) = true;

            // Start the expanding menu animation only if the user is not going up the menu
            if !([GVAR(menuDepthPath),GVAR(lastPath)] call FUNC(isSubPath)) then {
                GVAR(expandedTime) = ACE_diagTime;
            };
            GVAR(menuDepthPath) = +GVAR(lastPath);

            // Execute the current action if it's run on hover
            private "_runOnHover";
            _tmp = ((GVAR(selectedAction) select 0) select 9) select 3;
            _runOnHover = true;
            if ((typeName _tmp) == "CODE" ) then {
                _runOnHover = call _tmp;
            } else {
                if ((typeName _tmp) == "BOOL" ) then {
                    _runOnHover = _tmp;
                } else {
                    _runOnHover = _tmp > 0;
                };
            };
            if (_runOnHover) then {
                this = GVAR(selectedTarget);
                _player = ACE_Player;
                _target = GVAR(selectedTarget);

                // Clear the conditions caches
                ["clearConditionCaches", []] call EFUNC(common,localEvent);

                // Check the action conditions
                _actionData = GVAR(selectedAction) select 0;
                if ([_target, _player, _actionData select 6] call (_actionData select 4)) then {
                    // Call the statement
                    [_target, _player, _actionData select 6] call (_actionData select 3);

                    // Clear the conditions caches again if the action was performed
                    ["clearConditionCaches", []] call EFUNC(common,localEvent);
                };
            };
        };
    };
};

if(!_foundTarget && GVAR(actionSelected)) then {
    GVAR(actionSelected) = false;
    GVAR(expanded) = false;
    GVAR(lastPath) = [];
};
for "_i" from GVAR(iconCount) to (count GVAR(iconCtrls))-1 do {
    ctrlDelete (GVAR(iconCtrls) select _i);
    GVAR(ParsedTextCached) set [_i, ""];
};
GVAR(iconCtrls) resize GVAR(iconCount);
GVAR(iconCount) = 0;

END_COUNTER(fnc_render);
