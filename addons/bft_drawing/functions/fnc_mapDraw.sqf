/*
 * Author: [W] Fett_Li
 * Will be draw eventhandler for the map, display salute reports, blueforcetrackers, etc.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_ctrl","_mouseover"];
_ctrl = _this select 0;
_mouseover = [-1,[]];
{
    // draw the icon
    private ["_callsign","_position","_typeIcon","_sizeIcon","_color"];
    _callsign = if (GVAR(mapDrawText)) then {AD_GET_CALLSIGN(_x)} else {""};
    _position = AD_GET_POSITION(_x);
    _typeIcon = AD_GET_TYPEICON(_x);
    _sizeIcon = AD_GET_SIZEICON(_x);
    _color = AD_GET_COLOR(_x);

    private "_size";
    _size = GVAR(mapIconSize);
    // shouldn't use fixed distance since distance is totally relying on the current zoom level
    if ((_position distance (_ctrl ctrlMapScreenToWorld GVAR(mousepos))) / _size < 0.0007) then {
        // we should probably defer drawing of icons that the mouse is over, since there might be multiple ones and we want the one that is closest to the cursor, so we would need to figure that out later
        _size = _size * 1.5;
        // also change colour, or change colour instead of size?
        _mouseover = [0, _x];
    };
    
    _ctrl drawIcon [_typeIcon, _color, _position, _size, _size, 0, _callsign, 0, GVAR(mapTextSize), "TahomaB", "right"];
    _ctrl drawIcon [_sizeIcon, [COLOR_BLACK], _position, _size, _size, 0, "", 1,0, "TahomaB", "right"];

    // TODO: make setting for displaying title
    // TODO: make setting for font size
} forEach EGVAR(BFT_DATA_ADDON,availableDevices);

{
    // TODO Implement
} forEach EGVAR(BFT_DATA_ADDON,saluteReports);

// Show the spotrep
GVAR(mouseover) = _mouseover;

if (count (_mouseover select 1) > 0) then {
    private ["_deviceData","_pos"];
    _deviceData = _mouseover select 1;
    _mousePosition = +(GVAR(mousepos));
    _mousePosition set [1, (_mousePosition select 1)+0.1];

    switch (_mouseover select 0) do {
        case 0: {
            private ["_callsign","_type","_sizeName"];
            _callsign = AD_GET_CALLSIGN(_deviceData);
            _sizeName = "";// DEV_GETSIZE(_deviceData);

            private "_display";
            _display = ctrlParent _ctrl;
            [_display, _callsign, _sizeName, ""] call FUNC(tt_setText);
            [_display, _mousePosition] call FUNC(tt_setPos);
        };
    };
};
