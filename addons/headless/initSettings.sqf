[
    QXGVAR(transferLoadout),
    "LIST",
    [LSTRING(TransferLoadout), LSTRING(TransferLoadoutDesc)],
    format ["ACEX %1", LLSTRING(Module)],
    [[0, 1, 2], [ELSTRING(Common,Disabled), LSTRING(TransferLoadoutCurrent), LSTRING(TransferLoadoutConfig)], 0],
    true,
    {},
    true // needs mission restart
] call CBA_fnc_addSetting;
