SELECT target_audience, AVG(engagement_score) AS avgengagementscore
FROM public.marketing_campaign
GROUP BY target_audience
ORDER BY avgengagementscore DESC;


