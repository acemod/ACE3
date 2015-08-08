/*
 * Author: MikeMatrix
 * Receives and draws map gestures from nearby players.
 *
 * Arguments:
 * 0: Map Handle <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 12 displayCtrl 51] call ace_map_gesutres_fnc_drawMapGestures
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};
if (!visibleMap) exitWith {};

params ["_mapHandle"];

_nearDudes = [ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers);
{
    _nameSane = [name _x] call FUNC(sanitizeName);
    _drawPosVariableName = format [QGVAR(%1_DrawPos), _nameSane];
    if (!isNil _drawPosVariableName) then {
        _pos = call compile _drawPosVariableName;
        if (alive _x &&
            (_pos distance [0, 0, 0]) > 50 &&
            {_x getVariable QGVAR(Transmit)}) then {
            _group = group _x;
            _grpName = groupID _group;

            _color = [1, 1, 1, 1];
            if (_grpName in GVAR(GroupColorConfigurationsGroups)) then {
                _grpNameIndex = GVAR(GroupColorConfigurationsGroups) find _grpName;
                _color = (GVAR(GroupColorConfigurations) select (GVAR(GroupColorConfigurationsGroupIndex) select _grpNameIndex)) select (_x != leader _group);
            } else {
                _color = if (_x == leader _group) then {GVAR(defaultLeadColor)} else {GVAR(defaultColor)};
            };

            _mapHandle drawIcon ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _color, _pos, 55, 55, 0, "", 1, 0.030, "PuristaBold", "left"];
            _mapHandle drawIcon ["#(argb,8,8,3)color(0,0,0,0)", [.2,.2,.2,.3], _pos, 20, 20, 0, name _x, 0, 0.030, "PuristaBold", "left"];
        };
    };
    nil
} count _nearDudes;
