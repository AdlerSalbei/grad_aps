params ["_vehicle", "_missile"];

private _distance = _vehicle distance _missile;

if (_distance > 50) exitWith {_x setVariable [QGVAR(isBeeingTracked), false, false];};
if (_distance > 30) exitWith {
    [
        {(((_this select 0) distance (_this select 1)) <= 30)},
        {_this call FUNC(_handleMissile);},
        [_vehicle, _missile],
        10,
        {(_this select 1) setVariable [QGVAR(isBeeingTracked), false, false];}
    ] call CBA_fnc_waitUntilAndExecute;
};

[
{
    params ["_vehicle", "_missile", "_distance"];
    if ((_vehicle distance _missile) > _distance) exitWith {};
    [_missile] call FUNC(destroyMissile);
},
[_vehicle, _missile, _distance]
] call CBA_fnc_execNextFrame;
