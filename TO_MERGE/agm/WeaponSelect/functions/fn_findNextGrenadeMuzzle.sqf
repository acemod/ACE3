// by commy2

private ["_scope", "_allMags", "_allMuzzles", "_magazines", "_start", "_index", "_nextMuzzle"];

_scope = _this select 0;	//"All", "Frag" or "NonFrag"

_allMags = missionNamespace getVariable [format ["AGM_WeaponSelect_%1Magazines", _scope], []];
_allMuzzles = missionNamespace getVariable [format ["AGM_WeaponSelect_%1Muzzles", _scope], []];

_magazines = magazines AGM_player;

_start = [AGM_WeaponSelect_CurrentGrenadeMuzzleOther, AGM_WeaponSelect_CurrentGrenadeMuzzleFrag] select AGM_WeaponSelect_CurrentGrenadeMuzzleIsFrag;
_index = _allMuzzles find _start;

scopeName "SearchMain";

_nextMuzzle = "";
for "_index" from (_index + 1) to (count _allMuzzles - 1) do {
  {
    if (_x in (_allMags select _index)) exitWith {_nextMuzzle = _allMuzzles select _index; breakTo "SearchMain"};
  } count _magazines;
};

if (_nextMuzzle != "") exitWith {_nextMuzzle};

for "_index" from 0 to _index do {
  {
    if (_x in (_allMags select _index)) exitWith {_nextMuzzle = _allMuzzles select _index; breakTo "SearchMain"};
  } count _magazines;
};

_nextMuzzle
