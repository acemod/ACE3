// by CAA-Picard

if (isServer) then {
  diag_log _this;
} else {
  [_this, QUOTE(FUNC(serverLog)), 1] call FUNC(execRemoteFnc);
};
