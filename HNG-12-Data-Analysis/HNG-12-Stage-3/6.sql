SELECT 
    campaign_id, 
    company, 
    acquisition_cost / NULLIF(conversion_rate, 0) AS costperconversion
FROM public.marketing_campaign
ORDER BY costperconversion ASC;
