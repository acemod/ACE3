class Medical {
    class ACE_Head {
         class Biofoam {
             displayName = CSTRING(Biofoam);
             distance = 2.0;
             condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
             exceptions[] = {"isNotInside"};
             statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
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
            exceptions[] = {"isNotInside"};
            statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
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
             condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
             exceptions[] = {"isNotInside"};
             statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
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
             condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
             exceptions[] = {"isNotInside"};
             statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
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
             condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
             exceptions[] = {"isNotInside"};
             statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
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
             condition = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,canTreatCached));
             exceptions[] = {"isNotInside"};
             statement = QUOTE([ARR_4(_player, _target, 'body', 'Biofoam')] call DEFUNC(medical,treatment));
             showDisabled = 1;
             priority = 2;
             hotkey = "";
             icon = PATHTOF(UI\icons\Biofoam.paa);
         };
    };
};
