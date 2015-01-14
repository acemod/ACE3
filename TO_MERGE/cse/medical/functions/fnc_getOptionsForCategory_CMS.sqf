/**
 * fn_getOptionsForCategory_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target", "_category", "_return", "_allow", "_resultsOfEH"];
_target = _this select 0;
_category = _this select 1;
_return = _this select 2;

// TODO might require a new eventhandler system for this.
/*
_resultsOfEH = [[_target],_category] call EFUNC(common,customEventHandler_F);
{
	{
		if (count _x == 3) then {
			_allow = true;
			{
				if (typeName _x != typeName "") exitwith {
					_allow = false;
				};
			}foreach _x;
			if (_allow) then {
				_return pushback _x;
			};
		};
	}foreach _x;
}foreach _resultsOfEH;
*/
_return