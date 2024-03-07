--SCP-054: Water Nymph
local s,id,o=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		e1:SetValue(1)
		c:RegisterEffect(e1)

			--Apply effects at the end of the opponent's Battle Phase
		local e2=Effect.CreateEffect(c)
		e2:SetDescription(aux.Stringid(id,1))
		e2:SetCategory(CATEGORY_DISABLE)
		e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
		e2:SetCode(EVENT_PHASE+PHASE_END)
		e2:SetRange(LOCATION_MZONE)
		e2:SetCondition(function(e,tp) return Duel.IsTurnPlayer(1-tp) end)
		e2:SetTarget(s.efftg)
		e2:SetOperation(s.effop)
		c:RegisterEffect(e2)
	
end

function s.efftg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.filter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_DISABLE,nil,1,1-tp,LOCATION_MZONE)
end

function s.effop(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,c:GetAttack())
end