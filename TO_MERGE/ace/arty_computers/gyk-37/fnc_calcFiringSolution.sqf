scriptName format ["%1ARTY\data\scripts\ARTY_tof.sqf (_this: %1)",_this];
// ARTY_firingSolution.sqf
//
// Use the ballistics table to calculate a firing solution

#define GETELEV(T,I) ((##T## select ##I##) select 0)
#define GETMAXHEIGHT(T,I) ((##T## select ##I##) select 1)
#define GETSLICES(T,I) ((##T## select ##I##) select 2)

// Rocket ballistics values
#define GETOFFSETH(T,I) ((##T## select ##I##) select 3)
#define GETOFFSETV(T,I) ((##T## select ##I##) select 4)
#define GETDECAYELEV(T,I) ((##T## select ##I##) select 5)
#define GETDECAYSPD(T,I) ((##T## select ##I##) select 6)

private ["_firingPos", "_targetPos", "_btab", "_position", "_btab", "_i", "_sliceN", "_sliceNN", "_hmin", "_hmax", "_hstep", "_deltaX", "_deltaY", "_fs"];

_deltaX = _this select 0;
_deltaY = _this select 1;
_ballistics = _this select 2;

_btab = _ballistics select 0;
_minRange = _ballistics select 1;
_maxRange = _ballistics select 2;
_hmin = _ballistics select 3;
_hmax = _ballistics select 4;
_hstep = _ballistics select 5;

// Blank fs to return if there is an error (i.e. out of range)
_blank = [];

// _deltaX = [_firingPos select 0, _firingPos select 1, 0] distance [_targetPos select 0, _targetPos select 1, 0];
// _deltaY = (_targetPos select 2) - (_firingPos select 2);

// Out of range if height deltaY exceeds height differential in either direction.
if (_deltaY < _hmin || _deltaY > _hmax) exitWith {
    if (BIS_ARTY_DEBUG==1) then {textLogFormat ["dY of %1 exceeds vertical range of artillery.", _deltaY];};
    _blank
};

_hrange = _hmax - _hmin;
_colL = floor((_deltaY - _hmin)/_hstep);
_colH = ceil((_deltaY - _hmin)/_hstep);

// deltaY is on a boundary
if (_colL == _colH) then {_colH = _colH + 1};

_muY = ((_deltaY - _hmin) - _colL*_hstep) / (_colH*_hstep - _colL*_hstep);

_distN = 9999999;
_rowN = -1;
_rowNN = -1;
for [{_i=1},{_i < ((count _btab) - 1)},{_i=_i+1}] do
{
    _prevSliceCount = count (GETSLICES(_btab, _i-1)); // Enforce boundary conditions that will come in when picking NN
    _slices = GETSLICES(_btab, _i);
    _nextSliceCount = count (GETSLICES(_btab, _i+1));
    if ((count _slices) > _colH && 
        _prevSliceCount > _colH && 
        _nextSliceCount > _colH) then
    {
        _v1 = _slices select _colL;   // Select data vectors
        _v2 = _slices select _colH;
        _testVec = [[_v1 select 0], [_v2 select 0], _muY] call BIS_ARTY_VEC_LERP;  // Interpolate
        _testDist = _testVec select 0;
        
        if (abs(_testDist - _deltaX) < _distN) then
        {
            _distN = abs(_testDist - _deltaX);
            _rowN = _i;
        };
    };
};

// Select nearest neighbor.
_n1 = GETSLICES(_btab,_rowN-1);
_v11 = _n1 select _colL;
_v12 = _n1 select _colH;
_n2 = GETSLICES(_btab,_rowN+1);;
_v21 = _n2 select _colL;
_v22 = _n2 select _colH;
_s1 = [_v11, _v12, _muY] call BIS_ARTY_VEC_LERP;
_s2 = [_v21, _v22, _muY] call BIS_ARTY_VEC_LERP;

_d1 = _s1 select 0;
_d2 = _s2 select 0;
if (abs(_d1 - _deltaX) < abs(_d2 - _deltaX)) then 
{
    _rowNN = (_rowN - 1);
    _sliceNN = _s1;
} else {
    _rowNN = (_rowN + 1);
    _sliceNN = _s2;
};

// Check out of range condition in the horizontal
if ((_deltaX < _d1 && _deltaX < _d2) ||
    (_deltaX > _d1 && _deltaX > _d2)) exitWith {
    if (BIS_ARTY_DEBUG==1) then {textLogFormat ["dY = %1, dX = %2 out of firing envelope.", _deltaY, _deltaX];};
    _blank
};

_n0 = GETSLICES(_btab,_rowN);
_v1 = _n0 select _colL;
_v2 = _n0 select _colH;
_sliceN = [_v1, _v2, _muY] call BIS_ARTY_VEC_LERP;

_elevN = GETELEV(_btab,_rowN);
_elevNN = GETELEV(_btab,_rowNN);

_muX = (_deltaX - (_sliceN select 0)) / ((_sliceNN select 0) - (_sliceN select 0));

// Check the type of ballistics table being worked with (single or rocket)
if (count (_btab select 0) >= 7) then
{
    // Load rocket parameters
    _offHN = GETOFFSETH(_btab,_rowN);
    _offVN = GETOFFSETV(_btab,_rowN);
    _decayElevN = GETDECAYELEV(_btab,_rowN);
    _decaySpdN = GETDECAYSPD(_btab,_rowN);
    _offHNN = GETOFFSETH(_btab,_rowNN);
    _offVNN = GETOFFSETV(_btab,_rowNN);
    _decayElevNN = GETDECAYELEV(_btab,_rowNN);
    _decaySpdNN = GETDECAYSPD(_btab,_rowNN);
    
    // Rocket-based firing solution.
    _fs = [[_elevN, (_sliceN select 0), (_sliceN select 2), (_sliceN select 1), _offHN, _offVN, _decayElevN, _decaySpdN],
           [_elevNN, (_sliceNN select 0), (_sliceNN select 2), (_sliceNN select 1), _offHNN, _offVNN, _decayElevNN, _decaySpdNN], 
           _muX] call BIS_ARTY_VEC_LERP;
}
else
{
    // Single projectile firing solution.
    _fs = [[_elevN, (_sliceN select 0), (_sliceN select 2), (_sliceN select 1), (_sliceN select 3), (_sliceN select 4)],
           [_elevNN, (_sliceNN select 0), (_sliceNN select 2), (_sliceNN select 1), (_sliceNN select 3), (_sliceNN select 4)], 
           _muX] call BIS_ARTY_VEC_LERP;
};

_fs

