#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Receives and draws map gestures from nearby players.
 *
 * Arguments:
 * 0: Map Handle <CONTROL>
 * 1: Positions (objects or posAGLs) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 12 displayCtrl 51, [player]] call ace_map_gestures_fnc_drawMapGestures
 *
 * Public: No
 */


BEGIN_COUNTER(draw);

#define ICON_RENDER_SIZE 55
#define ICON_TEXT_ALIGN "left"
#define ICON_ANGLE 0
#define ICON_SHADOW 1
#define TEXT_FONT "RobotoCondensedBold"
#define TEXT_ICON_RENDER_SIZE 20
#define TEXT_SIZE 0.030
#define TEXT_SHADOW 0

if (!GVAR(enabled)) exitWith {};

params ["_mapHandle", "_positions"];

private _players = [[_positions, GVAR(maxRange)], FUNC(getProximityPlayers), missionNamespace, QGVAR(proximityPlayersCache), 1] call EFUNC(common,cachedCall);
// Iterate over all nearby players and render their pointer if player is transmitting.
{
    private _pos = _x getVariable QGVAR(pointPosition);
    // Only render if the unit is alive and transmitting
    if (alive _x && { !isNil "_pos" }) then {
        if (_x == ACE_player && { !isNil QGVAR(cursorPosition) }) then {
            _pos = GVAR(cursorPosition);
        };

        // If color settings for the group exist, then use those, otherwise fall back to the default colors
        private _colorMap = GVAR(GroupColorCfgMappingNew) getVariable [(groupID (group _x)), [GVAR(defaultLeadColor), GVAR(defaultColor)]];
        private _color = _colorMap select (_x != leader _x);

        TRACE_2("",_colorMap,_color);

        // Render icon and player name
        _mapHandle drawIcon ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _color, _pos, ICON_RENDER_SIZE, ICON_RENDER_SIZE, ICON_ANGLE, "", ICON_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
        _mapHandle drawIcon ["#(argb,8,8,3)color(0,0,0,0)", GVAR(nameTextColor), _pos, TEXT_ICON_RENDER_SIZE, TEXT_ICON_RENDER_SIZE, ICON_ANGLE, name _x, TEXT_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
    };
} forEach _players;

END_COUNTER(draw);
