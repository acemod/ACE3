/**
 * fn_saveKeyBindingToProfile_f.sqf
 * @Descr: Saves a keybinding to the profile
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_nameSelected", "_saved", "_type"];
_name = _this select 0;
_type = _this select 1;
if (isnil "CSE_F_KEYBINDINGS_MENUS") then {
	CSE_F_KEYBINDINGS_MENUS = [];
};
if (isnil "CSE_F_KEYBINDINGS_ACTIONS") then {
	CSE_F_KEYBINDINGS_ACTIONS = [];
};
_saved = false;
if (_type == "menu") then {
	{
		_nameSelected = _x select 0;
		if (_nameSelected == _name) exitwith {
			profileNamespace setvariable ["cse_f_keybinding_menu_"+_name, _x select 1];
			_saved = true;
		};
	}foreach CSE_F_KEYBINDINGS_MENUS;
} else {
	if (_type == "action") then {
		{
			_nameSelected = _x select 0;
			if (_nameSelected == _name) exitwith {
				profileNamespace setvariable ["cse_f_keybinding_action_"+_name, _x select 1];
				_saved = true;
			};
		}foreach CSE_F_KEYBINDINGS_ACTIONS;
	};
};

_saved