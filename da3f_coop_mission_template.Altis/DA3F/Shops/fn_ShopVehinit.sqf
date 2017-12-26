/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       init_ItemsShop.sqf
*
*/
#include "fn_Cfg_ShohVehinit.sqf"
disableSerialization;
if !(createDialog "DA3F_SpawnVeh")exitWith {};
cutText ["","BLACK",0];
[]spawn {
  waitUntil {isNull (findDisplay 1811173)};
cutText ["","BLACK IN",1];
};
_display = (findDisplay 1811173);
((_display)displayCtrl 2103) ctrlShow false;
for "_a" from 0 to (count _arrayVeh - 1) do
    {
    _Shop = _arrayVeh select _a;
    _TypeShop = _Shop select 0;
        _add=lbAdd[2100,format ["%1",_TypeShop]];
    };
        _add=lbAdd[2100,format ["%1","Mon Garage"]];

for "_a" from 0 to (count _arrayMrkSp - 1) do
    {
        _mrk = (_arrayMrkSp select _a)select 0;
        _Infos_mrk = (_arrayMrkSp select _a)select 1;
        if (_Infos_mrk isEqualTo "") then [{
            _add=lbAdd[1501,format ["%1",markerText _mrk]];
        },{
            _add=lbAdd[1501,format ["%1 / %2",markerText _mrk,_Infos_mrk]];
        }];
    };
{
    _add=lbAdd[2101,_x];
}forEach [
"Rester sur place",
"Spawn dans le véhicule"
];

{
    _add=lbAdd[2102,_x];
}forEach [
"150",
"250",
"500",
"750",
"1000"
];
