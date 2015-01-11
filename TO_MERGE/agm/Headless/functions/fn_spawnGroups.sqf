// by commy2

{
  private ["_side", "_units", "_positions", "_directions", "_vehicles", "_vehicleIDs", "_vehiclePositions", "_vehicleDirections", "_waypoints", "_vehicle", "_group1", "_unit", "_index", "_waypoint", "_waypointData"];

  _side = [civilian, west, east, resistance] select (_x select 0);
  _units = _x select 1;
  _positions = _x select 2;
  _directions = _x select 3;
  _vehicles = _x select 4;
  _vehicleIDs = _x select 5;
  _vehiclePositions = _x select 6;
  _vehicleDirections = _x select 7;
  _waypoints = _x select 8;

  {
    _vehicle = createVehicle [_x, _vehiclePositions select _forEachIndex, [], 0, "FORM"];
    _vehicle setDir (_vehicleDirections select _forEachIndex);
    _vehicles set [_forEachIndex, _vehicle];
  } forEach _vehicles;

  _group1 = createGroup _side;

  {
    _unit = _group1 createUnit [_x, _positions select _forEachIndex, [], 0, "FORM"];
    _index = _vehicleIDs select _forEachIndex;
    if (_index == -1) then {
      _unit setDir (_directions select _forEachIndex);
    } else {
      _unit moveInAny (_vehicles select _index);
    };
  } forEach _units;

  {
    deleteWaypoint _x;
  } forEach waypoints _group1;

  for "_index" from 0 to (count _waypoints - 1) do {
    _waypointData = _waypoints select _index;

    _waypoint = _group1 addWaypoint [_waypointData select 3, _waypointData select 4];

    _waypoint setWaypointName (_waypointData select 0);
    _waypoint setWaypointType (_waypointData select 1);
    _waypoint setWaypointDescription (_waypointData select 2);
    _waypoint setWaypointPosition (_waypointData select 3);
    _waypoint setWaypointCompletionRadius (_waypointData select 4);
    _waypoint setWaypointSpeed (_waypointData select 5);
    _waypoint setWaypointHousePosition (_waypointData select 6);
    _waypoint setWaypointLoiterRadius (_waypointData select 7);
    _waypoint setWaypointLoiterType (_waypointData select 8);
    _waypoint setWaypointCombatMode (_waypointData select 9);
    /*_waypoint waypointAttachObject (_waypointData select 10);
    _waypoint waypointAttachVehicle (_waypointData select 11);*/
    _waypoint showWaypoint (_waypointData select 10);
    _waypoint setWaypointVisible (_waypointData select 11);
    _waypoint setWaypointBehaviour (_waypointData select 12);
    _waypoint setWaypointFormation (_waypointData select 13);
    _waypoint setWaypointScript (_waypointData select 14);
    _waypoint setWaypointStatements (_waypointData select 15);
    _waypoint setWaypointTimeout (_waypointData select 16);

    {vehicle _x doMove position vehicle _x} forEach units _group1;
  };
} forEach _this;
