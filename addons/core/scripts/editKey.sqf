// by commy2

#define GRAY [0.25, 0.25, 0.25, 1]
#define WHITE [1, 1, 1, 1]
#define OFFSET_1 100
#define OFFSET_2 200

waitUntil {isNil "GVAR(keyNewTemp)"};
GVAR(keyNewTemp) = [];

GVAR(keySet) = 0;
_index = count GVAR(keyNew);

disableSerialization;
_dlgMenuDialog = uiNamespace getVariable "GVAR(MenuDialog)";
_ctrlMenuDialog = _dlgMenuDialog displayCtrl (OFFSET_2 + (_this select 0));
_action = GVAR(keyNames) select (_this select 0);
_displayName = getText (configFile >> "GVAR(Default_Keys)" >> _action >> "displayName");

_keyCode = profileNamespace getVariable [format ["AGM_Key_%1", _action], 0];//
for "_index1" from 0 to (count GVAR(keyNew) - 1) do {
  if (_action == (GVAR(keyNew) select _index1) select 0) then {
    _keyCode = (GVAR(keyNew) select _index1) select 1;
  }
};
(_dlgMenuDialog displayCtrl 24) ctrlSetText ([_keyCode] call GVAR(fnc_revertKeyCodeLocalized));//"";
/*(_dlgMenuDialog displayCtrl 21) ctrlSetTextColor GRAY;
(_dlgMenuDialog displayCtrl 22) ctrlSetTextColor GRAY;
(_dlgMenuDialog displayCtrl 23) ctrlSetTextColor GRAY;*/

for "_index1" from 20 to 32 do {(_dlgMenuDialog displayCtrl _index1) ctrlShow true};
for "_index1" from 10 to 13 do {(_dlgMenuDialog displayCtrl _index1) ctrlEnable false};

(_dlgMenuDialog displayCtrl 30) ctrlSetText _displayName;

GVAR(keysetDefault) = compile format [
  "_configFile = configFile >> 'GVAR(Default_Keys)' >> '%1';
  _key = getNumber (_configFile >> 'Key');
  _shft = getNumber (_configFile >> 'Shift') == 1;
  _ctrl = getNumber (_configFile >> 'Control') == 1;
  _alt = getNumber (_configFile >> 'Alt') == 1;

  _keyCode = [_key, _shft, _ctrl, _alt] call GVAR(fnc_convertKeyCode);

  GVAR(keyNewTemp) = [_key, [_shft, _ctrl, _alt], _keyCode];",
  _action
];

_description = ctrlText _ctrlMenuDialog;
//_ctrlMenuDialog ctrlSetText "..";

_ehid_keydown = _dlgMenuDialog displayAddEventHandler ["KeyDown", "_this call GVAR(keyInput)"];
_ehid_keyup = _dlgMenuDialog displayAddEventHandler ["KeyUp", "_this call GVAR(keyRelease)"];

waitUntil {
  if (count GVAR(keyNewTemp) > 0) then {
    _key = GVAR(keyNewTemp) select 0;
    _keyModifier = GVAR(keyNewTemp) select 1;
    //_keyCode = round (10 * ((GVAR(keyNewTemp) select 2) % 1));
    _keyCode = GVAR(keyNewTemp) select 2;

    (_dlgMenuDialog displayCtrl 24) ctrlSetText ([_keyCode] call GVAR(fnc_revertKeyCodeLocalized));

    /*_key = toString (toArray (keyName _key) - [34]);

    switch (_keyCode) do {
      case 8 : {
        (_dlgMenuDialog displayCtrl 24) ctrlSetText format [localize "STR_GVAR(DoubleTapKey)", _key];

        (_dlgMenuDialog displayCtrl 21) ctrlSetTextColor GRAY;
        (_dlgMenuDialog displayCtrl 22) ctrlSetTextColor GRAY;
        (_dlgMenuDialog displayCtrl 23) ctrlSetTextColor GRAY;
      };
      case 9 : {
        (_dlgMenuDialog displayCtrl 24) ctrlSetText format [localize "STR_GVAR(HoldKey)", _key];

        (_dlgMenuDialog displayCtrl 21) ctrlSetTextColor GRAY;
        (_dlgMenuDialog displayCtrl 22) ctrlSetTextColor GRAY;
        (_dlgMenuDialog displayCtrl 23) ctrlSetTextColor GRAY;
      };
      default {
        (_dlgMenuDialog displayCtrl 24) ctrlSetText _key;

        (_dlgMenuDialog displayCtrl 21) ctrlSetTextColor ([GRAY, WHITE] select (_keyModifier select 0));
        (_dlgMenuDialog displayCtrl 22) ctrlSetTextColor ([GRAY, WHITE] select (_keyModifier select 1));
        (_dlgMenuDialog displayCtrl 23) ctrlSetTextColor ([GRAY, WHITE] select (_keyModifier select 2));
      };
    };*/
  };
  GVAR(keySet) != 0 ||
  {!dialog}
};

for "_index1" from 10 to 13 do {(_dlgMenuDialog displayCtrl _index1) ctrlEnable true};
for "_index1" from 20 to 32 do {(_dlgMenuDialog displayCtrl _index1) ctrlShow false};

_dlgMenuDialog displayRemoveEventHandler ["KeyDown", _ehid_keydown];
_dlgMenuDialog displayRemoveEventHandler ["KeyUp", _ehid_keyup];

if (GVAR(keySet) == 1 && {count GVAR(keyNewTemp) > 0}) then {
  _keyCode = GVAR(keyNewTemp) select 2;
  _description = [_keyCode] call GVAR(fnc_revertKeyCodeLocalized);
  _ctrlMenuDialog ctrlSetText _description;

  GVAR(keyNew) set [_index, [_action, _keyCode]];
} else {
  _ctrlMenuDialog ctrlSetText _description;
};

GVAR(keySet) = -1;
GVAR(keyNewTemp) = nil;
GVAR(keysetDefault) = nil;
