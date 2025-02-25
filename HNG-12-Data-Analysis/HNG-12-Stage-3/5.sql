SELECT 
    ROUND((SUM(clicks)::numeric / NULLIF(SUM(impressions), 0)::numeric) * 100, 2) AS overallctr
FROM public.marketing_campaign;
