/**
 * fn_gui_addCatagory.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_catagoryCounter","_catagoryName","_condition","_priority","_foundEntryName","_foundMenuName", "_counter","_onPosCatagory","_onPosMenu","_catagoryCounter","_arrayOfCatagories"];
_menuName = _this select 0;
_catagoryName = _this select 1;
_condition = _this select 2;
_priority = _this select 3;


if (isnil "CSE_CATAGORY_LIST_ENTRIES") then {
	CSE_CATAGORY_LIST_ENTRIES = [];
	CSE_CATAGORY_LIST_ENTRIES pushback [_menuName,[_catagoryName, [] ] ];
};

_foundMenuName = false;
_foundEntryName = false;
_onPosMenu = 0;
_onPosCatagory = 0;
{
	if ((_x select 0) == _menuName) exitwith {
		_foundMenuName = true;
		_onPosMenu = _foreachIndex;
		_catagoryCounter = 0;
		{
			if ((_x select 0) == _catagoryName) exitwith {
				_foundEntryName = true;
				_onPosCatagory = _catagoryCounter;
			};
			_catagoryCounter = _catagoryCounter + 1;
		}foreach (_x select 1);
	};
}foreach CSE_CATAGORY_LIST_ENTRIES;

if (!_foundMenuName) then {
	CSE_CATAGORY_LIST_ENTRIES pushback [_menuName,[_catagoryName, [] ] ];
} else {
	if (!_foundEntryName) then {
		_arrayOfCatagories = CSE_CATAGORY_LIST_ENTRIES select _onPosMenu;
		_arrayOfCatagories pushback [_catagoryName, [] ];
	};
};


	cse_fnc_gui_getCatagoryEntries = {

		if (isnil "CSE_CATAGORY_LIST_ENTRIES") {
			CSE_CATAGORY_LIST_ENTRIES = [];
		};
		_return = [];

		{
			if ((_x select 0) == (_this select 0)) exitwith {
				{
					if ((_x select 0) == (_this select 1)) exitwith {
						_return = _x select 1;
					};
				}foreach (_x select 1);
			};
		}foreach CSE_CATAGORY_LIST_ENTRIES

		_return
	};

	[_menuName,_catagoryName + " >",_condition,{
		[_catagoryName,_this select 2,[_menuName,_catagoryName] call cse_fnc_gui_getCatagoryEntries] call cse_fnc_gui_displaySubMenuButtons;
	},_priority] call cse_fnc_gui_addMenuEntry;


