class CfgMagazines {
    class CA_Magazine;
    class GVAR(base): CA_Magazine {
        count = 1;
        mass = 1;
        ACE_isUnique = 1;
        GVAR(intel) = 1;
        GVAR(control) = "";
    };

    class XGVAR(notepad): GVAR(base) {
        author = ECSTRING(common,ACETeam);
        scope = 2; // Allows players to access from arsenal
        displayName = CSTRING(Notepad_DisplayName);
        descriptionShort = CSTRING(Notepad_Description);
        picture = QPATHTOF(ui\notepad_ca.paa);
        model = "\a3\structures_f\items\documents\notepad_f.p3d";
        GVAR(control) = QGVAR(RscNotepad);
    };

    class XGVAR(document): GVAR(base) {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(Document_DisplayName);
        descriptionShort = CSTRING(Document_Description);
        picture = QPATHTOF(ui\document_ca.paa);
        model = "\a3\structures_f\items\documents\file2_f.p3d";
        GVAR(control) = QGVAR(RscDocument);
    };

    class XGVAR(photo): GVAR(base) {
        author = ACECSTRING(common,ACETeam);
        displayName = CSTRING(Photo_DisplayName);
        descriptionShort = CSTRING(Photo_Description);
        picture = QPATHTOF(ui\photo_ca.paa);
        model = "\a3\structures_f\items\documents\filephotos_f.p3d";
        GVAR(control) = QGVAR(RscPhoto);
    };
};
