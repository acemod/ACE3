#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the menu display
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Menu Item Needs Updating <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display, true] call ace_xm157_fnc_weaponInfo_drawMenu
 *
 * Public: No
 */

params ["_display", "_needsUpdate"];

if (isNil QGVAR(menu)) then {
    private _arrayUp = {
        params ["", "_var", "_thing"];
        private _value = GVAR(data) getOrDefault [_var, 0];
        _value = (_value + 1 + count _thing) % count _thing;
        GVAR(data) set [_var, _value];
    };
    private _arrayDown = {
        params ["", "_var", "_thing"];
        private _value = GVAR(data) getOrDefault [_var, 0];
        _value = (_value - 1 + count _thing) % count _thing;
        GVAR(data) set [_var, _value];
    };
    private _rangeUp = {
        private _range = GVAR(data) getOrDefault ["range", -1];
        if (_range < 0) then { _range = 0; };
        _range = RANGEFINDER_MAX min (100 + 100 * floor (_range/100));
        GVAR(data) set ["range", _range];
    };
    private _rangeDown = {
        private _range = GVAR(data) getOrDefault ["range", -1];
        if (_range < 0) then { _range = 0; };
        _range = 0 max (-100 + 100 * ceil (_range/100));
        GVAR(data) set ["range", _range];
    };
    private _atmosphereInfo = {
        private _altitude = (getPosASL ace_player) select 2;
        private _relativeHumidity = EGVAR(weather,currentHumidity);
        private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
        private _barometricPressure = _altitude call EFUNC(weather,calculateBarometricPressure); // hPA
        format ["%1%2  %3%4  %5hPA", _temperature toFixed 1, "°C", _relativeHumidity toFixed 1, "%", _barometricPressure toFixed 0]
    };
    GVAR(menu) = [
        ["", "", [""], _rangeUp, _rangeDown],
        ["Wind Speed (m/s)", "wind_speed", ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"], _arrayUp, _arrayDown],
        ["Wind Direction", "wind_dir", ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"], _arrayUp, _arrayDown],
        // ["CQB Reticle", "reticle_cqb", ["2 MOA Red Dot", "4 MOA Red Dot", "Off"], _arrayUp, _arrayDown],
        ["Bearing Display", "bearing_show", ["Degrees", "Mils", "Off"], _arrayUp, _arrayDown],
        ["Atmosphere", "", _atmosphereInfo, {}, {}]
    ];
};


private _index = GVAR(data) getOrDefault ["menu_index", 0];
(GVAR(menu) # _index) params ["_title", "_var", "_thing"];
if ((!_needsUpdate) && {_thing isEqualType []}) exitWith {};

private _ctrlMenuText = _display displayCtrl IDC_SCREEN_MENU_TEXT;
private _text = "";
if (_index != 0) then {
    if (_thing isEqualType []) then {
        GVAR(data) set ["menu_updated", false];
        private _value = GVAR(data) getOrDefault [_var, 0];
        _text = _title + "\n" + "<" + (_thing param [_value, "#BadIndex"]) + ">";
    } else {
        _text = _title + "\n" + ([_var] call _thing);
    };
};
_ctrlMenuText ctrlSetText _text;

GVAR(data) set ["menu_updated", false];
