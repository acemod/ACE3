// TMR: Optics initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.

// Request a resource layer from the game engine.
AGM_Optics_scopeRSC = ["AGM_Optics_Scope"] call BIS_fnc_rscLayer;

// Set global variables
AGM_Optics_inScope = false; // Is the scope up?
AGM_Optics_currentOptic = ""; // What optic is attached right now?

0 = 0 spawn {
  waituntil {!isNull (findDisplay 46)};

  [] call AGM_Optics_fnc_initScope;

  // PiP technique by BadBenson
  AGM_Optics_Camera = "camera" camCreate (positioncameratoworld [0,0,0]);
  AGM_Optics_Camera camSetFov 0.7;
  AGM_Optics_Camera camSetTarget player;
  AGM_Optics_Camera camCommit 1;
  "agm_optics_rendertarget0" setPiPEffect [2, 1.0, 1.0, 1.0, 0.0, [0.0, 1.0, 0.0, 0.25], [1.0, 0.0, 1.0, 1.0], [0.199, 0.587, 0.114, 0.0]];
  AGM_Optics_Camera cameraEffect ["INTERNAL", "BACK","agm_optics_rendertarget0"];

  waitUntil {[] call AGM_Optics_fnc_mainLoop; False};
};
