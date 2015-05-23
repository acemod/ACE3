#include "script_component.hpp"

disableSerialization;
private ["_display","_return"];
_display = _this select 0;
_return = [_display];

private "_idc";
_idc = IDC_TOOLTIP_TITLE;
_return pushBack (ctrlText CTRL);
_idc = IDC_TOOLTIP_SUBTITLE;
_return pushBack (ctrlText CTRL);
_idc = IDC_TOOLTIP_INFORMATION;
_return pushBack (ctrlText CTRL);

_return