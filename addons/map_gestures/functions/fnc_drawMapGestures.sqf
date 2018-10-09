#include "script_component.hpp"
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

BEGIN_COUNTER(draw);

#define ICON_RENDER_SIZE 55
#define ICON_TEXT_ALIGN "left"
#define ICON_ANGLE 0
#define ICON_SHADOW 1
#define TEXT_FONT "RobotoCondensedBold"
#define TEXT_ICON_RENDER_SIZE 20
#define TEXT_SIZE 0.030
#define TEXT_SHADOW 0

if (!GVAR(enabled) || !visibleMap) exitWith {};

params ["_mapHandle"];

// Iterate over all nearby players and render their pointer if player is transmitting.
{

    // Only render if the unit is alive and transmitting
    if (alive _x && {_x getVariable [QGVAR(Transmit), false]}) then {

        private _pos = _x getVariable [QGVAR(pointPosition), [0,0,0]];

        private _group = group _x;
        private _grpName = groupID _group;

        // If color settings for the group exist, then use those, otherwise fall back to the default colors
        private _colorMap = GVAR(GroupColorCfgMappingNew) getVariable _grpName;
        private _color = if (isNil "_colorMap") then {
            [GVAR(defaultLeadColor), GVAR(defaultColor)] select (_x != leader _group);
        } else {
            _colorMap select (_x != leader _group);
        };

        TRACE_2("",_colorMap,_color);
        
        // Render icon and player name
        _mapHandle drawIcon ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _color, _pos, ICON_RENDER_SIZE, ICON_RENDER_SIZE, ICON_ANGLE, "", ICON_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
        _mapHandle drawIcon ["#(argb,8,8,3)color(0,0,0,0)", GVAR(nameTextColor), _pos, TEXT_ICON_RENDER_SIZE, TEXT_ICON_RENDER_SIZE, ICON_ANGLE, name _x, TEXT_SHADOW, TEXT_SIZE, TEXT_FONT, ICON_TEXT_ALIGN];
    };
    nil
} count ([ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers));

END_COUNTER(draw);
