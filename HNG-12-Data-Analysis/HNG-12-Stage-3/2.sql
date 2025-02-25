SELECT campaign_id, company, roi
FROM public.marketing_campaign
WHERE roi = (SELECT MAX(roi) FROM public.marketing_campaign)
LIMIT 1;

