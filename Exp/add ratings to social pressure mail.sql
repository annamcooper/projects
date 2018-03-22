select
v.*
,case when general16 is not null then 'Y' else null end as general16
,case when general14 is not null then 'Y' else null end as general14
,case when general12 is not null then 'Y' else null end as general12
,case   when general16 is null and general14 is null and general12 is null then '0'

        when ((general16 is not null and general14 is null and general12 is null)
        or (general16 is null and general14 is not null and general12 is null)
        or (general16 is null and general14 is null and general12 is not null)) then '1'
        
        when ((general16 is not null and general14 is not null and general12 is null)
        or (general16 is not null and general14 is null and general12 is not null)
        or (general16 is null and general14 is not null and general12 is not null)) then '2'
        
        when general16 is not null and general14 is not null and general12 is not null then '3' 
        else null end as "election count"
,case 
        when ((general16 is not null and general14 is null and general12 is null)
        or (general16 is null and general14 is not null and general12 is null)
        or (general16 is null and general14 is null and general12 is not null)
        or (general16 is null and general14 is null and general12 is null)) then 'Poor'
        
        when ((general16 is not null and general14 is not null and general12 is null)
        or (general16 is not null and general14 is null and general12 is not null)
        or (general16 is null and general14 is not null and general12 is not null)) then 'Good'
        
        when general16 is not null and general14 is not null and general12 is not null then 'Excellent'
        else null end as "Rating"
from mn_voting_rights_10182017 v
left join mn_gotv_vote_hist_all h using (voterfilevanid)
