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
_mouseover = ["",[]];
{
    // draw the icon
    private ["_callsign","_pos","_tex","_sizeTex"];
    _callsign = AD_GET_CALLSIGN(_x);
    _pos = +AD_GET_POSITION(_x);
    _tex = AD_GET_TYPEICON(_x);
    _sizeTex = AD_GET_SIZEICON(_x);
    _color = AD_GET_COLOR(_x);

    private "_size";
    _size = MAP_ICON_SIZE; // * ([_x select 2] call FUNC(size_indexToMultiplier));
    if ((_pos distance (_ctrl ctrlMapScreenToWorld GVAR(mousepos))) / _size < 0.0007) then {
        _size = _size * 1.5;
        _mouseover = [0,+_x];
    };

    _ctrl drawIcon [_tex,_color,_pos,_size,_size,0,"",0,0.05,"TahomaB","right"];
    _ctrl drawIcon [_sizeTex,[COLOR_BLACK],_pos,_size,_size,0,"",1,0,"TahomaB","right"];
    // --- ToDo: make setting for displaying title
    // --- ToDo: make setting for font size
} forEach EGVAR(BFT_DATA_ADDON,availableDevices);

{
    // --- ToDo
} forEach EGVAR(BFT_DATA_ADDON,saluteReports);

// Show the spotrep
GVAR(mouseover) = _mouseover;
if (count (_mouseover select 1) != 0) then {
    private ["_deviceData","_pos"];
    _deviceData = _mouseover select 1;
    _pos = +(GVAR(mousepos));
    _pos set [1,(_pos select 1)+0.1];

    switch (_mouseover select 0) do {
        case 0: {
            private ["_callsign","_type","_sizeName"];
            _callsign = AD_GET_CALLSIGN(_deviceData);
            _sizeName = "";// DEV_GETSIZE(_deviceData);

            private "_display";
            _display = ctrlParent _ctrl;
            [_display,_callsign,_sizeName,""] call FUNC(tt_setText);
            [_display,_pos] call FUNC(tt_setPos);
        };
    };
};
