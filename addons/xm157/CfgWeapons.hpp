class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class ace_xm157_prototype: ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 1; // hidden
        displayName = "XM157 Prototype";
        descriptionShort = "";
        picture = "\a3\Weapons_F\acc\Data\UI\icon_optic_tws_ca.paa";
        model = "\A3\weapons_f\acc\acco_tws_F";
        inertia = 0.3;
        ACE_ScopeHeightAboveRail = 5.52874;

        class CBA_ScriptedOptic {
            bodyTexture = QPATHTOF(data\ace_vector_body_co.paa);
            // bodyTextureNight = ".paa"; // optional
            bodyTextureSize = 1;
            hideMagnification = 1; // no point, and it flickers at 1x
            disableTilt = 0;
        };

        weaponInfoType = QGVAR(info);
        class ItemInfo: InventoryOpticsItem_Base_F {
            mass = 14;
            optics = 1;
            modelOptics = "\x\cba\addons\optics\cba_optic_big_100.p3d";
            class OpticsModes {
                class lpvo {
                    opticsID = 1;
                    useModelOptics = 1;
                    opticsPPEffects[] = { "OpticsCHAbera1", "OpticsBlur1" };
                    opticsZoomMin = "8 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomMax = "1 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomInit = "1 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                    distanceZoomMin = 100;
                    distanceZoomMax = 100;
                    memoryPointCamera = "opticView";
                    visionMode[] = {"Normal"};
                    opticsFlare = 1;
                    opticsDisablePeripherialVision = 1;
                    cameraDir = "";
                };
            };
        };
    };
#ifdef CREATE_MOCK_PLATFORMS
    class arifle_MX_Black_F;
    class GVAR(mock_gl): arifle_MX_Black_F {
        scope = 1;
        scopeArsenal = 1;
        magazineWell[] = {};
        magazines[] = { QGVAR(mock_airburst_mag) };
        modes[] = {"Single"};
        discreteDistance[] = {100};
        discreteDistanceInitIndex = 0;
    };
#endif
};
