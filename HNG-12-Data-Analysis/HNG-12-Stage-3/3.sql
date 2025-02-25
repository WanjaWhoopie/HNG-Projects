SELECT location, SUM(impressions) AS totalimpressions
FROM public.marketing_campaign
GROUP BY location
ORDER BY totalimpressions DESC
LIMIT 3;

