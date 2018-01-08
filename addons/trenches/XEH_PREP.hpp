PREP(applyCamouflageAttribute);
PREP(canContinueDiggingTrench);
PREP(canDigTrench);
PREP(canPlaceCamouflage);
PREP(canRemoveCamouflage);
PREP(canRemoveTrench);
PREP(continueDiggingTrench);
PREP(deleteCamouflage);
PREP(handleInteractMenuOpened);
PREP(handleKilled);
PREP(handlePlayerChanged);
PREP(handlePlayerInventoryChanged);
PREP(handleScrollWheel);
PREP(handleUnconscious);
PREP(initCurator);
PREP(initTrench);
PREP(initTrench3DEN);
PREP(placeCamouflage);
PREP(placeCancel);
PREP(placeConfirm);
PREP(placeTrench);
PREP(removeCamouflage);
PREP(removeTrench);
PREP(setTrenchPlacement);

if ("surfaceTexture" in (uiNamespace getVariable ["Intercept_cba_capabilities",[]])) then {
    #ifdef DISABLE_COMPILE_CACHE
        DFUNC(getSurfaceTexturePath) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,getSurfaceTexturePathNative).sqf);
    #else
        [QPATHTOF(functions\DOUBLES(fnc,getSurfaceTexturePathNative).sqf), QFUNC(getSurfaceTexturePath)] call CBA_fnc_compileFunction;
    #endif
} else {
    PREP(getSurfaceTexturePath);
}
