/**
 * fn_addCatagoryEntry.sqf
 * @Descr: Add a Catagory entry to a menu
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, categoryName STRING, code CODE, condition CODE]
 * @Return: void
 * @PublicAPI: true
 */

private ["_menuName","_catagoryName","_code","_condition","_foundMenuName","_foundEntryName","_counter","_onPosMenu","_onPosCatagory","_catagoryCounter","_entryCollection","_entry"];
_menuName = [_this,0,"",[""]] call BIS_fnc_Param;
_catagoryName = [_this,1, "",[""]] call BIS_fnc_Param;
_code = [_this,2,{},[{}]] call BIS_fnc_Param;
_condition = [_this,3,{},[{}]] call BIS_fnc_Param;


if (isnil "CSE_CATAGORY_LIST_ENTRIES") then {
	CSE_CATAGORY_LIST_ENTRIES = [];
};

_foundMenuName = false;
_foundEntryName = false;
_onPosMenu = 0;
_onPosCatagory = 0;
_counter = 0;
{
	if ((_x select 0) == _menuName) exitwith {
		// found entry
		_foundMenuName = true;
		_onPosMenu = _counter;
		_catagoryCounter = 0;
		{
			if ((_x select 0) == _catagoryName) exitwith {
				_foundEntryName = true;
				_onPosCatagory = _catagoryCounter;
			};
			_catagoryCounter = _catagoryCounter + 1;
		}foreach (_x select 1);
	};
	_counter = _counter + 1;
}foreach CSE_CATAGORY_LIST_ENTRIES;


if (!_foundMenuName) then {
} else {
	if (!_foundEntryName) then {
	} else {
		_entry = [_catagoryName,_condition,_code];
		_arrayOfCatagories = CSE_CATAGORY_LIST_ENTRIES select _onPosMenu;
		_entryCollection = _arrayOfCatagories select _onPosCatagory;
		_entryCollection pushback _entry;
	};
};
