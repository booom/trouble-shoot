CREATE TABLE "parnew_gc" (
"gc_time" timestamp(0),
"gc_timestamp" float8,
"newgen_before_gc" int4,
"newgen_after_gc" int4,
"newgen" int4,
"ms_elapsed" float8,
"heap_before_gc" int4,
"heap_after_gc" int4,
"heap" int4
)
WITH (OIDS=FALSE)
;
