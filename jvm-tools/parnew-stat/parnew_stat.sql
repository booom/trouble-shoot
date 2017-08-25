SELECT gc_time,heap_after_gc,
newgen_after_gc,
ms_elapsed,
((SELECT MAX(newgen_after_gc) FROM parnew_gc)-newgen_after_gc) as newgen_remain,
(newgen_before_gc-newgen_after_gc-heap_before_gc+heap_after_gc)/1024 as promotion
FROM parnew_gc
ORDER BY gc_time;
