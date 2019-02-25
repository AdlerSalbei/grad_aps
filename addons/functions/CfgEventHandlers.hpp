class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Init_Eventhandlers
{
    class Man
    {
        init = "_this addEventHandler ["FiredMan", {_this call FUNC(missileHandlingEH);}];";
    };
};
