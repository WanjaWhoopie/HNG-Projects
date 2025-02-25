SELECT campaign_id, SUM(impressions) AS totalimpressions
FROM public.marketing_campaign
GROUP BY campaign_id
ORDER BY totalimpressions DESC;

