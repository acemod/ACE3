class ACE_Triggers {
    class Command;
    class GVAR(Command): Command {
        isAttachable = 0;
    };

    class MK16_Transmitter: Command {}; // define parent class to make this a soft depency on ACE Explosives
    class GVAR(MK16_Transmitter): MK16_Transmitter {
        isAttachable = 0;
    };
};
