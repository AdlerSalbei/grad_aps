params ["", "", "", "", "", "", "_projectile"];

if (_projectile isKindOf "RocketCore" || {_projectile isKindOf "MissileCore"}) then {
    {
        private _vehicle = _x;
        private _distance = _vehicle distance _projectile;
        if (_distance < 30) then {
            [_vehicle, _projectile, _distance] call FUNC(handleMissile);
        }else{
            [
                {((_this select 0) distance (_this select 1)) < 30},
                {
                    params ["_vehicle", "_projectile"];
                    [_vehicle, _projectile, (_vehicle distance _projectile)] call FUNC(handleMissile);
                },
                [_vehicle, _projectile],
                10,
                {}
            ] call CBA_fnc_waitAndExecute;
        };
    }forEach (missionNamespace getVariable [QGVAR(activVehicles), []]);
};
