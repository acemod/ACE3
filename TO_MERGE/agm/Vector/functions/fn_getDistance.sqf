// by commy2

#define MIN_DISTANCE 10
#define MAX_DISTANCE ([6000, 9000] select (AGM_vectorSettings select 3))
#define INTERVAL 2

private ["_dlgVectorOptics", "_distance"];

disableSerialization;
_dlgVectorOptics = uiNamespace getVariable ['AGM_dlgVectorOptics', displayNull];

_distance = ctrlText (_dlgVectorOptics displayCtrl 151);

if (_distance == "----") exitWith {-9999};

_distance = round parseNumber _distance;

if (AGM_vectorSettings select 3) then {
  _distance = 3.28084 * _distance;
};

if (_distance > MAX_DISTANCE) exitWith {-9999};
if (_distance < MIN_DISTANCE) exitWith {-9999};

_distance
