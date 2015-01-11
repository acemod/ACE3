// by Falke

disableSerialization;
_display1 = _this select 0;
_ctrl10 = _display1 displayCtrl 42010;
_rad1=1;
AGM_Kestrel_wind_Head=0;
while {AGM_isKestrelWheel} do {
  _rad2=(AGM_Kestrel_wind_Head*2);
  if (_rad2 > 5) then { _rad2=5;  };
  if (_rad2 < -5) then {  _rad2=-5; };
  _rad1=_rad1+_rad2;
  if (_rad1 < 0) then { _rad1=_rad1+9;  };
  if (_rad1 > 9) then { _rad1=_rad1-9;  };
  waitUntil {preloadTitleRsc ["AGM_KestrelWheel_Preload", "PLAIN"]};
  _ctrl10 ctrlSetText format["AGM_Wind\data\kestrel_%1.paa",round _rad1];
  _Night = (sunOrMoon*sunOrMoon+(moonIntensity/5));
  _ctrl10 ctrlsettextcolor [_Night,_Night,_Night,1];
  sleep 0.01;
  _i = 0; waitUntil {_i = _i + 1; _i > 1};
};
_ctrl10 ctrlShow false;
