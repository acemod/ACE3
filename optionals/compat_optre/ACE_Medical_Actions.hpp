class ACE_Head {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'head', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'head', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
class ACE_Torso {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
class ACE_ArmLeft {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
class ACE_ArmRight {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
class ACE_LegLeft {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
class ACE_LegRight {
    class Biofoam {
        displayName = CSTRING(Biofoam);
        distance = 2.0;
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Biofoam')] call DEFUNC(medical,canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Biofoam')] call DEFUNC(medical,treatment));
        Exceptions[] = {};
        showDisabled = 1;
        priority = 2;
        hotkey = "";
        icon = PATHTOF(UI\icons\Biofoam.paa);
    };
};
