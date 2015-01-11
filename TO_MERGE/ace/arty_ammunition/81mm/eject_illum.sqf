//eject_illum.sqf
private["_shell", "_velocity", "_pos", "_flareChute", "_chuteVel"];

_shell = _this select 6;

_velocity = velocity _shell;

_pos = getPos _shell;

_flareChute = "ace_arty_81mm_m853a1_m772_parachute" createVehicle _pos;
_flareChute setPos _pos;
_chuteVel = [_velocity,0.25] call ACE_fnc_vectorMultiply;
_flareChute setVelocity _chuteVel;

false
