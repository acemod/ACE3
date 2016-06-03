class ACE_Triggers {
    /* onPlace parameters:
0: OBJECT - unit placing
1: OBJECT - Placed explosive
2: STRING - Magazine classname
3: ARRAY - vars
Last Index: ACE_Triggers config of trigger type.
onSetup parameters:
0: STRING - Magazine Classname
 */
    class Command {
        isAttachable = 1;
        displayName = CSTRING(clacker_displayName);
        picture = QPATHTOF(Data\UI\Clacker.paa);
        onPlace = QUOTE(_this call FUNC(AddClacker);false);
        requires[] = {"ACE_Clacker"};
    };
    class MK16_Transmitter: Command {
        isAttachable = 1;
        displayName = CSTRING(M152_displayName);
        picture = QPATHTOF(Data\UI\MK16_Reciever_ca.paa);
        requires[] = {"ACE_M26_Clacker"};
    };
    class DeadManSwitch: Command {
        isAttachable = 1;
        displayName = CSTRING(DeadManSwitch_displayName);
        picture = QPATHTOF(Data\UI\DeadmanSwitch.paa);
        requires[] = {"ACE_DeadManSwitch"};
    };
    class Cellphone: Command {
        isAttachable = 1;
        displayName = CSTRING(cellphone_displayName);
        picture = QPATHTOF(Data\UI\Cellphone_UI.paa);
        onPlace = QUOTE(_this call FUNC(addCellphoneIED);false);
        requires[] = {"ACE_Cellphone"};
    };
    class PressurePlate {
        isAttachable = 0;
        displayName = CSTRING(PressurePlate);
        picture = QPATHTOF(Data\UI\PressurePlate.paa);
        onPlace = QUOTE(false);
    };
    class IRSensor {
        isAttachable = 0;
        displayName = CSTRING(IRSensor);
        picture = QPATHTOF(Data\UI\PressurePlate.paa);
        onPlace = "false";
    };
    class Timer {
        isAttachable = 1;
        displayName = CSTRING(timerName);
        picture = QPATHTOF(data\UI\Timer.paa);
        onPlace = QUOTE([ARR_2(_this select 1,(_this select 3) select 0)] call FUNC(startTimer);false);
        onSetup = QUOTE(_this call FUNC(openTimerSetUI);true);
    };
    class Tripwire {
        isAttachable = 0;
        displayName = CSTRING(TripWire);
        picture = QPATHTOF(Data\UI\Tripwire.paa);
        onPlace = "false";
    };
};
