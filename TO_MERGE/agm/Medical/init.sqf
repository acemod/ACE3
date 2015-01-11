// by commy2, handle AI

0 spawn {
  while {true} do {
    sleep 10;

    _allGroups = [allGroups, {local _this}] call AGM_Core_fnc_filter;

    {
      {
        call {
          if (damage _x > 0) exitWith {
            [_x, "bandage"] call AGM_Medical_fnc_aiInitTask;
          };

          if (_x getVariable ["AGM_isUnconscious", false]) exitWith {
            [_x, "epipen"] call AGM_Medical_fnc_aiInitTask;
          };

          if (_x getVariable ["AGM_Blood", 1] < 1) exitWith {
            [_x, "bloodbag"] call AGM_Medical_fnc_aiInitTask;
          };

          if (_x getVariable ["AGM_Pain", 0] > 0) exitWith {
            [_x, "morphine"] call AGM_Medical_fnc_aiInitTask;
          };
        };
      } forEach units _x
    } forEach _allGroups;
  };
};
