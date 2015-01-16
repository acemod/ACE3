/**
 * fn_moduleAmbientCivilians.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define BUILDING_SEARCH_RADIUS 	1000
#define PERCENTAGE_OF_BUILDINGS 0.3
#define MINIMAL_DISTANCE_PLAYERS 10
#define MAX_AMOUNT_CIVS_TOTAL	100
#define MAX_UNITS_IN_GROUP 3

// only run this on the server
if !(isServer) exitwith {};

_this spawn {
	waitUntil {time > 1};

	_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
	if (!isNull _logic) then {
		_MAX_CIVS_TOTAL = _logic getvariable ["maxCivilians", MAX_AMOUNT_CIVS_TOTAL];
		_MAX_RADIUS = _logic getvariable ["maxRadius", BUILDING_SEARCH_RADIUS];
		_MIN_DISTANCE_PLAYERS = _logic getvariable ["minPlayerDistance", MINIMAL_DISTANCE_PLAYERS];
		_PERCENTAGE	= _logic getvariable ["percentageOf", PERCENTAGE_OF_BUILDINGS];
		_FACTION_OF = _logic getVariable ["factionOf", "CIV_F"];

		_availableUnitClasses = [_FACTION_OF, "CaManBase"] call cse_fnc_getAvailableUnits_faction;
		[format["Found available classes: %1", _availableUnitClasses]] call cse_fnc_debug;
		if (_availableUnitClasses isEqualTo []) exitwith { [format["AvailableClasses for %1 is empty", _FACTION_OF]] call cse_fnc_debug; };
		_allSpawnedUnits = [];
		_allSpawnedGroups = [];
		_playerUnits = [];
		_allCheckedBuildings = [];

		while {alive _logic} do {
			sleep 1;
			if (isMultiplayer) then {
				waituntil {count playableUnits > 0};
				_playerUnits = playableUnits;
			} else {
				_playerUnits = [player];
			};
			_spawnLocatationObjects = [_logic];

			{
				_playableUnit = _x;
				if (count _allSpawnedUnits < _MAX_CIVS_TOTAL && {_playableUnit distance _logic < _MAX_RADIUS}) then {
					_availableBuildings = [];
					_buildingsWithInArea = nearestObjects [_playableUnit, ["house"], _MAX_RADIUS];
					{
						_building = _x;
						if !(_building in _allCheckedBuildings) then {
							_buildingPos = [_x] call BIS_fnc_buildingPositions;
							_invalid = false;
							{
								if (_building distance _x <= _MIN_DISTANCE_PLAYERS) exitwith {
									_invalid = true;
								};
							}foreach _playerUnits;
							if !(_invalid) then {
								_availableBuildings pushback [_building, _buildingPos];
								_allCheckedBuildings pushback _building;
							};
						};
					}foreach _buildingsWithInArea;

					{
						_building = _x select 0;
						_buildingPos = _x select 1;

						if (({_x getvariable ["cse_ambientcivilianModule_Building", objNull] == _building}count _allSpawnedGroups) == 0 && (count _allSpawnedUnits < _MAX_CIVS_TOTAL)) then {
							if (random(1) >= (1 - _PERCENTAGE)) then {
								_group = createGroup civilian;

								_group setvariable ["cse_ambientcivilianModule_Building", _building];
								if (isNull _group) exitwith {
									["Group was null - most likely hit the 144 limit!"] call cse_fnc_debug;
								};
								{
									if ((random(1) >= 0.7 && (count _allSpawnedUnits < _MAX_CIVS_TOTAL) && {(count units _group < MAX_UNITS_IN_GROUP)})|| (count units _group == 0)) then {
										_className = _availableUnitClasses select (round(random((count _availableUnitClasses)-1)));
										_unit = _group createUnit [_className, _x, [], 0, "NONE"];
										_unit setOwner (owner _logic);
										_allSpawnedUnits pushback _unit;
									};
								}foreach _buildingPos;

								if (count units _group == 0) then {
									deleteGroup _group;
								} else {
									_allSpawnedGroups pushback _group;
									_group addWaypoint [(getPos _building), 100, 1, "initial_waypoint_ambientCiv"];
									[_group, 1] setWaypointSpeed "LIMITED";
								};
							};
						};

						// lets exit, since we ran into the limit.
						if ((count _allSpawnedUnits >= _MAX_CIVS_TOTAL)) exitwith {};
					}foreach _availableBuildings;
				};
			}foreach _playerUnits;

			sleep 0.5;

			_unitsRemoved = 0;
			{
				_unit = _x;
				_cannotRemove = false;
				{
					if (_unit distance _x <= _MIN_DISTANCE_PLAYERS) exitwith {
						_cannotRemove = true;
					};
				}foreach _playerUnits;
				if !(_cannotRemove) then {
					if ({(_unit distance _x > _MAX_RADIUS)}count _playerUnits == count _playerUnits) then {
						deleteVehicle _unit;
						_allSpawnedUnits set [_foreachIndex, ObjNull];
						_unitsRemoved = _unitsRemoved + 1;
					};
				};
			}foreach _allSpawnedUnits;
			_allSpawnedUnits = _allSpawnedUnits - [objNull];
			{
				if (count units _x == 0) then {
					deleteGroup _x;
					_allSpawnedGroups set [_foreachIndex, ObjNull];
				} else {
					_group = _x;
					// HANDLE WAYPOINTS FOR GROUPS
					if (currentWaypoint _group == (count waypoints _group)) then {
						_building = _group getvariable "cse_ambientcivilianModule_Building";
						_group addWaypoint [(getPos _building), 200, currentWaypoint _group];
					};
				};
			}foreach _allSpawnedGroups;
			_allSpawnedGroups = _allSpawnedGroups - [objNull];

			sleep 0.5;
			{
				_building = _x;
				_cannotRemove = false;
				{
					if (_building distance _x <= _MIN_DISTANCE_PLAYERS) exitwith {
						_cannotRemove = true;
					};
				}foreach _playerUnits;
				if !(_cannotRemove) then {
					if ({(_building distance _x > _MAX_RADIUS)}count _playerUnits == count _playerUnits) then {
						_allCheckedBuildings set [_foreachIndex, ObjNull];
					};
				};
			}foreach _allCheckedBuildings;
			_allCheckedBuildings = _allCheckedBuildings - [objNull];

			if (_unitsRemoved > 0) then {
				[format["%1- %2 - Removed %3", count _allSpawnedUnits, _allSpawnedUnits, _unitsRemoved]] call cse_fnc_debug;
			};
		};

		[["Finished ambient Civilians module. Cleaning up all units"]] call cse_fnc_Debug;
		// Finished this module. Cleaning up everything.
		_cleanUpStartTime = time;
		// CLEAN UP ALL UNITS, ENSURE PLAYERS ARE NOT NEARBY
		while {(count _allSpawnedUnits > 0 && count _allSpawnedGroups > 0)} do {
			{
				_unit = _x;
				_cannotRemove = false;
				{
					if (_unit distance _x <= _MIN_DISTANCE_PLAYERS) exitwith {
						_cannotRemove = true;
					};
				}foreach _playerUnits;

				// force clean up if this loop has been running for 60 seconds already
				if (!(_cannotRemove) || (time - _cleanUpStartTime > 60)) then {
					if ({(_unit distance _x > _MAX_RADIUS)}count _playerUnits == count _playerUnits) then {
						deleteVehicle _unit;
						_allSpawnedUnits set [_foreachIndex, ObjNull];
						_unitsRemoved = _unitsRemoved + 1;
					};
				};
			}foreach _allSpawnedUnits;
			_allSpawnedUnits = _allSpawnedUnits - [objNull];
			{
				if (count units _x == 0) then {
					deleteGroup _x;
					_allSpawnedGroups set [_foreachIndex, ObjNull];
				} else {
					// HANDLE WAYPOINTS FOR GROUPS

				};
			}foreach _allSpawnedGroups;
			_allSpawnedGroups = _allSpawnedGroups - [objNull];
		};
	};
};