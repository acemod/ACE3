// Made by Glowbal
// Input: unit, object (Civ AI)
// Returns String array, contains strings with possible sentences

private ["_arrayWithStrings", "_behaviour"];
_behaviour = _this select 0;
_arrayWithStrings = [];

switch (_behaviour) do {
  case "agressive":
  {
    _arrayWithStrings = CSE_AgressiveLines_AIM;
  };

  case "friendly":
  {
    _arrayWithStrings = CSE_FriendlyLines_AIM;
  };

  case "neutral":
  {
    _arrayWithStrings = CSE_NeutralLines_AIM;
  };

  case "careless":
  {
    _arrayWithStrings = CSE_CarelessLines_AIM;
  };

  case "hostile":
  {
    _arrayWithStrings = CSE_HostileLines_AIM;
  };

  case "lostchicken":
  {
    _arrayWithStrings = CSE_OtherLines_AIM;
  };

  case default
  {
    _arrayWithStrings = CSE_DefaultLines_AIM;
  };
};

_arrayWithStrings