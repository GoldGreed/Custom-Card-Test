--SCP-054: Water Nymph
local s,id,o=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		e1:SetValue(1)
		c:RegisterEffect(e1)
	
end
