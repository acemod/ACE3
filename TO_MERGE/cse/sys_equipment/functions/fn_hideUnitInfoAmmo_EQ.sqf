/**
 * fn_hideUnitInfoAmmo_EQ.sqf
 * @Descr: Hide the unitInfo ammo related parts. Credits Vladimir Hynek (BI Dev) for original code from BIS_fnc_showUnitInfo
 * @Author: Glowbal
 *
 * @Arguments: [hide BOOL]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_hide"];
_hide = [_this, 0, true, [true]] call BIS_fnc_param;
[format["Hiding unitAmmoInfo %1", _hide]] call cse_fnc_debug;
disableSerialization;
{
	if((ctrlIDD _x) == 300) then
	{
		private ["_unitInfoDisplay"];
		_unitInfoDisplay = _x;

		{
			if (_x in [184, 185, 151]) then {
				private ["_ctrl"];
				_ctrl = _unitInfoDisplay displayCtrl _x;

				if(_hide) then
				{
					_ctrl ctrlSetFade 1;
				}
				else
				{
					_ctrl ctrlSetFade 0;
				};

				_ctrl ctrlCommit 0;
			};
		} foreach ([(configfile >> "RscInGameUI" >> "RscUnitInfo"), 0] call bis_fnc_displaycontrols);
	};
} foreach (uinamespace getvariable "IGUI_displays"); //RscUnitInfo can be present several times for some reason
