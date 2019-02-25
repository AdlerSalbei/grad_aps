[
{
    params ["_vehicle", "_missile", "_distance"];
    if ((_vehicle distance _missile) > _distance) exitWith {};
    [_missile] call FUNC(destroyMissile);
},
_this
] call CBA_fnc_execNextFrame;
