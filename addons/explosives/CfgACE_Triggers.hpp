class CfgACE_Triggers {
  /* onPlace parameters:
  0: OBJECT - unit placing
  1: OBJECT - Placed explosive
  2: STRING - Magazine classname
  3: ARRAY - vars
  Last Index: CfgACE_Triggers config of trigger type.
  onSetup parameters:
  0: STRING - Magazine Classname
  */
  class Command {
    displayName = $STR_ACE_Explosives_clacker_displayName;
    picture = QUOTE( PATHTOF(Data\UI\Clacker.paa) );
    onPlace = QUOTE( _this call FUNC(AddClacker);false );
    requires[] = {"ACE_Clacker"};
  };
  class MK16_Transmitter:Command {
    displayName = $STR_ACE_Explosives_MK16_displayName;
    picture = QUOTE( PATHTOF(Data\UI\MK16_Reciever_ca.paa) );
    requires[] = {"ACE_M26_Clacker"};
  };
  class DeadManSwitch:Command {
    displayName = $STR_ACE_Explosives_DeadManSwitch_displayName;
    picture = QUOTE( PATHTOF(Data\UI\DeadmanSwitch.paa) );
    requires[] = {"ACE_DeadManSwitch"};
  };
  class PressurePlate {
    displayName = $STR_ACE_Explosives_PressurePlate;
    picture = QUOTE( PATHTOF(Data\UI\PressurePlate.paa) );
    onPlace = "_dist=GetNumber(ConfigFile >> 'CfgMagazines' >> (_this select 2) >> 'ACE_Triggers' >> 'PressurePlate' >> 'digDistance');_ex=_this select 1;_ex setPosATL ((getPosATL _ex) vectorDiff ((VectorUp _ex) vectorCrossProduct [0,0,_dist]));false";
  };
  class IRSensor {
    displayName = $STR_ACE_Explosives_IRSensor;
    picture = QUOTE( PATHTOF(Data\UI\PressurePlate.paa) );
    onPlace = "false";
  };
  class Timer {
    displayName = $STR_ACE_Explosives_timerName;
    picture = "ACE_Explosives\data\UI\Timer.paa";
    onPlace = QUOTE( [_this select 1, (_this select 3) select 0] call FUNC(startTimer);false );
    onSetup = QUOTE( _this call FUNC(openTimerSetUI);true );
  };
  class Tripwire {
    displayName = $STR_ACE_Explosives_TripWire;
    picture = QUOTE( PATHTOF(Data\UI\Tripwire.paa) );
    onPlace = "false";
  };
};
