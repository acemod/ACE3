//fnc_renderIcon.sqf
#include "script_component.hpp"
#define DEFAULT_ICON QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa)
private ["_color", "_pos", "_sPos", "_ctrl", "_icon"];
_text = _this select 0;
_color = _this select 1;
_pos = _this select 2;
_icon = _this select 6;
//systemChat format ["Drawing icon %1", _text];
_sPos = worldToScreen _pos;
// _sPos = _pos;
if(count _sPos > 0) then {
    // player sideChat format["render!"];
    if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
        GVAR(iconCtrls) pushBack ((findDisplay 46) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
    };
    _ctrl = GVAR(iconCtrls) select GVAR(iconCount);
    GVAR(iconCount) = GVAR(iconCount) + 1;
    if(_icon == "") then {
        _icon = DEFAULT_ICON;
    };
    _text = format ["<img image='%1' color='%2' align='center'/><br/><t color ='%3' size='0.75' align='center'>%4</t>", _icon, _color, _color, _text];
    _ctrl ctrlSetStructuredText (parseText _text);
    _ctrl ctrlSetPosition [(_sPos select 0)-(0.2*SafeZoneW), (_sPos select 1)-(0.0095*SafeZoneW), 0.4*SafeZoneW, 0.035*SafeZoneW];
    //_ctrl ctrlSetBackgroundColor [1, 0, 0, 0.1];
    // _ctrl ctrlSetBackgroundColor [1,0,0,1];
    _ctrl ctrlCommit 0;
};
