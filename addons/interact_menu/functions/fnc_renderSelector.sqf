/*
 * Author: CAA-Picard
 * Render a single interaction icon
 *
 * Argument:
 * 0: 2d position <ARRAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
#define DEFAULT_ICON QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa)
private ["_color", "_sPos", "_ctrl", "_icon"];
_sPos = _this select 0;

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    _displayNum = [46,91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
};
_ctrl = GVAR(iconCtrls) select GVAR(iconCount);
GVAR(iconCount) = GVAR(iconCount) + 1;

_text = format ["<img image='%1' color='#FF0000' size='1.5' align='center'/>", format [QUOTE(PATHTOF(ui\selector%1.paa)), floor (((abs GVAR(rotationAngle)) mod 90) / 6)]];
_ctrl ctrlSetStructuredText (parseText _text);
_ctrl ctrlSetPosition [(_sPos select 0)-(0.2*SafeZoneW), (_sPos select 1)-(0.012*SafeZoneW), 0.4*SafeZoneW, 0.035*SafeZoneW];
//_ctrl ctrlSetBackgroundColor [1, 0, 0, 0.1];
_ctrl ctrlCommit 0;
