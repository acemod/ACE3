//eject_illum.sqf
private["_shell", "_velocity", "_pos", "_flareChute", "_chuteVel"];

_shell = _this select 6;

_velocity = velocity _shell;

_pos = getPos _shell;

_flareChute = "ace_arty_105mm_m314a3_m782_parachute" createVehicle _pos;
_flareChute setPos _pos;
////player sideChat format["chutPos: %1", _pos];
_chuteVel = [_velocity,0.25] call ACE_fnc_vectorMultiply;
////player sideChat format["p: %1", (_chuteVel call CBA_fnc_vect2Polar)];

_flareChute setVelocity _chuteVel;



false