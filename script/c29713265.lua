--Crystal Clear Prison
local s,id,o=GetID()
function c29713265.initial_effect(c)
	--Negate an activation, destroy the card and all cards in the same column
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(s.condition) 
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end

function s.spfilter(c,tp)
	return c:IsReason(REASON_DESTROY) and c:IsPreviousControler(tp) and c:IsMonster()
end

function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return not eg:IsContains(e:GetHandler()) and eg:IsExists(s.spfilter,1,nil,tp)
end

function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local exc=(e:IsHasType(EFFECT_TYPE_ACTIVATE) and c:IsRelateToEffect(e)) and c or nil
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,eg+rc:GetColumnGroup():RemoveCard(exc),1,0,0)
end

function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local exc=(e:IsHasType(EFFECT_TYPE_ACTIVATE) and c:IsRelateToEffect(e)) and c or nil
	local colg=rc:GetColumnGroup()
	if exc then colg:RemoveCard(exc) end
	if Duel.Destroy(eg,REASON_EFFECT)>0 and #colg>0 then
		Duel.BreakEffect()
		Duel.Destroy(colg,REASON_EFFECT)
	end
end