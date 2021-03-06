
waitUntil {!isNull player};
waitUntil {(vehicle player) == player};
waitUntil {(getPlayerUID player) != ""};

player setVariable["Saved_Loadout",getUnitLoadout player];				// Save loadout plater is built with
player setCustomAimCoef 0.10;											// lowers sway
player setUnitRecoilCoefficient 0.30;									// lowers recoil

reserved_units = [gm1,gm2];

_uid = getPlayerUId player;

if ((player in reserved_units)&& !(_uid in nastyfunction)) then {
   player groupChat "You are in a ZEUS slot, kicking to lobby in 5 seconds";
   sleep 5;
   failMission "end1";
 };
enableSaving false;
enableSentences false;
waitUntil {time > 0};
enableEnvironment [false, true];

CHVD_allowNfoGrass = true; 
CHVD_maxView = 7500; // Set maximum view distance (default: 12000)
CHVD_maxObj = 7500; // Set maximimum object view distance (default: 12000)

//------------------- client executions

_null = [] execVM "scripts\misc\earplugs.sqf";									//Earplugs from the start

//------------------ BIS groups
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

[missionNamespace, "arsenalClosed", {	
	player setVariable ["Saved_Loadout",getUnitLoadout player];
	hint "gear saved !"
}] call BIS_fnc_addScriptedEventHandler;