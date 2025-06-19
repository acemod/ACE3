
class RadioProtocolBase {
    class Words;
};

class ACE_RadioProtocolNoRadio: RadioProtocolBase {
    class Words: Words {
        grid_zero[] = {};
        grid_one[] = {};
        grid_two[] = {};
        grid_three[] = {};
        grid_four[] = {};
        grid_five[] = {};
        grid_six[] = {};
        grid_seven[] = {};
        grid_eight[] = {};
        grid_nine[] = {};
        grid_zero_2[] = {};
        grid_one_2[] = {};
        grid_two_2[] = {};
        grid_three_2[] = {};
        grid_four_2[] = {};
        grid_five_2[] = {};
        grid_six_2[] = {};
        grid_seven_2[] = {};
        grid_eight_2[] = {};
        grid_nine_2[] = {};
        grid_zero_3[] = {};
        grid_one_3[] = {};
        grid_two_3[] = {};
        grid_three_3[] = {};
        grid_four_3[] = {};
        grid_five_3[] = {};
        grid_six_3[] = {};
        grid_seven_3[] = {};
        grid_eight_3[] = {};
        grid_nine_3[] = {};
        Ready[] = {};
        Waiting[] = {};
        StandingBy[] = {};
        RallyUp[] = {};
        UnderFireE[] = {};
        /*IAmReady[] = {};
        ReadyForOrders[] = {};
        AwaitingOrders[] = {};*/
    };
};

class CfgVoice {
    class ACE_NoVoice {
        author = CSTRING(ACETeam);
        protocol = "ACE_RadioProtocolNoRadio";
        variants[] = {1};
        directories[] = {"",""};
        identityTypes[] = {"Default"};
        scope = 2;
        voiceType = "";
        icon = "\a3\Ui_f\data\Map\Markers\Flags\nato_ca.paa";
        displayName = CSTRING(NoVoice);
    };
};

class CfgVoiceTypes {
    class ACE_NoVoice {
        name = CSTRING(NoVoice);
        voices[] = {"ACE_NoVoice","ACE_NoVoice","ACE_NoVoice"};
        preview = "ACE_NoVoice";
        alternative = "";
    };
};
