class ACE_Triggers {
    /* onPlace Parameters:
     * 0: Unit placing <OBJECT>
     * 1: Explosive <OBJECT>
     * 2: Magazine classname <STRING>
     * 3: Additional arguments <ARRAY>
     *    - Same as those passed to FUNC(placeExplosive) for specific trigger type
     *    - Last element is ACE_Triggers config of the trigger type <CONFIG>
     *
     * onSetup Parameters:
     * 0: Explosive <OBJECT>
     * 1: Magazine classname <STRING>
     *
     * For both, expected return type is BOOL.
     * True indicates manual handling of explosive setup/placement.
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
        onPlace = QUOTE(false);
    };
    class Timer {
        isAttachable = 1;
        displayName = CSTRING(timerName);
        picture = QPATHTOF(data\UI\Timer.paa);
        onPlace = QUOTE([ARR_2(_this select 1, _this select 3 select 0)] call FUNC(startTimer); false);
        onSetup = QUOTE(_this call FUNC(openTimerUI));
    };
    class Tripwire {
        isAttachable = 0;
        displayName = CSTRING(TripWire);
        picture = QPATHTOF(Data\UI\Tripwire.paa);
        onPlace = QUOTE(false);
    };
};
