params ["_missile"];

_explosionEffect = "HelicopterExploSmall" createVehicle (getPosATL _shell);
deleteVehicle _missile;
