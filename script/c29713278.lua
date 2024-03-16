--Squadrion Dualis
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--Fusion Materials
	Fusion.AddProcMix(c,true,true,64631466,aux.FilterBoolFunctionEx(Card.IsType,TYPE_EFFECT))
end
