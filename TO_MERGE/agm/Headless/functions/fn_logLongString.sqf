// by commy2

private ["_array", "_string"];

_array = toArray (_this select 0);

while {count _array > 1024} do {
  _string = + _array;

  _string resize 1024;
  diag_log text toString _string;

  _array deleteRange [0, 1023];
};
diag_log text toString _array;
