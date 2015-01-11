//fnc_getBTable.sqf
#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC

_magazine = _this select 0;
_emin = _this select 1;
_emax = _this select 2;
_estep = _this select 3;
_hmin = _this select 4;
_hmax = _this select 5;
_hstep = _this select 6;

_btable = _this call DEMO_fnc_calcBallistics;
[(_btable select 0), (_btable select 1), (_btable select 2), _hmin, _hmax, _hstep]

