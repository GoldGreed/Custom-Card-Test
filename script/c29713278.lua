--Squadrion Dualis
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--Fusion Materials
	Fusion.AddProcMix(c,true,true,aux.FilterBoolFunctionEx(Card.IsSetCard,0x7e5),aux.FilterBoolFunctionEx(Card.IsType,TYPE_EFFECT))
end
