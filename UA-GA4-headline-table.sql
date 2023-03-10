//sam to post code so far
SELECT
  h.site as UA_site_name,
  h.event_info.category as UA_event_name,
  h.event_info.action as UA_event_action,
  g.site as GA4_site_name, 
  g.event_name as GA4_event_name,
  g.event_action as GA4_event_action,
  --g.event_label

FROM `which-query-data.analytics_tables.ua_rollup_prod`,
UNNEST(hits) AS H
join `which-query-data.analytics_tables.ga4_rollup_prod` as G
 on  h.site = g.site
WHERE date = "2021-12-22" 
  AND h.site = "reviews_advice"
  and h.event_info.category in ('login')
  and g.event_name in ('login')
  and G.event_action is not null
limit 100
