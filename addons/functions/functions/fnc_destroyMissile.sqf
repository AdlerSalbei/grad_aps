params ["_missile"];

"HelicopterExploSmall" createVehicle (getPosATL _missile);
[(getPosASL _missile), [], "handGrenade"] call ace_frag_fnc_frago;
deleteVehicle _missile;
