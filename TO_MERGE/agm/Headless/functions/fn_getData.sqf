// by commy2

private ["_sides", "_allGroups", "_data", "_count"];

_sides = _this;

// get groups
_allGroups = [];
{
  if (side _x in _sides) then {
    _allGroups pushBack _x;
  };
} forEach allGroups;

// get data
_data = [];
_count = count _allGroups; diag_log text "[";
{
  private ["_units", "_vehicles", "_positions", "_directions", "_vehiclePositions", "_vehicleDirections", "_vehicleIDs", "_index", "_waypoints"];

  _side = ([civilian, west, east, resistance] find side _x) max 0;

  _units = [];
  _vehicles = [];
  _positions = [];
  _directions = [];
  _vehiclePositions = [];
  _vehicleDirections = [];
  _vehicleIDs = [];
  {
    _units pushBack typeOf _x;
    if (_x != vehicle _x) then {
      _index = _vehicles find vehicle _x;
      if (_index == -1) then {
        _index = _vehicles pushBack vehicle _x;
        _vehiclePositions pushBack position vehicle _x;
        _vehicleDirections pushBack direction vehicle _x;
      };
      _vehicleIDs pushBack _index;
    } else {
      _vehicleIDs pushBack -1;
    };

    _positions pushBack position _x;
    _directions pushBack direction _x;
  } forEach units _x;

  _vehicles = [_vehicles, {typeOf _this}] call AGM_Core_fnc_map;

  _waypoints = [];
  {
    private "_waypointData";

    _waypointData = [
      waypointName _x,
      waypointType _x,
      waypointDescription _x,
      waypointPosition _x,
      waypointCompletionRadius _x,
      waypointSpeed _x,
      waypointHousePosition _x,
      waypointLoiterRadius _x,
      waypointLoiterType _x,
      waypointCombatMode _x,
      /*waypointAttachedObject _x,
      waypointAttachedVehicle _x,*/
      waypointShow _x,
      waypointVisible _x,
      waypointBehaviour _x,
      waypointFormation _x,
      waypointScript _x,
      waypointStatements _x,
      waypointTimeout _x
    ];

    _waypoints set [_forEachIndex, _waypointData];
  } forEach waypoints _x;

  _data pushBack [_side, _units, _positions, _directions, _vehicles, _vehicleIDs, _vehiclePositions, _vehicleDirections, _waypoints];

  [str [_side, _units, _positions, _vehicles, _vehicleIDs, _vehiclePositions, _waypoints] + ([",", ""] select (count _data == _count))] call AGM_Headless_fnc_logLongString;
} forEach _allGroups; diag_log text "] call AGM_Headless_fnc_spawnGroups;";

_data
