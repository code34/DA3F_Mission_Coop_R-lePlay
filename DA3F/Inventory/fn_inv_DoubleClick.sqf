/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_inv_DoubleClick.sqf
*		Script de dépanage** Double click dans le menu I.
*		**Soucis rencontré avec la function A3 (problème venant de ma part très surement !)
*		[]call DA3F_fnc_inv_DoubleClick;
*/
if (isNil "DA3F_Dbl_clik") then [{
	DA3F_Dbl_clik = false;
	_wait = time + 1;
		waitUntil {time >= _wait};
			DA3F_Dbl_clik = nil;
	},{
	_this call DA3F_fnc_inv_UseItem;
		DA3F_Dbl_clik = nil;
}];