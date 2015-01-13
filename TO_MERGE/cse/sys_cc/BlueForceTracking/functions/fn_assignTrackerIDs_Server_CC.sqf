/*
	NAME: fnc_assignTrackersServer
	USAGE: running serverside, assigning IDs to all newly found trackers
	AUTHOR: Glowbal
	ARGUMENTS: none
	RETURN: void
*/

// SERVER SIDE ONLY


if !(isServer) exitwith{};
private ["_storedIDs","_newID","_availableClasses"];
_availableClasses = ["cse_m_tablet","cse_m_pda"];

waituntil {!isnil "CSE_CC_LOGIC_OBJECT_CC"};
_storedIDs = [];
{
	_storedIDs set[count _storedIDs,[]];
}foreach _availableClasses;
_newID = "";
while {true} do {
	{
		private ["_unit","_IDCollection"];
		_unit = _x;
		if (alive _unit) then {
			_IDCollection = 0;
			{
				_foundIt = (_x in ((backpackItems _unit) + (uniformItems _unit)+ (vestItems _unit) + (assignedItems _unit)));
				if (_foundIt) exitwith {
					_newID = format["%1_%2",_x,count(_storedIDs select _IDCollection)+1];

					_check = CSE_CC_LOGIC_OBJECT_CC getvariable _newID;
					if (isnil "_check") then {
						(_storedIDs select _IDCollection) set [count((_storedIDs select _IDCollection)),_newID];
						_trackerStatus = _unit getvariable ["cse_bft_info_cc",["Infantry"," ",true,false]];
						CSE_CC_LOGIC_OBJECT_CC setvariable [_newID,_trackerStatus,true];

						if (_x in (assignedItems _unit)) then {
							_unit unassignItem _x;
						};
						[[_unit,_x,_newID], "cse_fnc_switchItem", owner _unit, false] spawn BIS_fnc_MP;
						//waituntil {(!((_x in ((backpackItems _unit) + (uniformItems _unit)+ (vestItems _unit) + (assignedItems _unit)))) || (!alive _unit))};
					};
				};
				_IDCollection = _IDCollection + 1;
			}foreach _availableClasses;
			//sleep 0.001;
			sleep 1;
		};
	}foreach allUnits;
};