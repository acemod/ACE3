// by KoffeinFlummi / commy2

private "_new";

_new = _this call AGM_Scopes_fnc_getOptics;

if (isNil "AGM_Scopes_Optics") then {
  AGM_Scopes_Optics = ["", "", ""];
};

if (isNil "AGM_Scopes_Adjustment") then {
  AGM_Scopes_Adjustment = [[0,0], [0,0], [0,0]];
};

{
  if (_new select _forEachIndex != _x) then {
    AGM_Scopes_Adjustment set [_forEachIndex, [0,0]];
  };
} forEach AGM_Scopes_Optics;

AGM_Scopes_Optics = _new;
