params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

if (_projectile isKindOf "RocketCore" || {_projectile isKindOf "MissileCore"}) then {
    {
        private _distance = _x distance _projectile;
        if (_distance < 30) then {
            [_vehicle, _missile, _distance] call FUNC(handleMissile);
        }else{
            [
                {((_this select 0) distance (_this select 1)) < 30},
                {
                    params ["_vehicle", "_missile"];
                    [_vehicle, _missile, (_vehicle distance _projectile)] call FUNC(handleMissile);
                },
                [_vehicle, _missile],
                10,
                {}
            ] call CBA_fnc_waitAndExecute;
        };
    }forEach missionNamespace getVariable [QGVAR(activVehicles), []];
};
