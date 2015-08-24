/*
 * Author: Dslyecxi, MikeMatrix
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

#define ICON_RENDER_SIZE 55
#define ICON_TEXT_ALIGN "left"
#define ICON_ANGLE 0
#define ICON_SHADOW 1
#define TEXT_FONT "PuristaBold"
#define TEXT_ICON_RENDER_SIZE 20
#define TEXT_SIZE 0.030
#define TEXT_SHADOW 0

if (!GVAR(enabled) || !visibleMap) exitWith {};

params ["_mapHandle"];

// Iterate over all nearby players and render their pointer if player is transmitting.
{
    // Data variable name for unit
    _unitUID = getPlayerUID _x;
    _drawPosVariableName = if (!isNil "_unitUID" && _unitUID != "") then {format [QGVAR(%1_DrawPos), _unitUID]} else {nil};

    if (!isNil "_drawPosVariableName") then {
        if (isNil {missionNamespace getVariable _drawPosVariableName}) then {missionNamespace setVariable [_drawPosVariableName, [1, 1, 1]];};
        _pos = missionNamespace getVariable _drawPosVariableName;

        // Only render if the unit is alive and transmitting
        if (alive _x && {_x getVariable QGVAR(Transmit)}) then {
            _group = group _x;
            _grpName = groupID _group;

            // If color settings for the group exist, then use those, otherwise fall back to the default colors
            _color = if (_grpName in GVAR(GroupColorConfigurationsGroups)) then {
                _grpNameIndex = GVAR(GroupColorConfigurationsGroups) find _grpName;
                (GVAR(GroupColorConfigurations) select (GVAR(GroupColorConfigurationsGroupIndex) select _grpNameIndex)) select (_x != leader _group)
            } else {
                if (_x == leader _group) then {GVAR(defaultLeadColor)} else {GVAR(defaultColor)};
            };

            // Render icon and player name
            _mapHandle drawIcon ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _color, _pos, ICON_RENDER_SIZE, ICON_RENDER_SIZE, ICON_ANGLE, "", ICON_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
            _mapHandle drawIcon ["#(argb,8,8,3)color(0,0,0,0)", [.2,.2,.2,.3], _pos, TEXT_ICON_RENDER_SIZE, TEXT_ICON_RENDER_SIZE, ICON_ANGLE, name _x, TEXT_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
        };
    };
    nil
} count ([ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers));
