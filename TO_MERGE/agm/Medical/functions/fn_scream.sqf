/*
 * Author: KoffeinFlummi
 *
 * AAAAAAAAAAAAAAAAAARRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRGH
 *
 * Arguments:
 * 0: Unit to scream
 *
 * Return Value:
 * loud noises
 */

private ["_unit", "_screams", "_position"];

if (AGM_Medical_DisableScreams) exitWith {};

_unit = _this select 0;

_screams = [
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_01.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_02.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_03.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_04.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_06.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_07.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_08.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_09.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_10.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_11.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_12.wss",
  "A3\sounds_f\characters\human-sfx\Person0\P0_hit_13.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_01.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_02.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_03.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_04.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_05.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_06.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_07.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_08.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_09.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_10.wss",
  "A3\sounds_f\characters\human-sfx\Person1\P1_hit_11.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_01.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_02.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_03.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_04.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_05.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_06.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_07.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_08.wss",
  "A3\sounds_f\characters\human-sfx\Person2\P2_hit_09.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_01.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_02.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_03.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_04.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_05.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_06.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_07.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_08.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_09.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_10.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_11.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_12.wss",
  "A3\sounds_f\characters\human-sfx\Person3\P3_hit_13.wss"
];

_position = _unit modelToWorld (_unit selectionPosition "Head");
_position set [2, (_position select 2) + ((getPosASLW _unit select 2) - (getPosATL _unit select 2) max 0)];

playSound3D [
  _screams select (floor random (count _screams)),
  objNull,
  False,
  _position,
  2,
  1,
  300
];
