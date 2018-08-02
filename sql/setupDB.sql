create table if not exists exchanges
(
	id serial not null
		constraint exchanges_pkey
			primary key,
	title varchar not null,
	create_date timestamp not null
)
;

create unique index if not exists exchanges_title_uindex
	on exchanges (title)
;

create table if not exists currencies
(
	id serial not null
		constraint currencies_pkey
			primary key,
	code varchar not null,
	title varchar not null,
	create_date timestamp not null,
	native_id integer not null
)
;

create unique index if not exists currencies_code_uindex
	on currencies (code)
;


CREATE OR REPLACE FUNCTION create_week_partitions_for_rate( DATE, DATE )
returns void AS $$
DECLARE
create_query text;
BEGIN
    FOR create_query IN SELECT

        'CREATE TABLE rates_y' || TO_CHAR( d, 'YYYY_WW' ) || ' PARTITION OF rates FOR VALUES FROM (''' || d || ''') TO ( ''' || d + INTERVAL '6 day' || ''');'
        'CREATE INDEX ON rates_y' || TO_CHAR( d, 'YYYY_WW' ) || ' (time_stamp);'
        FROM generate_series( $1, $2, '1 week' ) AS d LOOP
--       raise notice 'Value: %', create_query;
        EXECUTE create_query;

    END LOOP;
END;
$$
language plpgsql;

drop table rates;

create table if not exists rates
(
	exchange_id integer not null,
	target_id integer not null,
	reference_id integer not null,
	time_stamp timestamp not null,
	rate real not null,
	is_calculated boolean not null
) PARTITION BY RANGE (time_stamp)
;

SELECT create_week_partitions_for_rate ('2017/01/02','2020/01/01');



create table if not exists fa_rates_10m
(
	exchange_id integer not null,
	target_id integer not null,
	reference_id integer not null,
	time_stamp timestamp not null,
	avg_rate real not null,
	max_rate real not null,
	min_rate real not null,
	is_calculated boolean not null
) PARTITION BY RANGE (time_stamp)
;


CREATE TABLE fa_rates_10m_y2017m01 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-01-01') TO ('2017-02-01');
CREATE TABLE fa_rates_10m_y2017m02 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-02-01') TO ('2017-03-01');
CREATE TABLE fa_rates_10m_y2017m03 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-03-01') TO ('2017-04-01');
CREATE TABLE fa_rates_10m_y2017m04 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-04-01') TO ('2017-05-01');
CREATE TABLE fa_rates_10m_y2017m05 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-05-01') TO ('2017-06-01');
CREATE TABLE fa_rates_10m_y2017m06 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-06-01') TO ('2017-07-01');
CREATE TABLE fa_rates_10m_y2017m07 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-07-01') TO ('2017-08-01');
CREATE TABLE fa_rates_10m_y2017m08 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-08-01') TO ('2017-09-01');
CREATE TABLE fa_rates_10m_y2017m09 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-09-01') TO ('2017-10-01');
CREATE TABLE fa_rates_10m_y2017m10 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-10-01') TO ('2017-11-01');
CREATE TABLE fa_rates_10m_y2017m11 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-11-01') TO ('2017-12-01');
CREATE TABLE fa_rates_10m_y2017m12 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2017-12-01') TO ('2018-01-01');


CREATE TABLE fa_rates_10m_y2018m01 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-01-01') TO ('2018-02-01');
CREATE TABLE fa_rates_10m_y2018m02 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-02-01') TO ('2018-03-01');
CREATE TABLE fa_rates_10m_y2018m03 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-03-01') TO ('2018-04-01');
CREATE TABLE fa_rates_10m_y2018m04 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-04-01') TO ('2018-05-01');
CREATE TABLE fa_rates_10m_y2018m05 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-05-01') TO ('2018-06-01');
CREATE TABLE fa_rates_10m_y2018m06 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-06-01') TO ('2018-07-01');
CREATE TABLE fa_rates_10m_y2018m07 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-07-01') TO ('2018-08-01');
CREATE TABLE fa_rates_10m_y2018m08 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-08-01') TO ('2018-09-01');
CREATE TABLE fa_rates_10m_y2018m09 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-09-01') TO ('2018-10-01');
CREATE TABLE fa_rates_10m_y2018m10 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-10-01') TO ('2018-11-01');
CREATE TABLE fa_rates_10m_y2018m11 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-11-01') TO ('2018-12-01');
CREATE TABLE fa_rates_10m_y2018m12 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2018-12-01') TO ('2019-01-01');

CREATE TABLE fa_rates_10m_y2019m01 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-01-01') TO ('2019-02-01');
CREATE TABLE fa_rates_10m_y2019m02 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-02-01') TO ('2019-03-01');
CREATE TABLE fa_rates_10m_y2019m03 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-03-01') TO ('2019-04-01');
CREATE TABLE fa_rates_10m_y2019m04 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-04-01') TO ('2019-05-01');
CREATE TABLE fa_rates_10m_y2019m05 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-05-01') TO ('2019-06-01');
CREATE TABLE fa_rates_10m_y2019m06 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-06-01') TO ('2019-07-01');
CREATE TABLE fa_rates_10m_y2019m07 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-07-01') TO ('2019-08-01');
CREATE TABLE fa_rates_10m_y2019m08 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-08-01') TO ('2019-09-01');
CREATE TABLE fa_rates_10m_y2019m09 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-09-01') TO ('2019-10-01');
CREATE TABLE fa_rates_10m_y2019m10 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-10-01') TO ('2019-11-01');
CREATE TABLE fa_rates_10m_y2019m11 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-11-01') TO ('2019-12-01');
CREATE TABLE fa_rates_10m_y2019m12 PARTITION OF fa_rates_10m
    FOR VALUES FROM ('2019-12-01') TO ('2020-01-01');


CREATE INDEX ON fa_rates_10m_y2017m01 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m02 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m03 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m04 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m05 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m06 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m07 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m08 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m09 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m10 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m11 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2017m12 (time_stamp);

CREATE INDEX ON fa_rates_10m_y2018m01 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m02 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m03 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m04 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m05 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m06 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m07 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m08 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m09 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m10 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m11 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2018m12 (time_stamp);

CREATE INDEX ON fa_rates_10m_y2019m01 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m02 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m03 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m04 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m05 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m06 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m07 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m08 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m09 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m10 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m11 (time_stamp);
CREATE INDEX ON fa_rates_10m_y2019m12 (time_stamp);


create table if not exists fa_rates_30m
(
	exchange_id integer not null,
	target_id integer not null,
	reference_id integer not null,
	time_stamp timestamp not null,
	avg_rate real not null,
	max_rate real not null,
	min_rate real not null,
	is_calculated boolean not null
) PARTITION BY RANGE (time_stamp)
;


CREATE TABLE fa_rates_30m_y2017m01 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-01-01') TO ('2017-02-01');
CREATE TABLE fa_rates_30m_y2017m02 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-02-01') TO ('2017-03-01');
CREATE TABLE fa_rates_30m_y2017m03 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-03-01') TO ('2017-04-01');
CREATE TABLE fa_rates_30m_y2017m04 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-04-01') TO ('2017-05-01');
CREATE TABLE fa_rates_30m_y2017m05 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-05-01') TO ('2017-06-01');
CREATE TABLE fa_rates_30m_y2017m06 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-06-01') TO ('2017-07-01');
CREATE TABLE fa_rates_30m_y2017m07 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-07-01') TO ('2017-08-01');
CREATE TABLE fa_rates_30m_y2017m08 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-08-01') TO ('2017-09-01');
CREATE TABLE fa_rates_30m_y2017m09 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-09-01') TO ('2017-10-01');
CREATE TABLE fa_rates_30m_y2017m10 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-10-01') TO ('2017-11-01');
CREATE TABLE fa_rates_30m_y2017m11 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-11-01') TO ('2017-12-01');
CREATE TABLE fa_rates_30m_y2017m12 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2017-12-01') TO ('2018-01-01');


CREATE TABLE fa_rates_30m_y2018m01 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-01-01') TO ('2018-02-01');
CREATE TABLE fa_rates_30m_y2018m02 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-02-01') TO ('2018-03-01');
CREATE TABLE fa_rates_30m_y2018m03 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-03-01') TO ('2018-04-01');
CREATE TABLE fa_rates_30m_y2018m04 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-04-01') TO ('2018-05-01');
CREATE TABLE fa_rates_30m_y2018m05 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-05-01') TO ('2018-06-01');
CREATE TABLE fa_rates_30m_y2018m06 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-06-01') TO ('2018-07-01');
CREATE TABLE fa_rates_30m_y2018m07 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-07-01') TO ('2018-08-01');
CREATE TABLE fa_rates_30m_y2018m08 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-08-01') TO ('2018-09-01');
CREATE TABLE fa_rates_30m_y2018m09 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-09-01') TO ('2018-10-01');
CREATE TABLE fa_rates_30m_y2018m10 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-10-01') TO ('2018-11-01');
CREATE TABLE fa_rates_30m_y2018m11 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-11-01') TO ('2018-12-01');
CREATE TABLE fa_rates_30m_y2018m12 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2018-12-01') TO ('2019-01-01');

CREATE TABLE fa_rates_30m_y2019m01 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-01-01') TO ('2019-02-01');
CREATE TABLE fa_rates_30m_y2019m02 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-02-01') TO ('2019-03-01');
CREATE TABLE fa_rates_30m_y2019m03 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-03-01') TO ('2019-04-01');
CREATE TABLE fa_rates_30m_y2019m04 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-04-01') TO ('2019-05-01');
CREATE TABLE fa_rates_30m_y2019m05 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-05-01') TO ('2019-06-01');
CREATE TABLE fa_rates_30m_y2019m06 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-06-01') TO ('2019-07-01');
CREATE TABLE fa_rates_30m_y2019m07 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-07-01') TO ('2019-08-01');
CREATE TABLE fa_rates_30m_y2019m08 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-08-01') TO ('2019-09-01');
CREATE TABLE fa_rates_30m_y2019m09 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-09-01') TO ('2019-10-01');
CREATE TABLE fa_rates_30m_y2019m10 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-10-01') TO ('2019-11-01');
CREATE TABLE fa_rates_30m_y2019m11 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-11-01') TO ('2019-12-01');
CREATE TABLE fa_rates_30m_y2019m12 PARTITION OF fa_rates_30m
    FOR VALUES FROM ('2019-12-01') TO ('2020-01-01');


CREATE INDEX ON fa_rates_30m_y2017m01 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m02 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m03 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m04 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m05 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m06 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m07 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m08 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m09 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m10 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m11 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2017m12 (time_stamp);

CREATE INDEX ON fa_rates_30m_y2018m01 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m02 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m03 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m04 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m05 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m06 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m07 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m08 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m09 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m10 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m11 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2018m12 (time_stamp);

CREATE INDEX ON fa_rates_30m_y2019m01 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m02 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m03 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m04 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m05 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m06 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m07 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m08 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m09 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m10 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m11 (time_stamp);
CREATE INDEX ON fa_rates_30m_y2019m12 (time_stamp);



create table if not exists fa_rates_1h
(
	exchange_id integer not null,
	target_id integer not null,
	reference_id integer not null,
	time_stamp timestamp not null,
	avg_rate real not null,
	max_rate real not null,
	min_rate real not null,
	is_calculated boolean not null
) PARTITION BY RANGE (time_stamp)
;


CREATE TABLE fa_rates_1h_y2017m01 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-01-01') TO ('2017-02-01');
CREATE TABLE fa_rates_1h_y2017m02 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-02-01') TO ('2017-03-01');
CREATE TABLE fa_rates_1h_y2017m03 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-03-01') TO ('2017-04-01');
CREATE TABLE fa_rates_1h_y2017m04 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-04-01') TO ('2017-05-01');
CREATE TABLE fa_rates_1h_y2017m05 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-05-01') TO ('2017-06-01');
CREATE TABLE fa_rates_1h_y2017m06 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-06-01') TO ('2017-07-01');
CREATE TABLE fa_rates_1h_y2017m07 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-07-01') TO ('2017-08-01');
CREATE TABLE fa_rates_1h_y2017m08 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-08-01') TO ('2017-09-01');
CREATE TABLE fa_rates_1h_y2017m09 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-09-01') TO ('2017-10-01');
CREATE TABLE fa_rates_1h_y2017m10 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-10-01') TO ('2017-11-01');
CREATE TABLE fa_rates_1h_y2017m11 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-11-01') TO ('2017-12-01');
CREATE TABLE fa_rates_1h_y2017m12 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2017-12-01') TO ('2018-01-01');


CREATE TABLE fa_rates_1h_y2018m01 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-01-01') TO ('2018-02-01');
CREATE TABLE fa_rates_1h_y2018m02 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-02-01') TO ('2018-03-01');
CREATE TABLE fa_rates_1h_y2018m03 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-03-01') TO ('2018-04-01');
CREATE TABLE fa_rates_1h_y2018m04 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-04-01') TO ('2018-05-01');
CREATE TABLE fa_rates_1h_y2018m05 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-05-01') TO ('2018-06-01');
CREATE TABLE fa_rates_1h_y2018m06 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-06-01') TO ('2018-07-01');
CREATE TABLE fa_rates_1h_y2018m07 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-07-01') TO ('2018-08-01');
CREATE TABLE fa_rates_1h_y2018m08 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-08-01') TO ('2018-09-01');
CREATE TABLE fa_rates_1h_y2018m09 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-09-01') TO ('2018-10-01');
CREATE TABLE fa_rates_1h_y2018m10 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-10-01') TO ('2018-11-01');
CREATE TABLE fa_rates_1h_y2018m11 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-11-01') TO ('2018-12-01');
CREATE TABLE fa_rates_1h_y2018m12 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2018-12-01') TO ('2019-01-01');

CREATE TABLE fa_rates_1h_y2019m01 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-01-01') TO ('2019-02-01');
CREATE TABLE fa_rates_1h_y2019m02 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-02-01') TO ('2019-03-01');
CREATE TABLE fa_rates_1h_y2019m03 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-03-01') TO ('2019-04-01');
CREATE TABLE fa_rates_1h_y2019m04 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-04-01') TO ('2019-05-01');
CREATE TABLE fa_rates_1h_y2019m05 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-05-01') TO ('2019-06-01');
CREATE TABLE fa_rates_1h_y2019m06 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-06-01') TO ('2019-07-01');
CREATE TABLE fa_rates_1h_y2019m07 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-07-01') TO ('2019-08-01');
CREATE TABLE fa_rates_1h_y2019m08 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-08-01') TO ('2019-09-01');
CREATE TABLE fa_rates_1h_y2019m09 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-09-01') TO ('2019-10-01');
CREATE TABLE fa_rates_1h_y2019m10 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-10-01') TO ('2019-11-01');
CREATE TABLE fa_rates_1h_y2019m11 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-11-01') TO ('2019-12-01');
CREATE TABLE fa_rates_1h_y2019m12 PARTITION OF fa_rates_1h
    FOR VALUES FROM ('2019-12-01') TO ('2020-01-01');


CREATE INDEX ON fa_rates_1h_y2017m01 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m02 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m03 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m04 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m05 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m06 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m07 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m08 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m09 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m10 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m11 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2017m12 (time_stamp);

CREATE INDEX ON fa_rates_1h_y2018m01 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m02 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m03 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m04 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m05 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m06 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m07 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m08 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m09 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m10 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m11 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2018m12 (time_stamp);

CREATE INDEX ON fa_rates_1h_y2019m01 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m02 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m03 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m04 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m05 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m06 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m07 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m08 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m09 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m10 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m11 (time_stamp);
CREATE INDEX ON fa_rates_1h_y2019m12 (time_stamp);


create table if not exists fa_rates_12h
(
    exchange_id integer not null,
    target_id integer not null,
    reference_id integer not null,
    time_stamp timestamp not null,
    avg_rate real not null,
    max_rate real not null,
    min_rate real not null,
    is_calculated boolean not null
)
;


create table if not exists fa_rates_1d
(
    exchange_id integer not null,
    target_id integer not null,
    reference_id integer not null,
    time_stamp timestamp not null,
    avg_rate real not null,
    max_rate real not null,
    min_rate real not null,
    is_calculated boolean not null
)
;

create table if not exists exchanges_pairs
(
	exchange_id integer not null,
	target_id integer not null,
	reference_id integer not null,
	time_stamp timestamp not null,
	is_calculated boolean not null,
	constraint exchanges_pairs_exchange_id_reference_id_target_id_is_calculate
		unique (exchange_id, reference_id, target_id, is_calculated)
);

-- SA Source Abstraction - Raw data
create table if not exists sa_rates
(
	exchange_title varchar not null,
	target_title varchar not null,
	target_code varchar not null,
	target_native_id integer not null,
	reference_title varchar not null,
	reference_code varchar not null,
	reference_native_id integer not null,
	time_stamp timestamp not null,
	rate real not null,
	is_calculated boolean not null
)
;

create view rates_view as
SELECT ex.title AS exchange_title,
    tcr.code AS target_code,
    rcr.code AS reference_code,
    r.time_stamp,
    r.rate,
    r.is_calculated
   FROM rates r,
    currencies tcr,
    currencies rcr,
    exchanges ex
  WHERE ((r.exchange_id = ex.id) AND (r.target_id = tcr.id) AND (r.reference_id = rcr.id));


create or replace function fill_rates() returns void
	language plpgsql
as $$
BEGIN

INSERT INTO exchanges(title, create_date)
SELECT DISTINCT exchange_title, CURRENT_TIMESTAMP
FROM sa_rates
ON CONFLICT DO NOTHING;

INSERT INTO currencies(title, code, create_date, native_id)
SELECT DISTINCT target_title, target_code,  CURRENT_TIMESTAMP , target_native_id
  from sa_rates
UNION
  SELECT DISTINCT reference_title, reference_code,  CURRENT_TIMESTAMP, reference_native_id
  from sa_rates
ON CONFLICT DO NOTHING;

INSERT INTO exchanges_pairs
SELECT DISTINCT on (ex.id, tcr.id, rcr.id, sr.is_calculated) ex.id exchange_id, tcr.id target_id, rcr.id reference_id, time_stamp, sr.is_calculated as is_calculated
FROM sa_rates sr, exchanges ex, currencies tcr,  currencies rcr
WHERE sr.exchange_title = ex.title and sr.target_code = tcr.code and sr.reference_code = rcr.code
 ON CONFLICT DO NOTHING;


INSERT INTO rates
SELECT ex.id exchange_id, tcr.id target_id, rcr.id reference_id, sr.time_stamp, sr.rate, sr.is_calculated as is_calculated
FROM sa_rates sr, exchanges ex, currencies tcr,  currencies rcr
WHERE sr.exchange_title = ex.title and sr.target_code = tcr.code and sr.reference_code = rcr.code;

     TRUNCATE sa_rates;
    END;
$$
;

-- Get exchange info at given point in time for given exchange from one currency to set of others
create or replace function getrates(p_time_stamp timestamp with time zone, p_exchange_title character varying, p_target_code character varying, p_referencies_codes character varying[])
	returns TABLE(o_exchnage_title character varying, o_target_code character varying, o_reference_code character varying, o_time_stamp timestamp without time zone, o_rate real)
	language plpgsql
as $$
BEGIN

      RETURN QUERY SELECT  DISTINCT on (reference_code) exchange_title as o_exchnage_title, target_code as o_target_code, reference_code as o_reference_code, time_stamp as o_time_stamp, rate as o_rate
FROM rates_view
WHERE time_stamp <= p_time_stamp -- add some kind of a window (a day?) limiting number of rows matching by time.
	and exchange_title = p_exchange_title
	and target_code = p_target_code
	and reference_code = ANY(p_referencies_codes)
ORDER by reference_code, time_stamp DESC;
    END;
$$
;


create or replace function fa_aggregate_rates() returns void
	language plpgsql
as $$
BEGIN

--as there is no merge func, I do it in 2 steps: update and than insert new rows
UPDATE fa_rates_10m
SET avg_rate = rt.avg_rate, max_rate = rt.max_rate, min_rate = rt.min_rate
FROM (SELECT exchange_id, target_id, reference_id, to_timestamp(floor((extract('epoch' from time_stamp) / 600 )) * 600) as time_stamp,  AVG(rate) avg_rate, MAX(rate) max_rate, min(rate) min_rate, is_calculated
FROM rates
where (time_stamp >= (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_10m)) or (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_10m) ISNULL
GROUP by exchange_id, target_id, reference_id, is_calculated, to_timestamp(floor((extract('epoch' from time_stamp) / 600 )) * 600)) rt
WHERE fa_rates_10m.exchange_id = rt.exchange_id and fa_rates_10m.target_id = rt.target_id and fa_rates_10m.reference_id = rt.reference_id and fa_rates_10m.time_stamp = rt.time_stamp and fa_rates_10m.is_calculated = rt.is_calculated;

INSERT INTO fa_rates_10m
SELECT rt.exchange_id, rt.target_id, rt.reference_id, rt.time_stamp, rt.avg_rate, rt.max_rate, rt.min_rate, rt.is_calculated
FROM (SELECT exchange_id, target_id, reference_id, to_timestamp(floor((extract('epoch' from time_stamp) / 600 )) * 600) as time_stamp,  AVG(rate) avg_rate, MAX(rate) max_rate, min(rate) min_rate, is_calculated
FROM rates
where (time_stamp >= (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_10m)) or (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_10m) ISNULL
GROUP by exchange_id, target_id, reference_id, is_calculated, to_timestamp(floor((extract('epoch' from time_stamp) / 600 )) * 600)) rt
LEFT OUTER JOIN fa_rates_10m ON (fa_rates_10m.exchange_id = rt.exchange_id and fa_rates_10m.target_id = rt.target_id and fa_rates_10m.reference_id = rt.reference_id and fa_rates_10m.time_stamp = rt.time_stamp and fa_rates_10m.is_calculated = rt.is_calculated)
where fa_rates_10m.exchange_id IS NULL
;

UPDATE fa_rates_30m
SET avg_rate = rt.avg_rate, max_rate = rt.max_rate, min_rate = rt.min_rate
FROM (SELECT exchange_id, target_id, reference_id, to_timestamp(floor((extract('epoch' from time_stamp) / 1800 )) * 1800) as time_stamp,  AVG(avg_rate) avg_rate, MAX(max_rate) max_rate, min(min_rate) min_rate, is_calculated
FROM fa_rates_10m
where (time_stamp >= (SELECT max(time_stamp) - INTERVAL '30 min' max_time_stamp
FROM fa_rates_30m)) or (SELECT max(time_stamp) - INTERVAL '30 min' max_time_stamp
FROM fa_rates_30m) ISNULL
GROUP by exchange_id, target_id, reference_id, is_calculated, to_timestamp(floor((extract('epoch' from time_stamp) / 1800 )) * 1800)) rt
WHERE fa_rates_30m.exchange_id = rt.exchange_id and fa_rates_30m.target_id = rt.target_id and fa_rates_30m.reference_id = rt.reference_id and fa_rates_30m.time_stamp = rt.time_stamp and fa_rates_30m.is_calculated = rt.is_calculated;

INSERT INTO fa_rates_30m
SELECT rt.exchange_id, rt.target_id, rt.reference_id, rt.time_stamp, rt.avg_rate, rt.max_rate, rt.min_rate, rt.is_calculated
FROM (SELECT exchange_id, target_id, reference_id, to_timestamp(floor((extract('epoch' from time_stamp) / 1800 )) * 1800) as time_stamp,  AVG(avg_rate) avg_rate, MAX(max_rate) max_rate, min(min_rate) min_rate, is_calculated
FROM fa_rates_10m
where (time_stamp >= (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_30m)) or (SELECT max(time_stamp) - INTERVAL '10 min' max_time_stamp
FROM fa_rates_30m) ISNULL
GROUP by exchange_id, target_id, reference_id, is_calculated, to_timestamp(floor((extract('epoch' from time_stamp) / 1800 )) * 1800)) rt
LEFT OUTER JOIN fa_rates_30m ON (fa_rates_30m.exchange_id = rt.exchange_id and fa_rates_30m.target_id = rt.target_id and fa_rates_30m.reference_id = rt.reference_id and fa_rates_30m.time_stamp = rt.time_stamp and fa_rates_30m.is_calculated = rt.is_calculated)
where fa_rates_30m.exchange_id IS NULL
;

truncate table fa_rates_1h;

INSERT INTO fa_rates_1h
SELECT exchange_id, target_id, reference_id,  date_trunc('hour', time_stamp) as time_stamp,  AVG(avg_rate) avg_rate, MAX(max_rate) max_rate, min(min_rate) min_rate, is_calculated
FROM fa_rates_30m
GROUP by exchange_id, target_id, reference_id, is_calculated, date_trunc('hour', time_stamp);

truncate table fa_rates_12h;

INSERT INTO fa_rates_12h
SELECT exchange_id, target_id, reference_id,  to_timestamp(floor((extract('epoch' from time_stamp) / 43200 )) * 43200) as time_stamp,  AVG(avg_rate) avg_rate, MAX(max_rate) max_rate, min(min_rate) min_rate, is_calculated
FROM fa_rates_1h
GROUP by exchange_id, target_id, reference_id, is_calculated, to_timestamp(floor((extract('epoch' from time_stamp) / 43200 )) * 43200);

truncate table fa_rates_1d;

INSERT INTO fa_rates_1d
SELECT exchange_id, target_id, reference_id,  date_trunc('day', time_stamp) as time_stamp,  AVG(avg_rate) avg_rate, MAX(max_rate) max_rate, min(min_rate) min_rate, is_calculated
FROM fa_rates_12h
GROUP by exchange_id, target_id, reference_id, is_calculated, date_trunc('day', time_stamp);

    END;
$$
;