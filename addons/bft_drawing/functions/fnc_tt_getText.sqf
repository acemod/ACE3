#include "script_component.hpp"

disableSerialization;

params ["_display"];

private _return = [_display];

private _idc = IDC_TOOLTIP_TITLE;
_return pushBack (ctrlText CTRL);
_idc = IDC_TOOLTIP_SUBTITLE;
_return pushBack (ctrlText CTRL);
_idc = IDC_TOOLTIP_INFORMATION;
_return pushBack (ctrlText CTRL);

_return
