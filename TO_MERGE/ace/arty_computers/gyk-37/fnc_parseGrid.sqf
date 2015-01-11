//fnc_parseGrid.sqf
#include "script_component.hpp"

_grid = _this;
_gridArray = toArray _grid;
_easting = [];
_northing = [];
for "_i" from 0 to (count _gridArray)-1 do {
	if(_i < (count _gridArray)/2) then {
		_easting set[(count _easting), (_gridArray select _i)];
	} else {
		_northing set[(count _northing), (_gridArray select _i)];
	};
};
_m = 10000;
_eastingTotal = 0;
_northingTotal = 0;

for "_i" from 0 to (count _northing)-1 do {
	_eastingTotal = _eastingTotal + ((parseNumber (toString [(_easting select _i)]))*_m);
	_northingTotal = _northingTotal + ((parseNumber ( toString [(_northing select _i)]))*_m);
	_m = _m/10;
};

_reversed = [] call CBA_fnc_northingReversed;
if(_reversed) then {
	_northingTotal = _northingTotal + (_m*10);
	_northingTotal-((_m*10)/2)
} else {
	_northingTotal+((_m*10)/2)
};
[_eastingTotal+((_m*10)/2), _northingTotal]