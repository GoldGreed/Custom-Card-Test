--Squadrion Dualis
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--Fusion Materials
	Fusion.AddProcMix(c,true,true,aux.FilterBoolFunctionEx(Card.IsSetCard,0x7e5),aux.FilterBoolFunctionEx(Card.IsType,TYPE_EFFECT))
	--Gains 500 ATK per opponent's monsters
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(s.atkval)
	c:RegisterEffect(e1)
end

function s.atkval(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),0,LOCATION_MZONE)*500
end