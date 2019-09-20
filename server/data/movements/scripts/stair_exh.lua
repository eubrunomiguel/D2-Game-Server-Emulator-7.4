local exhausted = createConditionObject(CONDITION_EXHAUST_COMBAT)
setConditionParam(exhausted, CONDITION_PARAM_TICKS, 1000)

function onStepIn(cid, item, position, fromPosition)

  if (hasCondition(cid, CONDITION_EXHAUST_COMBAT) == 0) then
     doAddCondition(cid, exhausted)
  end
  return TRUE
end