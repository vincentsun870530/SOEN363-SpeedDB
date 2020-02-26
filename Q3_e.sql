-- Critiques say that some words used in tags to convey emotions are very recurrent. To
-- convey positive and negative emotions, the words ’good’ and ’bad’, respectively, are used
-- predominantly in tags. Print all movie titles whose audience opinion is split (i.e., has at
-- least one audience who expresses positive emotion and at least one who expresses negative
-- emotion).

select distinct m.title
from movies m, tags t1, tags t2, tag_names tn1, tag_names tn2
where m.mid = t1.mid and t1.tid = tn1.tid and tn1.tag like '%good%'
and m.mid = t2.mid and t2.tid = tn2.tid and tn2.tag like '%bad%';
