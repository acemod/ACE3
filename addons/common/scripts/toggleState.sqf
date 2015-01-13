// by commy2
#include "script_component.hpp"

_index = _this select 0;

_name = format ["ACE_%1", GVAR(OptionNames) select _index];

_index1 = GVAR(OptionNamesNew) find _name;
_state = if (_index1 == -1) then {_index1 = count GVAR(OptionNamesNew); !(profileNamespace getVariable _name)} else {!(GVAR(OptionStatesNew) select _index1)};

disableSerialization;
_dlgMenuDialog = uiNamespace getVariable QGVAR(MenuDialog);

_control = _dlgMenuDialog displayCtrl (300 + _index);
_control ctrlSetText format [QUOTE(PATHTOF(UI\box_%1checked_ca.paa)), ["un", ""] select _state];

GVAR(OptionNamesNew) set [_index1, _name];
GVAR(OptionStatesNew) set [_index1, _state];
