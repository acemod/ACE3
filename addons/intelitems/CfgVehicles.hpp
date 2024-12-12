class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(DisplayName);
                condition = QUOTE(visibleMap);
                exceptions[] = {"isNotInside", "notOnMap"};
                statement = "";
                insertChildren = QUOTE(_player call FUNC(addActions));
                icon = "";
            };
        };
    };

    class ThingX;
    class GVAR(base): ThingX {
        XEH_ENABLED;
        icon = "iconObject_2x3";
        mapSize = 0.3;
        simulation = "House"; // Needed because the objects don't have good collision physx
        destrType = "DesturctNo";
        curatorInfoTypeEmpty = QGVAR(RscSetData);
        editorSubcategory = QUOTE(XADDON);
        GVAR(magazine) = "";
        class Attributes {
            class GVAR(data) {
                displayName = CSTRING(Text);
                property = QGVAR(data);
                control = "EditMulti5";
                expression = QUOTE([ARR_2(_this,_value)] call FUNC(setObjectData));
                defaultValue = "''";
                validate = "STRING";
                typeName = "STRING";
            };
        };
        class ACE_Actions {
            class GVAR(pickup) {
                displayName = CSTRING(Pickup);
                icon = "\a3\ui_f\data\igui\cfg\actions\take_ca.paa";
                distance = 2;
                condition = QUOTE(_this call FUNC(canPickup));
                statement = QUOTE(_this call FUNC(pickup));
            };
        };
    };

    class XGVAR(notepad): GVAR(base) {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Notepad_DisplayName);
        model = "\a3\structures_f\items\documents\notepad_f.p3d";
        editorPreview = "\a3\editorpreviews_f\data\cfgvehicles\land_notepad_f.jpg";
        scope = 2;
        scopeCurator = 2;
        GVAR(magazine) = QXGVAR(notepad);
    };

    class XGVAR(document): GVAR(base) {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Document_DisplayName);
        model = "\a3\structures_f\items\documents\file2_f.p3d";
        editorPreview = "\a3\editorpreviews_f\data\cfgvehicles\intel_file2_f.jpg";
        scope = 2;
        scopeCurator = 2;
        GVAR(magazine) = QXGVAR(document);
    };

    class XGVAR(photo): GVAR(base) {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Photo_DisplayName);
        model = "\a3\structures_f\items\documents\filephotos_f.p3d";
        editorPreview = "\a3\editorpreviews_f\data\cfgvehicles\land_filephotos_f.jpg";
        scope = 2;
        scopeCurator = 2;
        GVAR(magazine) = QXGVAR(photo);
        class Attributes: Attributes {
            class GVAR(data): GVAR(data) {
                displayName = CSTRING(Photo_Filename);
                control = "Edit";
            };
        };
    };
};
