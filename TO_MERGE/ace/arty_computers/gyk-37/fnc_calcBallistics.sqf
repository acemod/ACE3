// Ballistic table generator
// 
// Creates pre-rendered ballistic data for use with ARTY.
#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC

private ["_offsetTable", "_offsetIdx", "_useElevation", "_addTab", "_offsetEntry"];

_magazine = _this select 0;
_emin = _this select 1;
_emax = _this select 2;
_estep = _this select 3;
_hmin = _this select 4;
_hmax = _this select 5;
_hstep = _this select 6;
_muzzle_velocity = _this select 7;

_ammo = getText(configFile >> "CfgMagazines" >> _magazine >> "ammo");
if((count _this) > 6) then {
	_muzzle_velocity = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
};
_airFriction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");

// Grab offset table if it exists. Offsets are used for calculating rocket artillery trajectories.
// The number of entries in the offset table must match the number of entries in the generated ballistic table,
// based on the elevation step value.


_grav = -9.80665;                      // Gravity constant.
_fps = 60;                             // Frames per second for calculation.
   
// Stops
_minrange = 99999999;
_maxrange = 0;

// Initialize resultant set of data
_btab = [];
_elevation = 0;

for [{_elevation=_emin},{_elevation<=_emax},{_elevation=_elevation+_estep}] do {
        // Initial params
        _vgate = 0;
        _gaterng = 0;
        _x = 0;
        _y = 0.1;
        _vx = 0;
        _vy = 0;
        _ymax = 0;
        _xmax = 0;
        _vel = _muzzle_velocity;
        _fc = 0;
        _tof = 0;
        

        _useElevation = _elevation;
        
        // Set t0 parameters
        _vx = _vel * cos(_useElevation);
        _vy = _vel * sin(_useElevation);
        _frame = 1 / _fps;
        
        _slices = [];
        _agate = _hmax;
        
        while {_y >= _hmin} do
        {
            // Calculate next velocity frame
            _vx = _vx + (_vx * _vel * _airFriction * _frame);
            _vy = _vy + (_vy * _vel * _airFriction * _frame);
            _vy = _vy + (_grav * _frame);
            _vel = sqrt(_vx*_vx + _vy*_vy);
			_elev = asin (_vy / _vel);
            // Increment positions
            _y = _y + (_vy * _frame);
            _x = _x + (_vx * _frame);

            // Record max altitude and range
            if (_y > _ymax) then
            {
                _ymax = _y;
            };
            if (_x > _xmax) then
            {
                _xmax = _x;
            };
            
            // Take slices
            
            if ((_y < _agate) && (_vy < 0) && (_agate >= _hmin)) then
            {
                while {_agate > _y} do {_agate = _agate - _hstep;};
                _slices = _slices + [[_x, _y, _fc*_frame, _vel, _elev]];
            };
            
            // Increment frame count.
            _fc = _fc + 1;
        };
        _xmax = _x;
        
        if (_xmax < _minrange) then
        {
                _minrange = _xmax;
        };
        if (_xmax > _maxrange) then
        {
                _maxrange = _xmax;
        };
        
        // Order slices lowest to highest
        _rSlices = [];
        for [{_a = count(_slices)-1;},{_a >= 0},{_a = _a - 1}] do
        {
            _rSlices = _rSlices + [_slices select _a];
        };
 
        // Put calculated rocket decay points into table if offsets are used.
        _addTab = [_elevation, _ymax, _rSlices];
        _btab set [count _btab, _addTab];
};

[_btab, _minrange, _maxrange]
