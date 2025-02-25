SELECT 
    channel_used, 
    SUM(conversion_rate) AS totalconversions    
FROM public.marketing_campaign
GROUP BY channel_used
ORDER BY totalconversions DESC;
