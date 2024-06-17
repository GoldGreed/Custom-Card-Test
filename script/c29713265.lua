--Crystal Clear Prison
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

function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(s.cfilter,1,nil,tp)
end

function s.cfilter(c,tp)
	return c:IsReason(REASON_DESTROY) and c:IsReason(REASON_BATTLE+REASON_EFFECT) and c:IsPreviousLocation(LOCATION_MZONE) and c:IsPreviousControler(tp)
end

function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	local rc=re:GetHandler()
	if rc:IsDestructable() and rc:IsRelateToEffect(re) then
		local c=e:GetHandler()
		local exc=(e:IsHasType(EFFECT_TYPE_ACTIVATE) and c:IsRelateToEffect(e)) and c or nil
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,eg+rc:GetColumnGroup():RemoveCard(exc),1,0,0)
	end
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local rc=re:GetHandler()
	local c=e:GetHandler()
	local exc=(e:IsHasType(EFFECT_TYPE_ACTIVATE) and c:IsRelateToEffect(e)) and c or nil
	local colg=rc:GetColumnGroup()
	if exc then colg:RemoveCard(exc) end
	if Duel.Destroy(eg,REASON_EFFECT)>0 and #colg>0 then
		Duel.BreakEffect()
		Duel.Destroy(colg,REASON_EFFECT)
	end
end