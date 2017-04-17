class Medical {
   class ACE_Torso {
        class Biofoam {
            displayName = "Biofoam";
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