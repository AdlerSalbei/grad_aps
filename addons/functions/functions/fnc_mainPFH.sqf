#include "script_component.hpp"
missionNamespace setVariable [QGVAR(pfhActiv), true, false];

[{
    params ["", "_handle"];

    private _vehicles = missionNamespace getVariable [QGVAR(activVehicles), []];
    if (_vehicles isEqualTo []) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};

    private _checkedVehicles = [];

    {
        private _charges = _x getVariable [QGVAR(charges),0];
        private _chargesCount = 0;

        if (_charges isEqualType []) then {
            {
                _chargesCount = _chargesCount + (_charges select _forEachIndex);
            }forEach _charges;
        }else{
            _chargesCount = _charges
        };

        if (_chargesCount > 0 && {isEngineOn _x}) then {
            private _vehicle = _x;
            {
                if (!(isNull _x) && {!(_x getVariable [QGVAR(isBeeingTracked), false])}) then {
                    _x setVariable[QGVAR(isBeeingTracked), true];
                    [_vehicle, _x] call FUNC(handleMissile);
                };
            }forEach [(nearestObject [_vehicle, "RocketCore"]),(nearestObject [_vehicle, "MissileCore"])];

            if (_chargesCount > 0) then {
                _checkedVehicles pushBack _vehicle;
            };
        };
    }forEach _vehicles;

    missionNamespace setVariable [QGVAR(activVehicles), _checkedVehicles];
},0.1,[]] call CBA_fnc_addPerFrameHandler;
