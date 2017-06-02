// TODO: Header

if ((ctrlText 170) in GVAR(defaultLoadoutNames)) then {
    ctrlEnable [180, false];
    ctrlEnable [200, false];
} else {
    ctrlEnable [180, true];
    ctrlEnable [200, true];
};
