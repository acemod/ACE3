/**
 * fn_saveClientSideOptionToProfile_f.sqf
 * @Descr: Save the clientside option to the profile.
 * @Author: Glowbal
 *
 * @Arguments: [name STRING (Name of setting)]
 * @Return: BOOL True if saved.
 * @PublicAPI: false
 */

private ["_name","_nameSelected", "_saved"];
_name = _this select 0;
if (isnil "CSE_F_CLIENT_SIDE_SETTINGS") then {
	CSE_F_CLIENT_SIDE_SETTINGS = [];
};
_saved = false;
{
	_nameSelected = _x select 0;
	if (_nameSelected == _name) exitwith {
		profileNamespace setvariable ["cse_f_clientSideSetting_"+_name, _x select 2];
		_saved = true;
	};
}foreach CSE_F_CLIENT_SIDE_SETTINGS;

_saved