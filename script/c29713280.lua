--Squadrion Match Flame
local s,id,o=GetID()
function s.initial_effect(c)
	--reduce atk
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(0,LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(-1500)
	c:RegisterEffect(e1)
end
