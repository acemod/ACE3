// by commy2
#include "\z\ace\addons\core\script_component.hpp"

#define OFFSET_1 100
#define OFFSET_2 200

closeDialog 0;
createDialog QGVAR(OptionsMenu_Dialog);

GVAR(keyNew) = [];
GVAR(keySet) = -1;
GVAR(keySave) = 0;
GVAR(keyNames) = [];
GVAR(MenuPage) = 0;
GVAR(OptionNames) = [];
GVAR(OptionNamesNew) = [];
GVAR(OptionStatesNew) = [];

disableSerialization;
_dlgMenuDialog = uiNamespace getVariable QGVAR(MenuDialog);

_ehid_keydown = _dlgMenuDialog displayAddEventHandler ["KeyDown", "_this select 1 > 1"];
_ehid_keyup = _dlgMenuDialog displayAddEventHandler ["KeyUp", "_this select 1 > 1"];

_config = configFile >> QGVAR(Default_Keys);
_count = count _config;

_countPages = ceil (_count / 20) + 1;
(_dlgMenuDialog displayCtrl 14) ctrlSetText format ["%1/%2", GVAR(MenuPage) + 1, _countPages];

for "_index" from 0 to (_count - 1 min 19) do {
  _configFile = _config select _index;
  _keyName = configName _configFile;
  _displayName = getText (_configFile >> "displayName");
  _isDisabled = getNumber (_configFile >> "disabled") == 1;

  _keyCode = profileNamespace getVariable format ["ACE_Key_%1", _keyName];
  _description = [_keyCode] call FUNC(revertKeyCodeLocalized);

  _control1 = _dlgMenuDialog displayCtrl (OFFSET_1 + _index);
  _control2 = _dlgMenuDialog displayCtrl (OFFSET_2 + _index);

  _control1 ctrlSetText _displayName;
  _control2 ctrlSetText _description;

  _control1 ctrlShow true;
  _control2 ctrlShow true;

  GVAR(keyNames) set [_index, _keyName];
};

for "_index" from _count to 19 do {
  _control1 = _dlgMenuDialog displayCtrl (OFFSET_1 + _index);
  _control2 = _dlgMenuDialog displayCtrl (OFFSET_2 + _index);

  _control1 ctrlShow false;
  _control2 ctrlShow false;
};

waitUntil {!dialog};

_dlgMenuDialog displayRemoveEventHandler ["KeyDown", _ehid_keydown];
_dlgMenuDialog displayRemoveEventHandler ["KeyUp", _ehid_keyup];

if (GVAR(keySave) == 1) then {
  _count0 = count GVAR(keyNew);

  for "_index" from 0 to (_count0 - 1) do {
    _key = GVAR(keyNew) select _index;
    _keyName = _key select 0;
    _keyCode = _key select 1;

    profileNamespace setVariable [format ["ACE_Key_%1", _keyName], _keyCode];
  };

  _count1 = count GVAR(OptionNamesNew);

  for "_index" from 0 to (_count1 - 1) do {
    _name = GVAR(OptionNamesNew) select _index;
    _state = GVAR(OptionStatesNew) select _index;

    profileNamespace setVariable [_name, _state];
  };

  if (_count0 > 0 || {_count1 > 0}) then {
    saveProfileNamespace;
    [localize QUOTE(DOUBLES(STR,GVAR(ProfileSaved)))] call FUNC(displayTextStructured);
  } else {
    [localize QUOTE(DOUBLES(STR,GVAR(ProfileNotSaved)))] call FUNC(displayTextStructured);
  };
} else {
  [localize QUOTE(DOUBLES(STR,GVAR(ProfileNotSaved)))] call FUNC(displayTextStructured);
};

GVAR(keyNewTemp) = nil;
GVAR(keyNames) = nil;
GVAR(MenuPage) = nil;
GVAR(OptionNames) = nil;
GVAR(OptionNamesNew) = nil;
GVAR(OptionStatesNew) = nil;
