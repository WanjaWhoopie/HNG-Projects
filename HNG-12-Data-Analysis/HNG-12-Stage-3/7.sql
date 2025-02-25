SELECT 
    campaign_id, 
    company, 
    ROUND((clicks::NUMERIC / NULLIF(impressions, 0)) * 100, 2) AS ctr
FROM public.marketing_campaign
WHERE (clicks::NUMERIC / NULLIF(impressions, 0)) * 100 > 90
ORDER BY ctr DESC;
