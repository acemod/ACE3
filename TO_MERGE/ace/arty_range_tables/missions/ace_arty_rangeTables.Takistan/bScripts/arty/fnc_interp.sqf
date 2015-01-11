private ["_ndist","_dist1","_dist2","_elev1","_elev2","_nelev","_slide"];

_ndist = _this select 0;
_elev1 = (_this select 1) select 0;
_dist1 = (_this select 1) select 1;
_elev2 = (_this select 2) select 0;
_dist2 = (_this select 2) select 1;

if (_dist2 > _dist1) then {
_slide = (_ndist-_dist1)/(_dist2-_dist1);
}else{//high
_slide = (_ndist-_dist2)/(_dist1-_dist2);
};

_nelev = _elev2-(_elev2-_elev1)*_slide;

//diag_log format ["%1 < %2 < %3 | %4 < %5 < %6 | %7",_dist1,_ndist,_dist2,_elev1,_nelev,_elev2, _slide];

_nelev;