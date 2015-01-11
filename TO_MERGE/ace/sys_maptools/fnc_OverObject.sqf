//overCompass.sqf
#include "script_component.hpp"
private ["_posx","_posy","_tx","_ty","_cDir","_in","_objectPosition", "_mapPosition", "_size"];
_objectPosition = _this select 0;
_mapPosition = _this select 1;
_size = _this select 2;
_cDir = _this select 3;
_posx = _objectPosition select 0;
_posy = _objectPosition select 1;
//_tx = _size select 0;
_tx = 5;
_ty = _size select 1;
_scalarresult = false;

_difx = (_mapPosition select 0) - _posx;
_dify = (_mapPosition select 1) - _posy;
if(_difx == 0) then {
   _difx = 0.001;
};
if(_dify == 0) then {
    _dify = 0.001;
};
_dir = atan (_difx / _dify);
if (_dify < 0) then {_dir = _dir + 180};
_relativedir = _cDir - _dir;
_adis = abs (_tx / cos (90 - _relativedir));
_bdis = abs (_ty / cos _relativedir);
_borderdis = _adis min _bdis;
_positiondis = _mapPosition distance _objectPosition;

_in = if (_scalarresult) then {
    _positiondis - _borderdis;
} else {
    (_positiondis < _borderdis)
};

_in