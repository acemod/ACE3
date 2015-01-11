// by CAA-Picard

if (isServer) then {
  diag_log _this;
} else {
  [_this, "GVAR(fnc_serverLog)", 1] call GVAR(fnc_execRemoteFnc);
};
