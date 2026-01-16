pg_dump: warning: there are circular foreign-key constraints on this table:
pg_dump: detail: hypertable
pg_dump: hint: You might not be able to restore the dump without using --disable-triggers or temporarily dropping the constraints.
pg_dump: hint: Consider using a full dump instead of a --data-only dump to avoid this problem.
pg_dump: warning: there are circular foreign-key constraints on this table:
pg_dump: detail: chunk
pg_dump: hint: You might not be able to restore the dump without using --disable-triggers or temporarily dropping the constraints.
pg_dump: hint: Consider using a full dump instead of a --data-only dump to avoid this problem.
pg_dump: warning: there are circular foreign-key constraints on this table:
pg_dump: detail: continuous_agg
pg_dump: hint: You might not be able to restore the dump without using --disable-triggers or temporarily dropping the constraints.
pg_dump: hint: Consider using a full dump instead of a --data-only dump to avoid this problem.
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Ubuntu 17.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.5 (Ubuntu 17.5-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data (Community Edition)';


--
-- Name: timescaledb_toolkit; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb_toolkit WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb_toolkit; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb_toolkit IS 'Library of analytical hyperfunctions, time-series pipelining, and other SQL utilities';


--
-- Name: event_type_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.event_type_enum AS ENUM (
    'beacon',
    'step',
    'hr',
    'temp'
);


ALTER TYPE public.event_type_enum OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: data_heartrate; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_heartrate (
    inserted_time timestamp without time zone NOT NULL,
    sensor_type character varying(10),
    sender character varying(255) NOT NULL,
    value integer,
    beacon_info jsonb,
    event_state character varying(50)
);


ALTER TABLE public.data_heartrate OWNER TO root;

--
-- Name: _hyper_3_35_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_3_35_chunk (
    CONSTRAINT constraint_35 CHECK (((inserted_time >= '2025-11-13 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-11-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_heartrate);


ALTER TABLE _timescaledb_internal._hyper_3_35_chunk OWNER TO root;

--
-- Name: data_beacon; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_beacon (
    inserted_time timestamp without time zone NOT NULL,
    sensor_type character varying(30),
    sender character varying(255) NOT NULL,
    value text,
    beacon_info jsonb,
    event_state character varying(50)
);


ALTER TABLE public.data_beacon OWNER TO root;

--
-- Name: _hyper_4_36_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_4_36_chunk (
    CONSTRAINT constraint_36 CHECK (((inserted_time >= '2025-11-13 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-11-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_beacon);


ALTER TABLE _timescaledb_internal._hyper_4_36_chunk OWNER TO root;

--
-- Name: data_step; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_step (
    inserted_time timestamp without time zone NOT NULL,
    sensor_type character varying(10),
    sender character varying(255) NOT NULL,
    value integer NOT NULL,
    beacon_info jsonb
);


ALTER TABLE public.data_step OWNER TO root;

--
-- Name: _hyper_5_17_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_17_chunk (
    CONSTRAINT constraint_17 CHECK (((inserted_time >= '2025-08-21 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-08-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_17_chunk OWNER TO root;

--
-- Name: _hyper_5_20_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_20_chunk (
    CONSTRAINT constraint_20 CHECK (((inserted_time >= '2025-08-28 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-09-04 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_20_chunk OWNER TO root;

--
-- Name: _hyper_5_24_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_24_chunk (
    CONSTRAINT constraint_24 CHECK (((inserted_time >= '2025-09-04 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-09-11 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_24_chunk OWNER TO root;

--
-- Name: _hyper_5_26_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_26_chunk (
    CONSTRAINT constraint_26 CHECK (((inserted_time >= '2025-03-27 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-04-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_26_chunk OWNER TO root;

--
-- Name: _hyper_5_38_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_38_chunk (
    CONSTRAINT constraint_38 CHECK (((inserted_time >= '2025-11-13 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-11-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_38_chunk OWNER TO root;

--
-- Name: _hyper_5_4_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_4_chunk (
    CONSTRAINT constraint_4 CHECK (((inserted_time >= '2025-06-19 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-06-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_4_chunk OWNER TO root;

--
-- Name: _hyper_5_6_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_5_6_chunk (
    CONSTRAINT constraint_6 CHECK (((inserted_time >= '2025-06-26 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-07-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_step);


ALTER TABLE _timescaledb_internal._hyper_5_6_chunk OWNER TO root;

--
-- Name: data_spo2; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_spo2 (
    inserted_time timestamp without time zone NOT NULL,
    sensor_type character varying(30),
    sender character varying(255) NOT NULL,
    value integer NOT NULL,
    beacon_info jsonb,
    event_state character varying(50)
);


ALTER TABLE public.data_spo2 OWNER TO root;

--
-- Name: _hyper_6_12_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_6_12_chunk (
    CONSTRAINT constraint_12 CHECK (((inserted_time >= '2025-03-20 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-03-27 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_spo2);


ALTER TABLE _timescaledb_internal._hyper_6_12_chunk OWNER TO root;

--
-- Name: _hyper_6_18_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_6_18_chunk (
    CONSTRAINT constraint_18 CHECK (((inserted_time >= '2025-08-21 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-08-28 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_spo2);


ALTER TABLE _timescaledb_internal._hyper_6_18_chunk OWNER TO root;

--
-- Name: _hyper_6_37_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_6_37_chunk (
    CONSTRAINT constraint_37 CHECK (((inserted_time >= '2025-11-13 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-11-20 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_spo2);


ALTER TABLE _timescaledb_internal._hyper_6_37_chunk OWNER TO root;

--
-- Name: _hyper_6_5_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_6_5_chunk (
    CONSTRAINT constraint_5 CHECK (((inserted_time >= '2025-06-19 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-06-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_spo2);


ALTER TABLE _timescaledb_internal._hyper_6_5_chunk OWNER TO root;

--
-- Name: _hyper_6_9_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: root
--

CREATE TABLE _timescaledb_internal._hyper_6_9_chunk (
    CONSTRAINT constraint_9 CHECK (((inserted_time >= '2025-06-26 00:00:00'::timestamp without time zone) AND (inserted_time < '2025-07-03 00:00:00'::timestamp without time zone)))
)
INHERITS (public.data_spo2);


ALTER TABLE _timescaledb_internal._hyper_6_9_chunk OWNER TO root;

--
-- Name: ai_hr_events; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ai_hr_events (
    id bigint NOT NULL,
    worker_id text,
    ts timestamp without time zone NOT NULL,
    hr integer NOT NULL,
    level text,
    reasons jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_hr_events OWNER TO root;

--
-- Name: ai_hr_events_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ai_hr_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_hr_events_id_seq OWNER TO root;

--
-- Name: ai_hr_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ai_hr_events_id_seq OWNED BY public.ai_hr_events.id;


--
-- Name: data_temp; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_temp (
    inserted_time timestamp without time zone NOT NULL,
    sensor_type character varying(10),
    sender character varying(255) NOT NULL,
    value double precision NOT NULL,
    beacon_info jsonb,
    event_state character varying(50)
);


ALTER TABLE public.data_temp OWNER TO root;

--
-- Name: dept_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dept_info (
    id integer NOT NULL,
    dept_name character varying(50) NOT NULL
);


ALTER TABLE public.dept_info OWNER TO root;

--
-- Name: dept_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dept_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dept_info_id_seq OWNER TO root;

--
-- Name: dept_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.dept_info_id_seq OWNED BY public.dept_info.id;


--
-- Name: device_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.device_info (
    id integer NOT NULL,
    dev_id character varying(100) NOT NULL,
    dev_type character varying(64),
    status character varying(64),
    meta_data jsonb,
    created_time timestamp without time zone DEFAULT now(),
    updated_time timestamp without time zone DEFAULT now(),
    is_use boolean DEFAULT true NOT NULL
);


ALTER TABLE public.device_info OWNER TO root;

--
-- Name: device_info_id_seq1; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.device_info_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_info_id_seq1 OWNER TO root;

--
-- Name: device_info_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.device_info_id_seq1 OWNED BY public.device_info.id;


--
-- Name: event_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.event_history (
    event_id character varying(36) NOT NULL,
    inserted_time timestamp without time zone NOT NULL,
    ref_region character varying(50),
    ref_device character varying(50),
    people integer DEFAULT 1,
    event_state character varying(50),
    state character varying(50),
    message text,
    ref_device_name character varying(50),
    accuracy real,
    sender character varying(50)
);


ALTER TABLE public.event_history OWNER TO root;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO root;

--
-- Name: rank_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.rank_info (
    id integer NOT NULL,
    rank_name character varying(50) NOT NULL
);


ALTER TABLE public.rank_info OWNER TO root;

--
-- Name: rank_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.rank_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rank_info_id_seq OWNER TO root;

--
-- Name: rank_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.rank_info_id_seq OWNED BY public.rank_info.id;


--
-- Name: rule_event_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.rule_event_info (
    event_id integer NOT NULL,
    event_value character varying(100),
    event_type public.event_type_enum,
    event_name character varying(100),
    inserted_time timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.rule_event_info OWNER TO root;

--
-- Name: rule_event_info_event_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.rule_event_info_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rule_event_info_event_id_seq OWNER TO root;

--
-- Name: rule_event_info_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.rule_event_info_event_id_seq OWNED BY public.rule_event_info.event_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_info (
    id integer NOT NULL,
    device_id text,
    user_type character varying(6) NOT NULL,
    user_name character varying(50),
    user_id text,
    user_pw text,
    dept_id integer,
    rank_id integer
);


ALTER TABLE public.user_info OWNER TO root;

--
-- Name: user_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_info_id_seq OWNER TO root;

--
-- Name: user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_info_id_seq OWNED BY public.user_info.id;


--
-- Name: worker_baseline; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.worker_baseline (
    worker_id text NOT NULL,
    mu real,
    sigma real,
    p05 real,
    p95 real,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.worker_baseline OWNER TO root;

--
-- Name: zone_device; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.zone_device (
    id integer NOT NULL,
    zone_id integer,
    dev_id character varying(100) NOT NULL,
    position_metadata jsonb,
    created_time timestamp without time zone DEFAULT now(),
    updated_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.zone_device OWNER TO root;

--
-- Name: zone_device_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.zone_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zone_device_id_seq OWNER TO root;

--
-- Name: zone_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.zone_device_id_seq OWNED BY public.zone_device.id;


--
-- Name: zone_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.zone_info (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.zone_info OWNER TO root;

--
-- Name: zone_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.zone_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zone_info_id_seq OWNER TO root;

--
-- Name: zone_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.zone_info_id_seq OWNED BY public.zone_info.id;


--
-- Name: ai_hr_events id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ai_hr_events ALTER COLUMN id SET DEFAULT nextval('public.ai_hr_events_id_seq'::regclass);


--
-- Name: dept_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dept_info ALTER COLUMN id SET DEFAULT nextval('public.dept_info_id_seq'::regclass);


--
-- Name: device_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.device_info ALTER COLUMN id SET DEFAULT nextval('public.device_info_id_seq1'::regclass);


--
-- Name: rank_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rank_info ALTER COLUMN id SET DEFAULT nextval('public.rank_info_id_seq'::regclass);


--
-- Name: rule_event_info event_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rule_event_info ALTER COLUMN event_id SET DEFAULT nextval('public.rule_event_info_event_id_seq'::regclass);


--
-- Name: user_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_info ALTER COLUMN id SET DEFAULT nextval('public.user_info_id_seq'::regclass);


--
-- Name: zone_device id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zone_device ALTER COLUMN id SET DEFAULT nextval('public.zone_device_id_seq'::regclass);


--
-- Name: zone_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zone_info ALTER COLUMN id SET DEFAULT nextval('public.zone_info_id_seq'::regclass);


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, status) FROM stdin;
3	public	data_heartrate	_timescaledb_internal	_hyper_3	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
4	public	data_beacon	_timescaledb_internal	_hyper_4	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
5	public	data_step	_timescaledb_internal	_hyper_5	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
6	public	data_spo2	_timescaledb_internal	_hyper_6	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped, status, osm_chunk, creation_time) FROM stdin;
4	5	_timescaledb_internal	_hyper_5_4_chunk	\N	f	0	f	2025-06-23 05:25:53.848047+00
5	6	_timescaledb_internal	_hyper_6_5_chunk	\N	f	0	f	2025-06-24 06:56:40.877266+00
6	5	_timescaledb_internal	_hyper_5_6_chunk	\N	f	0	f	2025-06-27 04:12:40.697698+00
9	6	_timescaledb_internal	_hyper_6_9_chunk	\N	f	0	f	2025-06-27 04:14:52.573702+00
12	6	_timescaledb_internal	_hyper_6_12_chunk	\N	f	0	f	2025-08-20 00:59:09.582778+00
17	5	_timescaledb_internal	_hyper_5_17_chunk	\N	f	0	f	2025-08-25 08:02:53.088511+00
18	6	_timescaledb_internal	_hyper_6_18_chunk	\N	f	0	f	2025-08-26 05:16:28.224525+00
20	5	_timescaledb_internal	_hyper_5_20_chunk	\N	f	0	f	2025-09-02 05:48:00.966818+00
24	5	_timescaledb_internal	_hyper_5_24_chunk	\N	f	0	f	2025-09-08 05:37:53.138936+00
26	5	_timescaledb_internal	_hyper_5_26_chunk	\N	f	0	f	2025-09-12 03:59:31.999776+00
35	3	_timescaledb_internal	_hyper_3_35_chunk	\N	f	0	f	2025-11-14 02:11:23.480445+00
36	4	_timescaledb_internal	_hyper_4_36_chunk	\N	f	0	f	2025-11-14 02:20:52.377319+00
37	6	_timescaledb_internal	_hyper_6_37_chunk	\N	f	0	f	2025-11-14 03:08:46.402022+00
38	5	_timescaledb_internal	_hyper_5_38_chunk	\N	f	0	f	2025-11-14 05:00:16.761248+00
\.


--
-- Data for Name: chunk_column_stats; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.chunk_column_stats (id, hypertable_id, chunk_id, column_name, range_start, range_end, valid) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, compress_interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
3	3	inserted_time	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
4	4	inserted_time	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
5	5	inserted_time	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
6	6	inserted_time	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
4	5	1750291200000000	1750896000000000
5	6	1750291200000000	1750896000000000
6	5	1750896000000000	1751500800000000
9	6	1750896000000000	1751500800000000
12	6	1742428800000000	1743033600000000
17	5	1755734400000000	1756339200000000
18	6	1755734400000000	1756339200000000
20	5	1756339200000000	1756944000000000
24	5	1756944000000000	1757548800000000
26	5	1743033600000000	1743638400000000
35	3	1762992000000000	1763596800000000
36	4	1762992000000000	1763596800000000
37	6	1762992000000000	1763596800000000
38	5	1762992000000000	1763596800000000
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
4	4	constraint_4	\N
4	\N	4_3_data_step_pkey	data_step_pkey
5	5	constraint_5	\N
5	\N	5_4_data_spo2_pkey	data_spo2_pkey
6	6	constraint_6	\N
6	\N	6_5_data_step_pkey	data_step_pkey
9	9	constraint_9	\N
9	\N	9_8_data_spo2_pkey	data_spo2_pkey
12	12	constraint_12	\N
12	\N	12_11_data_spo2_pkey	data_spo2_pkey
17	17	constraint_17	\N
17	\N	17_16_data_step_pkey	data_step_pkey
18	18	constraint_18	\N
18	\N	18_17_data_spo2_pkey	data_spo2_pkey
20	20	constraint_20	\N
20	\N	20_19_data_step_pkey	data_step_pkey
24	24	constraint_24	\N
24	\N	24_23_data_step_pkey	data_step_pkey
26	26	constraint_26	\N
26	\N	26_24_data_step_pkey	data_step_pkey
35	35	constraint_35	\N
35	\N	35_34_data_heartrate_pkey	data_heartrate_pkey
36	36	constraint_36	\N
36	\N	36_35_data_beacon_pkey	data_beacon_pkey
37	37	constraint_37	\N
37	\N	37_36_data_spo2_pkey	data_spo2_pkey
38	38	constraint_38	\N
38	\N	38_37_data_step_pkey	data_step_pkey
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
36	36_35_data_beacon_pkey	4	data_beacon_pkey
36	_hyper_4_36_chunk_data_beacon_inserted_time_idx	4	data_beacon_inserted_time_idx
36	_hyper_4_36_chunk_data_beacon_sender_inserted_time_idx	4	data_beacon_sender_inserted_time_idx
4	4_3_data_step_pkey	5	data_step_pkey
4	_hyper_5_4_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
4	_hyper_5_4_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
5	5_4_data_spo2_pkey	6	data_spo2_pkey
5	_hyper_6_5_chunk_data_spo2_inserted_time_idx	6	data_spo2_inserted_time_idx
5	_hyper_6_5_chunk_data_spo2_sender_inserted_time_idx	6	data_spo2_sender_inserted_time_idx
6	6_5_data_step_pkey	5	data_step_pkey
6	_hyper_5_6_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
6	_hyper_5_6_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
9	9_8_data_spo2_pkey	6	data_spo2_pkey
9	_hyper_6_9_chunk_data_spo2_inserted_time_idx	6	data_spo2_inserted_time_idx
9	_hyper_6_9_chunk_data_spo2_sender_inserted_time_idx	6	data_spo2_sender_inserted_time_idx
12	12_11_data_spo2_pkey	6	data_spo2_pkey
12	_hyper_6_12_chunk_data_spo2_inserted_time_idx	6	data_spo2_inserted_time_idx
12	_hyper_6_12_chunk_data_spo2_sender_inserted_time_idx	6	data_spo2_sender_inserted_time_idx
17	17_16_data_step_pkey	5	data_step_pkey
17	_hyper_5_17_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
17	_hyper_5_17_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
18	18_17_data_spo2_pkey	6	data_spo2_pkey
18	_hyper_6_18_chunk_data_spo2_inserted_time_idx	6	data_spo2_inserted_time_idx
18	_hyper_6_18_chunk_data_spo2_sender_inserted_time_idx	6	data_spo2_sender_inserted_time_idx
37	37_36_data_spo2_pkey	6	data_spo2_pkey
37	_hyper_6_37_chunk_data_spo2_inserted_time_idx	6	data_spo2_inserted_time_idx
37	_hyper_6_37_chunk_data_spo2_sender_inserted_time_idx	6	data_spo2_sender_inserted_time_idx
20	20_19_data_step_pkey	5	data_step_pkey
20	_hyper_5_20_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
20	_hyper_5_20_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
24	24_23_data_step_pkey	5	data_step_pkey
24	_hyper_5_24_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
24	_hyper_5_24_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
26	26_24_data_step_pkey	5	data_step_pkey
26	_hyper_5_26_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
26	_hyper_5_26_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
38	38_37_data_step_pkey	5	data_step_pkey
38	_hyper_5_38_chunk_data_step_inserted_time_idx	5	data_step_inserted_time_idx
38	_hyper_5_38_chunk_data_step_sender_inserted_time_idx	5	data_step_sender_inserted_time_idx
35	35_34_data_heartrate_pkey	3	data_heartrate_pkey
35	_hyper_3_35_chunk_data_heartrate_inserted_time_idx	3	data_heartrate_inserted_time_idx
35	_hyper_3_35_chunk_data_heartrate_sender_inserted_time_idx	3	data_heartrate_sender_inserted_time_idx
35	_hyper_3_35_chunk_idx_heartrate_sender_time	3	idx_heartrate_sender_time
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression, numrows_frozen_immediately) FROM stdin;
\.


--
-- Data for Name: compression_settings; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.compression_settings (relid, compress_relid, segmentby, orderby, orderby_desc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, parent_mat_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, direct_view_schema, direct_view_name, materialized_only, finalized) FROM stdin;
\.


--
-- Data for Name: continuous_agg_migrate_plan; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan (mat_hypertable_id, start_ts, end_ts, user_view_definition) FROM stdin;
\.


--
-- Data for Name: continuous_agg_migrate_plan_step; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan_step (mat_hypertable_id, step_id, status, start_ts, end_ts, type, config) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_bucket_function; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_aggs_bucket_function (mat_hypertable_id, bucket_func, bucket_width, bucket_origin, bucket_offset, bucket_timezone, bucket_fixed_width) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_watermark; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.continuous_aggs_watermark (mat_hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
install_timestamp	2025-05-22 06:32:21.90259+00	t
timescaledb_version	2.20.0	f
exported_uuid	38596378-26dd-41ca-88e2-56ae24cc3355	t
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: root
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: root
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, fixed_schedule, initial_start, hypertable_id, config, check_schema, check_name, timezone) FROM stdin;
\.


--
-- Data for Name: _hyper_3_35_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_3_35_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
2025-11-14 11:31:14.439	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:08:40.155	watch_hr	1111	75	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:08:53.162	watch_hr	1111	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:03.17	watch_hr	1111	68	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:09.187	watch_hr	1111	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:15.203	watch_hr	1111	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:21.214	watch_hr	1111	63	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:26.225	watch_hr	1111	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:32.236	watch_hr	1111	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:37.249	watch_hr	1111	68	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:43.263	watch_hr	1111	70	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:48.276	watch_hr	1111	68	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:53.286	watch_hr	1111	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:09:59.3	watch_hr	1111	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:05.313	watch_hr	1111	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:10.314	watch_hr	1111	64	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:15.322	watch_hr	1111	61	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:20.325	watch_hr	1111	61	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:25.333	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:34.344	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:43.348	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:50.354	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:10:55.359	watch_hr	1111	63	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:11:02.368	watch_hr	1111	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:11:07.371	watch_hr	1111	68	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:11:13.38	watch_hr	1111	69	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:13:47.441	watch_hr	1111	71	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:13:59.444	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:09.441	watch_hr	1111	63	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:17.436	watch_hr	1111	63	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:23.435	watch_hr	1111	63	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:31.427	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:26.696	watch_hr	1111	68	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:01:31.711	watch_hr	1111	63	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:36.72	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:01:41.734	watch_hr	1111	57	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:49.758	watch_hr	1111	56	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:54.77	watch_hr	1111	53	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:02:04.787	watch_hr	1111	53	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:02:09.798	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:14.81	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:19.819	watch_hr	1111	56	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:24.828	watch_hr	1111	55	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:29.836	watch_hr	1111	54	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:49.867	watch_hr	1111	60	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:44.858	watch_hr	1111	64	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:39.85	watch_hr	1111	63	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:34.845	watch_hr	1111	54	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:54.879	watch_hr	1111	55	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:59.889	watch_hr	1111	55	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:05.899	watch_hr	1111	56	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:12.899	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:18.899	watch_hr	1111	56	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:03:23.905	watch_hr	1111	55	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:42.92	watch_hr	1111	57	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:34.915	watch_hr	1111	56	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:03:50.933	watch_hr	1111	58	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:55.942	watch_hr	1111	55	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:04:08.958	watch_hr	1111	53	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:04:20.973	watch_hr	1111	56	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:04:14.968	watch_hr	1111	54	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:37.435	watch_hr	1111	60	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:11.437	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:23.424	watch_hr	1111	70	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:55.412	watch_hr	1111	78	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:13.409	watch_hr	1111	73	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:20.392	watch_hr	1111	75	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:50.438	watch_hr	1111	62	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:57.435	watch_hr	1111	62	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:04.431	watch_hr	1111	64	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:18.42	watch_hr	1111	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:28.428	watch_hr	1111	83	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:34.418	watch_hr	1111	85	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:02.407	watch_hr	1111	76	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:08.408	watch_hr	1111	71	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:26.387	watch_hr	1111	70	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:32.382	watch_hr	1111	70	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:40.387	watch_hr	1111	71	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:19:08.362	watch_hr	1111	61	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:12.424	watch_hr	1111	62	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:17.425	watch_hr	1111	64	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:22.434	watch_hr	1111	68	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:28.446	watch_hr	1111	71	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:34.428	watch_hr	1111	80	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:08:50.875	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:12:03.07	watch_hr	1112	83	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:12:08.086	watch_hr	1112	82	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:16:00.599	watch_hr	1112	80	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:16:12.638	watch_hr	1112	81	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:16:17.655	watch_hr	1112	84	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:46:12.569	watch_hr	1112	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:46:18.588	watch_hr	1112	65	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:46:25.614	watch_hr	1112	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:23.13	watch_hr	1112	68	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:48:29.156	watch_hr	1112	70	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:35.18	watch_hr	1112	68	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:40.2	watch_hr	1112	67	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:51.234	watch_hr	1112	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:56.253	watch_hr	1112	68	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:01.272	watch_hr	1112	70	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:49:06.292	watch_hr	1112	66	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:49:14.324	watch_hr	1112	64	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:51:21.825	watch_hr	1112	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:51:26.845	watch_hr	1112	66	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:32.879	watch_hr	1112	69	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:37.883	watch_hr	1112	78	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:42.903	watch_hr	1112	80	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:47.915	watch_hr	1112	81	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:52.933	watch_hr	1112	84	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:58.073	watch_hr	1112	86	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:10.073	watch_hr	1112	78	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:04.073	watch_hr	1112	83	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:16.073	watch_hr	1112	78	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:25.073	watch_hr	1112	80	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:30.081	watch_hr	1112	78	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:35.102	watch_hr	1112	72	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:58:43.946	watch_hr	1112	65	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:58:50.973	watch_hr	1112	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:58:55.991	watch_hr	1112	62	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:02.015	watch_hr	1112	62	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:07.036	watch_hr	1112	62	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:12.058	watch_hr	1112	63	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:17.08	watch_hr	1112	63	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:22.102	watch_hr	1112	63	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:27.125	watch_hr	1112	68	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:33.156	watch_hr	1112	67	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:22.511	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:28.511	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:36.511	watch_hr	1112	86	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:45.511	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:52.511	watch_hr	1112	86	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:58.511	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:06.628	watch_hr	1112	90	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:14.628	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:20.628	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:26.628	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:32.628	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:37.636	watch_hr	1112	67	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:08:23.924	watch_hr	1111	119	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:08:30.93	watch_hr	1111	117	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:08:35.942	watch_hr	1111	111	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:08:41.957	watch_hr	1111	108	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:08:47.967	watch_hr	1111	104	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:08:54.982	watch_hr	1111	99	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:08:59.992	watch_hr	1111	98	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:05.002	watch_hr	1111	92	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:10.009	watch_hr	1111	94	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:16.018	watch_hr	1111	90	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:31.039	watch_hr	1111	90	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:09:37.046	watch_hr	1111	89	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:09:42.052	watch_hr	1111	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:09:48.058	watch_hr	1111	88	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:54.063	watch_hr	1111	88	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:59.067	watch_hr	1111	84	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:04.075	watch_hr	1111	84	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:10.073	watch_hr	1111	81	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:15.08	watch_hr	1111	79	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:21.082	watch_hr	1111	78	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:27.08	watch_hr	1111	85	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:10:35.093	watch_hr	1111	86	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:10:50.103	watch_hr	1111	88	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:55.109	watch_hr	1111	92	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:11:01.108	watch_hr	1111	93	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:06.115	watch_hr	1111	94	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:13.119	watch_hr	1111	92	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:14.047	watch_hr	1112	67	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:18.125	watch_hr	1111	87	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:23.133	watch_hr	1111	81	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:22.077	watch_hr	1112	71	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:27.092	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:29.13	watch_hr	1111	80	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:35.128	watch_hr	1111	78	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:32.117	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:42.13	watch_hr	1111	72	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:50.141	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:57.152	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:03.154	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:09.163	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:14.171	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:19.179	watch_hr	1111	71	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:25.181	watch_hr	1111	72	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:31.191	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:37.193	watch_hr	1111	74	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:43.204	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:48.214	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:54.218	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:12:59.226	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:10.215	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:17.217	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:27.218	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:41.22	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:48.216	watch_hr	1111	71	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:39.561	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:48.561	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:11:54.561	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:05.561	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:11.561	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:21.561	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:27.561	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:33.561	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:39.561	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:46.561	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:52.561	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:58.561	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:07.561	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:14.561	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:21.561	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:29.561	watch_hr	1112	86	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:36.561	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:44.561	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:51.578	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:23.213	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:28.215	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:33.217	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:38.22	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:44.221	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:54.236	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:58.826	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:13.826	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:07.826	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:20.826	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:26.826	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:32.826	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:41.826	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:55.826	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:47.826	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:21.158	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:27.162	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:32.167	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:38.172	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:53.108	watch_hr	1111	65	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:01.07	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:03.062	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:18.062	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:11.062	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:25.062	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:53.218	watch_hr	1111	68	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:59.221	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:09.22	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:15.22	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:09.215	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:15.197	watch_hr	1111	65	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:44.167	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:32.062	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:39.062	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:45.062	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:59.062	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:52.062	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:04.067	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:06.079	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:12.08	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:17.087	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:25.093	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:37.102	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:45.106	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:54.111	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:04.12	watch_hr	1111	69	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:11.122	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:18.134	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:27.148	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:32.155	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:39.153	watch_hr	1111	66	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:10.412	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:16.412	watch_hr	1112	90	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:22.412	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:28.412	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:34.412	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:40.412	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:49.412	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:55.412	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:05.412	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:12.412	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:18.412	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:33.412	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:39.412	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:47.163	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:53.163	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:59.17	watch_hr	1111	71	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:05.051	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:18:17.015	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:18:24.966	watch_hr	1111	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:36.925	watch_hr	1111	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:42.925	watch_hr	1111	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:51.898	watch_hr	1111	64	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:18:58.896	watch_hr	1111	63	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:19:03.902	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:19:11.903	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:19:20.881	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:19:26.879	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:19:33.886	watch_hr	1111	66	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:42.893	watch_hr	1111	67	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:47.899	watch_hr	1111	64	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:54.908	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:00.913	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:07.916	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:13.906	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:23.885	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:33.887	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:41.894	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:46.898	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:52.889	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:57.894	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:21:07.899	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:47.267	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:53.267	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:59.267	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:10.267	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:16.267	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:26.267	watch_hr	1112	89	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:34.267	watch_hr	1112	90	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:44.267	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:50.267	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:02.267	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:14.267	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:21.267	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:27.267	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:33.267	watch_hr	1112	73	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:39.267	watch_hr	1112	73	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:45.267	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:51.267	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:10.267	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:02.267	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:18.267	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:34.267	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:28.267	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:42.267	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:48.267	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:59.267	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:12.267	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:05.267	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:19.267	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:33.267	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:40.267	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:47.267	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:53.267	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:21:58.742	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:04.742	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:16.742	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:10.742	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:23.742	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:31.742	watch_hr	1112	86	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:40.742	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:47.742	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:02.742	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:22:55.742	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:08.742	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:22.742	watch_hr	1112	92	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:15.742	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:42.742	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:28.742	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:48.742	watch_hr	1112	92	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:00.742	watch_hr	1112	89	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:54.742	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:13.742	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:07.742	watch_hr	1112	90	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:21.752	watch_hr	1112	90	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:26.786	watch_hr	1112	91	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:31.79	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:36.808	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:32.413	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:25:37.416	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:25:42.426	watch_hr	1111	72	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:25:48.437	watch_hr	1111	75	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:25:53.447	watch_hr	1111	73	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:25:58.457	watch_hr	1111	68	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:26:04.47	watch_hr	1111	66	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:26:10.483	watch_hr	1111	65	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:24:44.099	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:01.099	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:07.099	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:24:55.099	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:13.099	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:20.099	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:33.099	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:39.099	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:27.099	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:59.099	watch_hr	1112	86	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:53.099	watch_hr	1112	88	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:05.099	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:17.499	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:26:20.111	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:38.524	watch_hr	1111	59	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:46.543	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:26:52.559	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:00.579	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:05.594	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:13.616	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:24.645	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:33.662	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:45.674	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:53.686	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:05.698	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:10.703	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:16.71	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:26:25.503	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:31.503	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:40.503	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:47.503	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:08.503	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:02.503	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:14.503	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:21.503	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:27.503	watch_hr	1112	87	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:34.503	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:40.503	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:46.503	watch_hr	1112	73	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:52.503	watch_hr	1112	72	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:27:58.503	watch_hr	1112	73	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:04.503	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:11.503	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:21.715	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:20.511	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:29.728	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:38.743	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:47.772	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:59.772	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:05.772	watch_hr	1111	63	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:53.772	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:11.772	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:41.772	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:26.772	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:17.772	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:04.772	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:49.772	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:10.768	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:15.867	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:22.867	watch_hr	1111	65	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:28.867	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:36.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:50.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:30:56.867	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:04.867	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:32.867	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:18.867	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:38.867	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:56.867	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:44.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:10.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:19.867	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:25.867	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:43.867	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:02.867	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:49.867	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:55.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:33:08.867	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:33:17.872	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:22.879	watch_hr	1111	59	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:29.867	watch_hr	1111	59	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:35.862	watch_hr	1111	62	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:43.868	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:00.895	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:06.898	watch_hr	1111	58	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:16.914	watch_hr	1111	57	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:26.922	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:34:32.931	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:37.938	watch_hr	1111	66	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:44.946	watch_hr	1111	66	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:49.952	watch_hr	1111	63	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:56.952	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:28.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:34.827	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:45.827	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:01.827	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:28:51.827	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:07.827	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:13.827	watch_hr	1112	70	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:20.827	watch_hr	1112	69	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:38.827	watch_hr	1112	72	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:29.827	watch_hr	1112	69	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:44.827	watch_hr	1112	70	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:58.827	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:04.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:29:50.827	watch_hr	1112	72	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:10.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:16.827	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:22.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:28.827	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:34.827	watch_hr	1112	80	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:40.827	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:51.827	watch_hr	1112	85	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:57.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:04.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:10.827	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:17.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:23.827	watch_hr	1112	84	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:31.827	watch_hr	1112	92	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:37.827	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:43.827	watch_hr	1112	70	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:50.827	watch_hr	1112	68	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:02.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:56.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:08.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:23.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:29.827	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:39.827	watch_hr	1112	81	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:17.827	watch_hr	1112	78	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:56.827	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:47.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:15.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:21.827	watch_hr	1112	79	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:07.827	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:34.827	watch_hr	1112	82	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:28.827	watch_hr	1112	83	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:41.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:48.827	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:55.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:03.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:09.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:23.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:55.827	watch_hr	1112	75	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:40.827	watch_hr	1112	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:15.827	watch_hr	1112	77	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:06.949	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:13.95	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:18.954	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:01.891	watch_hr	1112	72	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:09.891	watch_hr	1112	72	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:20.899	watch_hr	1112	73	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:25.917	watch_hr	1112	76	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:28.966	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:33.972	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:40.975	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:51.98	watch_hr	1111	61	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:56.985	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:36:02.994	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:36:10.002	watch_hr	1111	59	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:36:19.015	watch_hr	1111	59	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:36:28.015	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:36:37.015	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:04.015	watch_hr	1111	60	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:10.015	watch_hr	1111	67	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:18.015	watch_hr	1111	74	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:24.015	watch_hr	1111	70	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:36:14.212	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:36:20.224	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:36:34.256	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:36:51.302	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:36:57.314	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:03.328	watch_hr	1111	56	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:09.344	watch_hr	1111	54	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:15.36	watch_hr	1111	55	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:26.328	watch_hr	1111	56	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:38.332	watch_hr	1111	56	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:51.332	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:37:56.342	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:02.339	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:15.288	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:23.268	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:32.226	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:38.224	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:44.218	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:38:55.172	watch_hr	1111	68	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:01.147	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:07.142	watch_hr	1111	54	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:13.116	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:18.203	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:48.203	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:42.203	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:33.203	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:25.203	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:54.203	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:40:08.203	watch_hr	1111	55	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:40:35.203	watch_hr	1111	54	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:40:47.203	watch_hr	1111	55	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:40:55.203	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:03.203	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:12.203	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:18.203	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:24.203	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:31.203	watch_hr	1111	55	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:39.203	watch_hr	1111	57	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:59.203	watch_hr	1111	61	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:52.203	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:41:45.203	watch_hr	1111	56	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:07.203	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:13.203	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:21.203	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:29.203	watch_hr	1111	71	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:35.203	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:41.203	watch_hr	1111	71	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:56.203	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:03.203	watch_hr	1111	71	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:10.203	watch_hr	1111	73	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:42:50.203	watch_hr	1111	74	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:22.203	watch_hr	1111	67	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:16.203	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:36.203	watch_hr	1111	59	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:52.203	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:04.203	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:45.203	watch_hr	1111	58	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:58.203	watch_hr	1111	60	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:43:30.203	watch_hr	1111	62	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:14.203	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:34.203	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:57.203	watch_hr	1111	69	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:41.203	watch_hr	1111	66	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:48.203	watch_hr	1111	70	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:44:20.203	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:45:03.203	watch_hr	1111	64	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
\.


--
-- Data for Name: _hyper_4_36_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_4_36_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
2025-11-14 10:24:13.905	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:24:19.925	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27399", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:24:20.931	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:24:30.95	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:24:38.98	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:25:06.038	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:25:07.031	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:25:49.128	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:25:52.135	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:26:12.189	watch_beacon	1111	{"rssi": -97, "major": "30002", "minor": "27400", "txpower": "216", "distance": 71.53}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:26:21.209	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:26:26.237	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:26:34.265	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:26:44.304	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:26:45.307	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:26:47.318	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:26:57.35	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:27:03.37	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:27:09.396	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:27:10.403	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:27:16.416	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:27:48.5	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:27:58.526	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:28:08.769	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:28:11.554	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:28:16.867	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:28:17.936	watch_beacon	1112	{"rssi": -74, "major": "30002", "minor": "27335", "txpower": "216", "distance": 8.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:28:27.587	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:28:48.62	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:28:58.642	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:29:03.649	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:29:13.687	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:30:08.876	watch_beacon	1112	{"rssi": -69, "major": "30002", "minor": "27335", "txpower": "216", "distance": 5.28}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:30:31.907	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:30:41.933	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:30:47.948	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:30:57.976	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:32:13.09	watch_beacon	1112	{"rssi": -77, "major": "30002", "minor": "27335", "txpower": "216", "distance": 12.15}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:32:22.036	watch_beacon	1112	{"rssi": -76, "major": "30002", "minor": "27335", "txpower": "216", "distance": 11.0}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:32:53.496	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:33:07.533	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:33:11.548	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:34:02.657	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:34:06.671	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:34:12.3	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:34:13.323	watch_beacon	1112	{"rssi": -70, "major": "30002", "minor": "27335", "txpower": "216", "distance": 5.89}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:34:52.117	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:34:53.141	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:30:34.119	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:34:56.82	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:35:08.893	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:35:21.938	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:35:26.967	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:35:36.983	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:36:11.091	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:36:13.107	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:36:57.239	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:37:16.602	watch_beacon	1112	{"rssi": -79, "major": "30002", "minor": "27335", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:37:20.285	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:37:30.301	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:37:42.318	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:38:07.402	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:38:16.428	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:38:37.475	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:38:50.501	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:39:00.515	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:39:17.537	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:39:27.556	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:40:52.672	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:41:02.694	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:42:18.951	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:42:38.513	watch_beacon	1111	{"rssi": -97, "major": "30002", "minor": "27399", "txpower": "216", "distance": 71.53}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:42:47.543	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:42:49.557	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:42:59.586	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:43:02.6	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:43:12.623	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:44:05.953	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:44:15.981	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:44:22.998	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:44:47.05	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:44:56.063	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:45:08.061	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:45:09.067	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:45:19.088	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:45:37.219	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:45:39.234	watch_beacon	1112	{"rssi": -77, "major": "30002", "minor": "27335", "txpower": "216", "distance": 12.15}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:45:43.136	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:45:53.017	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:46:18.062	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:46:54.121	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:47:01.186	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:47:11.205	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:51:35.61	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:51:45.633	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:55:03.06	watch_beacon	1112	{"rssi": -78, "major": "30002", "minor": "27335", "txpower": "216", "distance": 13.41}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 10:57:22.684	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:57:34.728	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:57:45.758	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:57:46.77	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:35:49.116	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:57:49.786	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:58:47.946	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:58:48.96	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:59:05.008	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:59:10.025	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:59:23.058	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:59:37.096	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:59:44.122	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:59:58.166	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:00:25.222	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:00:02.19	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:01:22.779	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:01:25.797	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:01:29.824	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:33.848	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:01:37.866	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:01:57.936	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:04.963	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:02:07.977	watch_beacon	1111	{"rssi": -97, "major": "30002", "minor": "27400", "txpower": "216", "distance": 71.53}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:02:21.032	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:02:23.042	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:17.205	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:03:20.218	watch_beacon	1111	{"rssi": -97, "major": "30002", "minor": "27400", "txpower": "216", "distance": 71.53}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:27.248	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:03:38.284	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:04:02.337	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:03:56.323	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:04:07.372	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:04:09.367	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:04:57.52	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:04:59.528	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:28:37.465	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:28:42.59	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:28:55.693	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:29:05.73	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:29:15.756	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:29:19.779	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:29:29.83	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:29:32.858	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:29:53.938	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:30:05.968	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27400", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:30:07.987	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:30:18.032	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:31:08.222	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:31:10.235	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:33:12.497	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:33:14.789	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:13:30.799	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:13:31.829	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:13:48.832	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27399", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:13:51.848	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:13:53.865	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:13:58.89	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:13:59.909	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:00.92	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:10.961	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:32.044	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:43.096	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:14:47.112	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:14:52.137	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:04.185	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:15:05.197	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:12.231	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:14.247	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:22.28	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:35.335	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:36.346	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:38.36	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27399", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:43.387	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:15:52.429	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:15:53.44	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:03.494	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:05.507	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:10.53	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:14.557	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:15.571	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:24.606	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:31.646	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:34.664	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:36.674	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:16:37.683	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:18:07.667	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:19:06.479	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:19:16.756	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:20:03.075	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:20:05.107	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:21:05.372	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:21:20.432	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:21:14.4	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:53:05.768	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:53:06.772	watch_beacon	1112	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 12:53:58.918	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:53:59.932	watch_beacon	1112	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 12:59:18.648	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:59:29.021	watch_beacon	1112	{"rssi": -80, "major": "30002", "minor": "27335", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 12:59:43.514	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:59:52.72	watch_beacon	1112	{"rssi": -81, "major": "30002", "minor": "27335", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:00:23.069	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:00:27.315	watch_beacon	1112	{"rssi": -79, "major": "30002", "minor": "27335", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:00:37.051	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:00:43.02	watch_beacon	1112	{"rssi": -79, "major": "30002", "minor": "27335", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:00:57.126	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:01:02.129	watch_beacon	1112	{"rssi": -78, "major": "30002", "minor": "27335", "txpower": "216", "distance": 13.41}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:01:16.018	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:01:36.273	watch_beacon	1112	{"rssi": -80, "major": "30002", "minor": "27335", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:01:48.079	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:03:09.295	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:03:19.321	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:03:39.353	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:03:49.384	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:04:22.425	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:04:37.469	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:04:45.483	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:04:55.341	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:05:09.199	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:05:18.088	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:06:59.093	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:07:13.131	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:08:49.263	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:08:52.275	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27335", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:11:47.051	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:12:00.09	watch_beacon	1112	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:15:26.233	watch_beacon	1112	{"rssi": -79, "major": "30002", "minor": "27335", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:15:47.29	watch_beacon	1112	{"rssi": -81, "major": "30002", "minor": "27335", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:16:26.394	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:16:35.418	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:17:26.54	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:17:30.549	watch_beacon	1112	{"rssi": -92, "major": "30002", "minor": "27335", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:17:50.599	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:46:02.312	watch_beacon	1112	{"rssi": -85, "major": "30002", "minor": "27399", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:46:48.077	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:46:58.251	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:47:33.421	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:47:37.445	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:47:48.484	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27399", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:13.38	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:48:28.457	watch_beacon	1112	{"rssi": -85, "major": "30002", "minor": "27399", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:41.545	watch_beacon	1112	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:48:44.558	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:36:03.176	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:48:48.591	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:55.627	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:05.673	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27399", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:48:57.646	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:49:02.663	watch_beacon	1112	{"rssi": -85, "major": "30002", "minor": "27400", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:13.704	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:14.722	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:49:23.849	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:29.887	watch_beacon	1112	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:49:36.944	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:49:45.987	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:50:04.06	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:50:05.075	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:50:11.106	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:50:13.129	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:50:15.155	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:50:20.203	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:50:55.108	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:50:56.168	watch_beacon	1112	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:06.268	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:51:24.325	watch_beacon	1112	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:51:44.407	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27399", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:51:45.421	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:00.494	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:52:02.516	watch_beacon	1112	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:12.574	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:52:14.588	watch_beacon	1112	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:22.636	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:52:27.67	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:35.771	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:52:38.816	watch_beacon	1112	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:52:50.878	watch_beacon	1112	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 13:52:52.898	watch_beacon	1112	{"rssi": -86, "major": "30002", "minor": "27400", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 13:58:33.962	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:59:55.419	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:34.174	watch_beacon	1112	{"rssi": -80, "major": "30002", "minor": "27399", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:00:35.242	watch_beacon	1112	{"rssi": -79, "major": "30002", "minor": "27400", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:00:36.246	watch_beacon	1112	{"rssi": -78, "major": "30002", "minor": "27399", "txpower": "216", "distance": 13.41}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:00:47.27	watch_beacon	1112	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:00:48.281	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:08:14.809	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:08:29.924	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:08:34.982	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:08:46.037	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27351", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:08:50.05	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27335", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:08:53.07	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27400", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:08:56.08	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27399", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:08:57.089	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27400", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:02.113	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27399", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:04.134	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27400", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:05.146	watch_beacon	1111	{"rssi": -82, "major": "30002", "minor": "27399", "txpower": "216", "distance": 19.67}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:07.157	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:09:08.16	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27399", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:18.193	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:09:19.199	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27399", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:24.214	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:09:26.224	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27351", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:09:31.24	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:36.253	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:09:42.272	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27399", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:45.288	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:47.294	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27399", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:09:50.303	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:09:54.319	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27351", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:00.335	watch_beacon	1111	{"rssi": -82, "major": "30002", "minor": "27399", "txpower": "216", "distance": 19.67}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:10:03.348	watch_beacon	1111	{"rssi": -80, "major": "30002", "minor": "27400", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:09.377	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:10.392	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27400", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:17.424	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:22.442	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27400", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:40.504	watch_beacon	1111	{"rssi": -77, "major": "30002", "minor": "27400", "txpower": "216", "distance": 12.15}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:54.568	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27400", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:10:59.589	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27351", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:11:05.966	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:51.028	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:19.946	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:48.046	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27335", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:20:00.268	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27351", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:23.353	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:10:24.45	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27399", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:10:30.471	watch_beacon	1111	{"rssi": -82, "major": "30002", "minor": "27335", "txpower": "216", "distance": 19.67}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:10:31.479	watch_beacon	1111	{"rssi": -80, "major": "30002", "minor": "27399", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:10:49.54	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27351", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:54.042	watch_beacon	1111	{"rssi": -82, "major": "30002", "minor": "27351", "txpower": "216", "distance": 19.67}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:14:15.12	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:20.137	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27351", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:12.27	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:17.289	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27351", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:45.384	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:59.435	watch_beacon	1111	{"rssi": -79, "major": "30002", "minor": "27351", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:29.552	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:34.572	watch_beacon	1111	{"rssi": -79, "major": "30002", "minor": "27351", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:59.665	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:06.69	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:33.784	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:17:43.816	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27351", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:54.854	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:18:03.883	watch_beacon	1111	{"rssi": -79, "major": "30002", "minor": "27351", "txpower": "216", "distance": 14.79}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:18:17.935	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:18:59.073	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:02.086	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27351", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:19:30.176	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:20:17.333	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:20:49.424	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27351", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:23:34.044	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:23:36.05	watch_beacon	1111	{"rssi": -80, "major": "30002", "minor": "27351", "txpower": "216", "distance": 16.28}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:25:23.655	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:25:24.664	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:25:37.708	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27400", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:26:10.81	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27351", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:26:19.833	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:26:31.457	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:26:41.493	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27351", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:26.194	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:41.247	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27351", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:31:52.304	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:26.418	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27351", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:32:37.457	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:40.476	watch_beacon	1111	{"rssi": -96, "major": "30002", "minor": "27335", "txpower": "216", "distance": 66.05}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:32:42.489	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27351", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:33:11.604	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:18.831	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27351", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:34:28.868	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:34:50.928	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27351", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:01.958	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:05.974	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27351", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:22.027	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:23.038	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27351", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:35:52.133	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27351", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:36:25.932	watch_beacon	1112	{"rssi": -90, "major": "30002", "minor": "27335", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 14:36:36.976	watch_beacon	1112	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:52.179	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:37:54.2	watch_beacon	1111	{"rssi": -70, "major": "30002", "minor": "27399", "txpower": "216", "distance": 5.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 09:48:56.266	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:49:09.362	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:08.354	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27351", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:07.345	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:04.322	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:48:57.282	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:10.372	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27351", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:05.333	watch_beacon	1111	{"rssi": -81, "major": "30002", "minor": "27351", "txpower": "216", "distance": 17.9}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:16.395	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:18.406	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27351", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:28.435	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:31.45	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27351", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:34.468	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:37.483	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:41.505	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:48.533	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27351", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:49:49.536	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:49:55.555	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:50:00.571	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:50:23.632	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:50:25.637	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:50:52.715	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27400", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:50:53.724	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:51:12.789	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27400", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:51:15.794	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:51:29.831	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:51:30.842	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:51:52.909	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:52:01.941	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:52:48.119	watch_beacon	1111	{"rssi": -82, "major": "30002", "minor": "27351", "txpower": "216", "distance": 19.67}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:52:53.138	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:52:56.154	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:52:57.158	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:52:58.173	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:04.208	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:53:06.221	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27351", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:10.238	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:53:19.261	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:26.288	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:53:28.298	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27351", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:31.317	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:53:32.324	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27351", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:40.352	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:53:41.362	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27351", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:53:45.375	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27400", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:53:54.405	watch_beacon	1111	{"rssi": -83, "major": "30002", "minor": "27351", "txpower": "216", "distance": 21.59}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:54:31.561	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:54:38.595	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 09:54:41.61	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:54:57.675	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:55:08.714	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 09:55:13.739	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:55:19.774	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27351", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:55:31.835	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:55:37.868	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:55:38.881	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:55:51.937	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:55:55.961	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:56:14.037	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:56:15.042	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27351", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:56:33.121	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:56:36.133	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:57:11.281	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:57:12.291	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27351", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:57:23.34	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:57:34.386	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 09:57:35.39	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:57:39.407	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27351", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 09:57:40.421	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:57:51.475	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:57:58.513	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:58:08.55	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:58:20.594	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:58:30.635	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:58:42.683	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:58:45.697	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:59:12.806	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:59:13.818	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:59:32.895	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:59:34.908	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27335", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:59:45.959	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 09:59:54.001	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:00:17.09	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27400", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:00:21.113	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 10:00:32.159	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27400", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:00:35.176	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:00:39.194	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27400", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:01:08.308	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 10:01:10.319	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:01:20.356	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 10:01:21.366	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27400", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:01:25.39	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 10:01:36.455	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27400", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:01:42.486	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 10:01:53.535	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27400", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:01:56.551	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:01:59.568	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 10:02:47.918	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:02:54.933	watch_beacon	1111	{"rssi": -73, "major": "30002", "minor": "27351", "txpower": "216", "distance": 8.09}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 10:04:14.127	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 10:04:23.158	watch_beacon	1111	{"rssi": -32, "major": "30002", "minor": "27351", "txpower": "216", "distance": 0.0}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 10:05:05.102	watch_beacon	1111	{"rssi": -38, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.02}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 13:31:31.262	watch_beacon	1111	{"rssi": -54, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.83}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 13:33:01.85	watch_beacon	1111	{"rssi": -58, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.47}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:03:59.508	watch_beacon	1111	{"rssi": -65, "major": "30002", "minor": "27351", "txpower": "4", "distance": 3.37}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:09:09.38	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27399", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:09:12.4	watch_beacon	1111	{"rssi": -51, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.47}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:11:54.028	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:11:55.04	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27399", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:12:00.067	watch_beacon	1111	{"rssi": -49, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.32}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:12:11.121	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:12:14.135	watch_beacon	1111	{"rssi": -52, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.57}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:12:39.231	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27335", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:12:45.261	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:12:47.276	watch_beacon	1111	{"rssi": -53, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.69}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:14:32.697	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:14:35.71	watch_beacon	1111	{"rssi": -66, "major": "30002", "minor": "27351", "txpower": "4", "distance": 3.78}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:14:46.762	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:14:50.783	watch_beacon	1111	{"rssi": -67, "major": "30002", "minor": "27351", "txpower": "4", "distance": 4.23}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:15:01.832	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:15:09.858	watch_beacon	1111	{"rssi": -66, "major": "30002", "minor": "27351", "txpower": "4", "distance": 3.78}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:16:22.092	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:16:27.123	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:16:30.141	watch_beacon	1111	{"rssi": -50, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.39}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:16:58.27	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27399", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:17:00.284	watch_beacon	1111	{"rssi": -50, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.39}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:17:11.335	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:17:12.348	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:17:13.358	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27399", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:17:18.389	watch_beacon	1111	{"rssi": -45, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.13}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:17:28.445	watch_beacon	1111	{"rssi": -85, "major": "30002", "minor": "27335", "txpower": "216", "distance": 25.91}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:17:31.466	watch_beacon	1111	{"rssi": -51, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.47}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:17:48.542	watch_beacon	1111	{"rssi": -86, "major": "30002", "minor": "27399", "txpower": "216", "distance": 28.35}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:17:50.556	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:18:02.608	watch_beacon	1111	{"rssi": -84, "major": "30002", "minor": "27335", "txpower": "216", "distance": 23.66}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:18:19.682	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27399", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:18:24.713	watch_beacon	1111	{"rssi": -50, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.39}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:18:49.769	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:18:57.78	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27399", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:18:58.784	watch_beacon	1111	{"rssi": -54, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.83}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:22:04.328	watch_beacon	1111	{"rssi": -89, "major": "30002", "minor": "27399", "txpower": "216", "distance": 36.89}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:22:06.348	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27335", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:22:07.358	watch_beacon	1111	{"rssi": -50, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.39}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:22:32.448	watch_beacon	1111	{"rssi": -88, "major": "30002", "minor": "27335", "txpower": "216", "distance": 33.82}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:22:37.477	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:23:02.57	watch_beacon	1111	{"rssi": -58, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.47}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:23:13.618	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:23:19.644	watch_beacon	1111	{"rssi": -56, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.14}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:24:00.83	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:24:26.923	watch_beacon	1111	{"rssi": -48, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.26}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:24:37.973	watch_beacon	1111	{"rssi": -90, "major": "30002", "minor": "27399", "txpower": "216", "distance": 40.2}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:24:50.036	watch_beacon	1111	{"rssi": -47, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.21}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:25:08.116	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:25:10.132	watch_beacon	1111	{"rssi": -47, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.21}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:25:27.199	watch_beacon	1111	{"rssi": -94, "major": "30002", "minor": "27399", "txpower": "216", "distance": 56.17}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:25:31.223	watch_beacon	1111	{"rssi": -52, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.57}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:25:42.269	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:25:44.28	watch_beacon	1111	{"rssi": -49, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.32}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:25:55.32	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:26:02.347	watch_beacon	1111	{"rssi": -49, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.32}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:26:19.413	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:26:21.424	watch_beacon	1111	{"rssi": -49, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.32}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:26:32.472	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:26:38.5	watch_beacon	1111	{"rssi": -48, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.26}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:27:22.664	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:27:47.74	watch_beacon	1111	{"rssi": -95, "major": "30002", "minor": "27400", "txpower": "216", "distance": 60.93}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 15:27:55.776	watch_beacon	1111	{"rssi": -56, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.14}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:28:16.857	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:28:36.931	watch_beacon	1111	{"rssi": -58, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.47}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:28:46.97	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:28:56.009	watch_beacon	1111	{"rssi": -67, "major": "30002", "minor": "27351", "txpower": "4", "distance": 4.23}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:29:21.092	watch_beacon	1111	{"rssi": -91, "major": "30002", "minor": "27335", "txpower": "216", "distance": 43.77}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:29:23.11	watch_beacon	1111	{"rssi": -57, "major": "30002", "minor": "27351", "txpower": "4", "distance": 1.3}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:29:40.182	watch_beacon	1111	\N	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:29:46.209	watch_beacon	1111	{"rssi": -93, "major": "30002", "minor": "27399", "txpower": "216", "distance": 51.73}	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:29:51.233	watch_beacon	1111	{"rssi": -92, "major": "30002", "minor": "27400", "txpower": "216", "distance": 47.6}	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 15:29:53.249	watch_beacon	1111	{"rssi": -53, "major": "30002", "minor": "27351", "txpower": "4", "distance": 0.69}	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:30:04.308	watch_beacon	1111	{"rssi": -87, "major": "30002", "minor": "27335", "txpower": "216", "distance": 30.98}	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
\.


--
-- Data for Name: _hyper_5_17_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_17_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_5_20_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_20_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_5_24_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_24_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_5_26_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_26_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_5_38_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_38_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
2025-11-14 14:00:13.787	watch_step	1112	19	{"position": "UNKNOWN"}
2025-11-14 14:00:17.058	watch_step	1112	12	{"position": "UNKNOWN"}
2025-11-14 14:00:18.3	watch_step	1112	2	{"position": "UNKNOWN"}
2025-11-14 14:01:00.838	watch_step	1112	67	{"position": "UNKNOWN"}
2025-11-14 14:08:17.986	watch_step	1111	10	{"position": "UNKNOWN"}
2025-11-14 14:08:18.986	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:19.957	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:20.941	watch_step	1111	1	{"position": "UNKNOWN"}
2025-11-14 14:08:21.946	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:22.919	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:23.918	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:24.961	watch_step	1111	1	{"position": "UNKNOWN"}
2025-11-14 14:08:25.957	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:26.916	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:27.96	watch_step	1111	1	{"position": "UNKNOWN"}
2025-11-14 14:08:28.933	watch_step	1111	2	{"position": "UNKNOWN"}
2025-11-14 14:08:29.961	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:30.956	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:31.952	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:32.946	watch_step	1111	3	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:33.953	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:34.948	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:08:35.97	watch_step	1111	2	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:08:36.939	watch_step	1111	1	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:08:37.974	watch_step	1111	2	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:08:38.989	watch_step	1111	1	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:08:39.968	watch_step	1111	1	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:09:04.994	watch_step	1111	10	{"major": "30002", "minor": "27400", "position": "구역5"}
2025-11-14 14:09:06.021	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:06.996	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:08.008	watch_step	1111	1	{"major": "30002", "minor": "27351", "position": "구역4"}
2025-11-14 14:09:09.026	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:10.018	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:11.029	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:12.029	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:13.04	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:14.015	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:15.036	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:16.038	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:17.009	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:18.017	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:19.041	watch_step	1111	1	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:09:20.054	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:21.054	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:09:22.056	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:26.1	watch_step	1111	11	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:27.08	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:28.071	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:29.102	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:30.097	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:31.111	watch_step	1111	1	{"major": "30002", "minor": "27335", "position": "구역1"}
2025-11-14 14:10:32.105	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:33.114	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:34.08	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:35.104	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:36.117	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:37.085	watch_step	1111	2	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:38.118	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:39.121	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:40.089	watch_step	1111	1	{"major": "30002", "minor": "27399", "position": "구역6"}
2025-11-14 14:10:51.097	watch_step	1111	11	{"major": "30002", "minor": "27351", "position": "구역4"}
2025-11-14 14:20:41.27	watch_step	1112	92	{"position": "UNKNOWN"}
2025-11-14 14:26:14.537	watch_step	1112	10	{"position": "UNKNOWN"}
2025-11-14 14:35:26.132	watch_step	1112	10	{"position": "UNKNOWN"}
\.


--
-- Data for Name: _hyper_5_4_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_4_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_5_6_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_5_6_chunk (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: _hyper_6_12_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_6_12_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: _hyper_6_18_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_6_18_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: _hyper_6_37_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_6_37_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
2025-11-14 12:08:45.761	watch_spo2	1111	86	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:13:46.577	watch_spo2	1111	93	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:14:55.84	watch_spo2	1111	97	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
\.


--
-- Data for Name: _hyper_6_5_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_6_5_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: _hyper_6_9_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: root
--

COPY _timescaledb_internal._hyper_6_9_chunk (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: ai_hr_events; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ai_hr_events (id, worker_id, ts, hr, level, reasons, created_at) FROM stdin;
1	1115	2025-09-03 10:03:13.399601	125	WARN	["high_hr"]	2025-09-03 01:03:13.140745+00
2	1115	2025-09-03 10:11:04.846273	55	WARN	["low_hr"]	2025-09-03 01:11:04.561674+00
3	1115	2025-09-03 10:11:15.333447	85	NORMAL	[]	2025-09-03 01:11:15.040423+00
4	1115	2025-09-03 11:03:18	92	NORMAL	[]	2025-09-03 02:03:16.659156+00
5	1115	2025-09-03 11:03:24	94	NORMAL	[]	2025-09-03 02:03:22.589588+00
6	1115	2025-09-03 11:03:29	94	NORMAL	[]	2025-09-03 02:03:27.587926+00
7	1115	2025-09-03 11:03:35	93	NORMAL	[]	2025-09-03 02:03:33.603229+00
8	1115	2025-09-03 11:03:41	94	NORMAL	[]	2025-09-03 02:03:39.614949+00
9	1115	2025-09-03 11:03:46	95	NORMAL	[]	2025-09-03 02:03:44.610881+00
10	1115	2025-09-03 11:03:53	96	NORMAL	[]	2025-09-03 02:03:51.684379+00
11	1115	2025-09-03 11:04:00	96	NORMAL	[]	2025-09-03 02:03:58.690891+00
12	1115	2025-09-03 11:04:09	98	NORMAL	[]	2025-09-03 02:04:07.689693+00
13	1115	2025-09-03 11:04:16	99	NORMAL	[]	2025-09-03 02:04:42.817571+00
14	1115	2025-09-03 11:04:22	99	NORMAL	[]	2025-09-03 02:04:42.840793+00
15	1115	2025-09-03 11:04:29	98	NORMAL	[]	2025-09-03 02:04:42.864549+00
16	1115	2025-09-03 11:04:35	96	NORMAL	[]	2025-09-03 02:04:42.895904+00
17	1115	2025-09-03 11:04:41	98	NORMAL	[]	2025-09-03 02:04:42.913204+00
18	1115	2025-09-03 11:04:46	97	NORMAL	[]	2025-09-03 02:04:44.749562+00
19	1115	2025-09-03 11:04:51	99	NORMAL	[]	2025-09-03 02:05:32.843355+00
20	1115	2025-09-03 11:04:57	97	NORMAL	[]	2025-09-03 02:05:32.868758+00
21	1115	2025-09-03 11:05:24	96	NORMAL	[]	2025-09-03 02:05:32.885118+00
22	1115	2025-09-03 11:05:16	98	NORMAL	[]	2025-09-03 02:05:32.886364+00
23	1115	2025-09-03 11:05:31	92	NORMAL	[]	2025-09-03 02:05:32.891176+00
24	1115	2025-09-03 11:05:04	96	NORMAL	[]	2025-09-03 02:05:32.895545+00
25	1115	2025-09-03 11:05:40	93	NORMAL	[]	2025-09-03 02:05:38.852512+00
26	1115	2025-09-03 11:06:49	104	NORMAL	[]	2025-09-03 02:06:47.007093+00
27	1115	2025-09-03 11:06:54	99	NORMAL	[]	2025-09-03 02:06:51.97639+00
28	1115	2025-09-03 11:07:00	95	NORMAL	[]	2025-09-03 02:06:58.97894+00
29	1115	2025-09-03 11:07:05	94	NORMAL	[]	2025-09-03 02:07:02.987547+00
30	1115	2025-09-03 11:07:45	93	NORMAL	[]	2025-09-03 02:07:43.031969+00
31	1115	2025-09-03 11:07:50	94	NORMAL	[]	2025-09-03 02:07:48.007198+00
32	1115	2025-09-03 11:08:04	95	NORMAL	[]	2025-09-03 02:08:04.075051+00
33	1115	2025-09-03 11:08:09	95	NORMAL	[]	2025-09-03 02:08:07.095715+00
34	1115	2025-09-03 11:09:06	91	NORMAL	[]	2025-09-03 02:09:04.217622+00
35	1115	2025-09-03 11:09:12	89	NORMAL	[]	2025-09-03 02:09:10.163814+00
36	1115	2025-09-03 11:09:22	90	NORMAL	[]	2025-09-03 02:09:20.211787+00
37	1115	2025-09-03 11:09:27	88	NORMAL	[]	2025-09-03 02:09:31.205424+00
38	1115	2025-09-03 11:09:38	89	NORMAL	[]	2025-09-03 02:09:36.255679+00
39	1115	2025-09-03 11:09:46	90	NORMAL	[]	2025-09-03 02:10:15.328365+00
40	1115	2025-09-03 11:09:54	92	NORMAL	[]	2025-09-03 02:10:15.354738+00
41	1115	2025-09-03 11:10:04	94	NORMAL	[]	2025-09-03 02:10:15.36122+00
42	1115	2025-09-03 11:10:12	91	NORMAL	[]	2025-09-03 02:10:15.361136+00
43	1115	2025-09-03 11:10:19	93	NORMAL	[]	2025-09-03 02:10:16.329356+00
44	1115	2025-09-03 11:10:50	82	NORMAL	[]	2025-09-03 02:10:48.4012+00
45	1115	2025-09-03 11:10:56	82	NORMAL	[]	2025-09-03 02:10:54.393162+00
46	1115	2025-09-03 11:11:01	83	NORMAL	[]	2025-09-03 02:10:59.383079+00
47	1115	2025-09-03 11:11:06	87	NORMAL	[]	2025-09-03 02:11:04.425274+00
48	1115	2025-09-03 11:11:11	89	NORMAL	[]	2025-09-03 02:11:34.771621+00
49	1115	2025-09-03 11:11:23	89	NORMAL	[]	2025-09-03 02:11:34.789319+00
50	1115	2025-09-03 11:11:33	89	NORMAL	[]	2025-09-03 02:11:34.804425+00
51	1115	2025-09-03 11:11:44	89	NORMAL	[]	2025-09-03 02:11:49.512625+00
52	1115	2025-09-03 11:11:56	91	NORMAL	[]	2025-09-03 02:12:22.612675+00
53	1115	2025-09-03 11:12:02	88	NORMAL	[]	2025-09-03 02:12:22.63553+00
54	1115	2025-09-03 11:12:08	89	NORMAL	[]	2025-09-03 02:12:22.653327+00
55	1115	2025-09-03 11:12:16	90	NORMAL	[]	2025-09-03 02:12:22.684733+00
56	1115	2025-09-03 11:12:30	88	NORMAL	[]	2025-09-03 02:12:28.599516+00
57	1115	2025-09-03 02:21:16	91	NORMAL	[]	2025-09-03 02:21:14.180967+00
58	1115	2025-09-03 02:21:21	92	NORMAL	[]	2025-09-03 02:21:19.168046+00
59	1115	2025-09-03 02:21:26	96	NORMAL	[]	2025-09-03 02:21:24.173755+00
60	1115	2025-09-03 02:21:33	98	NORMAL	[]	2025-09-03 02:21:31.179918+00
61	1115	2025-09-03 02:21:38	96	NORMAL	[]	2025-09-03 02:21:36.167727+00
62	1115	2025-09-03 02:21:43	94	NORMAL	[]	2025-09-03 02:21:41.213089+00
63	1115	2025-09-03 02:21:56	92	NORMAL	[]	2025-09-03 02:21:54.23324+00
64	1115	2025-09-03 02:22:05	91	NORMAL	[]	2025-09-03 02:22:03.229561+00
65	1115	2025-09-03 02:22:10	89	NORMAL	[]	2025-09-03 02:22:08.2525+00
66	1115	2025-09-03 02:22:16	89	NORMAL	[]	2025-09-02 17:23:06.297717+00
67	1115	2025-09-03 02:22:23	91	NORMAL	[]	2025-09-02 17:23:06.319446+00
68	1115	2025-09-03 02:22:29	94	NORMAL	[]	2025-09-02 17:23:06.321927+00
69	1115	2025-09-03 02:22:36	91	NORMAL	[]	2025-09-02 17:23:06.322224+00
70	1115	2025-09-03 02:22:47	93	NORMAL	[]	2025-09-02 17:23:06.322766+00
71	1115	2025-09-03 02:22:58	97	NORMAL	[]	2025-09-02 17:23:06.335104+00
72	1115	2025-09-03 02:23:09	98	NORMAL	[]	2025-09-02 17:23:07.307774+00
73	1115	2025-09-03 02:23:16	99	NORMAL	[]	2025-09-02 17:24:12.40148+00
74	1115	2025-09-03 02:23:29	97	NORMAL	[]	2025-09-02 17:24:12.42332+00
75	1115	2025-09-03 02:23:50	90	NORMAL	[]	2025-09-02 17:24:12.427083+00
76	1115	2025-09-03 02:23:37	93	NORMAL	[]	2025-09-02 17:24:12.427248+00
77	1115	2025-09-03 02:24:09	94	NORMAL	[]	2025-09-02 17:24:12.427449+00
78	1115	2025-09-03 02:23:44	93	NORMAL	[]	2025-09-02 17:24:12.427678+00
79	1115	2025-09-03 02:24:03	90	NORMAL	[]	2025-09-02 17:24:12.447485+00
80	1115	2025-09-03 02:24:15	96	NORMAL	[]	2025-09-02 17:24:13.418106+00
81	1115	2025-09-03 02:24:21	97	NORMAL	[]	2025-09-02 17:24:44.432569+00
82	1115	2025-09-03 02:24:29	99	NORMAL	[]	2025-09-02 17:24:44.45466+00
83	1115	2025-09-03 02:24:38	99	NORMAL	[]	2025-09-02 17:24:44.455759+00
84	1115	2025-09-03 02:24:51	96	NORMAL	[]	2025-09-02 17:24:49.434127+00
85	1115	2025-09-03 02:24:57	95	NORMAL	[]	2025-09-02 17:24:55.450218+00
86	1115	2025-09-03 02:25:02	98	NORMAL	[]	2025-09-02 17:25:00.441059+00
87	1115	2025-09-03 02:25:07	103	NORMAL	[]	2025-09-02 17:25:05.468576+00
88	1115	2025-09-03 02:25:12	109	NORMAL	[]	2025-09-02 17:25:10.507981+00
89	1115	2025-09-03 02:25:17	114	WARN	["high_hr"]	2025-09-02 17:25:15.485597+00
90	1115	2025-09-03 02:25:22	120	ALERT	["rapid_rise", "high_hr"]	2025-09-02 17:25:20.513174+00
91	1115	2025-09-03 02:25:27	123	ALERT	["rapid_rise", "high_hr"]	2025-09-02 17:25:25.529311+00
92	1115	2025-09-03 02:25:35	123	ALERT	["rapid_rise", "high_hr"]	2025-09-02 17:25:33.518722+00
93	1115	2025-09-03 02:25:40	120	ALERT	["rapid_rise", "high_hr"]	2025-09-02 17:25:38.575254+00
94	1115	2025-09-03 02:25:45	111	WARN	["high_hr"]	2025-09-02 17:25:43.556856+00
95	1115	2025-09-03 02:25:50	104	NORMAL	[]	2025-09-02 17:25:48.586147+00
96	1115	2025-09-03 02:25:55	98	NORMAL	[]	2025-09-02 17:26:05.544737+00
97	1115	2025-09-03 02:26:02	93	NORMAL	[]	2025-09-02 17:26:05.562814+00
98	1115	2025-09-03 02:26:09	95	NORMAL	[]	2025-09-02 17:26:07.549902+00
99	1115	2025-09-03 02:26:15	94	NORMAL	[]	2025-09-02 17:26:46.673827+00
100	1115	2025-09-03 02:26:23	93	NORMAL	[]	2025-09-02 17:26:46.689727+00
101	1115	2025-09-03 02:26:35	90	NORMAL	[]	2025-09-02 17:26:46.691165+00
102	1115	2025-09-03 02:26:43	92	NORMAL	[]	2025-09-02 17:26:46.691347+00
103	1115	2025-09-03 02:26:49	91	NORMAL	[]	2025-09-02 17:26:47.667135+00
104	1115	2025-09-03 02:26:54	87	NORMAL	[]	2025-09-02 17:26:52.658983+00
105	1115	2025-09-03 02:27:04	86	NORMAL	[]	2025-09-02 17:28:16.572863+00
106	1115	2025-09-03 02:27:12	87	NORMAL	[]	2025-09-02 17:28:16.589066+00
107	1115	2025-09-03 02:27:18	86	NORMAL	[]	2025-09-02 17:28:16.604552+00
109	1115	2025-09-03 02:27:33	91	NORMAL	[]	2025-09-02 17:28:16.617358+00
112	1115	2025-09-03 02:28:03	87	NORMAL	[]	2025-09-02 17:28:16.633674+00
108	1115	2025-09-03 02:27:24	88	NORMAL	[]	2025-09-02 17:28:16.606449+00
110	1115	2025-09-03 02:27:39	93	NORMAL	[]	2025-09-02 17:28:16.631038+00
114	1115	2025-09-03 02:28:10	89	NORMAL	[]	2025-09-02 17:28:16.644672+00
116	1115	2025-09-03 02:28:23	90	NORMAL	[]	2025-09-02 17:28:21.414642+00
111	1115	2025-09-03 02:27:47	93	NORMAL	[]	2025-09-02 17:28:16.631268+00
115	1115	2025-09-03 02:28:17	92	NORMAL	[]	2025-09-02 17:28:16.644858+00
113	1115	2025-09-03 02:27:54	88	NORMAL	[]	2025-09-02 17:28:16.633747+00
117	1115	2025-09-03 02:28:28	85	NORMAL	[]	2025-09-02 17:28:55.725399+00
118	1115	2025-09-03 02:28:34	84	NORMAL	[]	2025-09-02 17:28:55.743835+00
119	1115	2025-09-03 02:28:45	86	NORMAL	[]	2025-09-02 17:28:55.746146+00
120	1115	2025-09-03 02:28:54	88	NORMAL	[]	2025-09-02 17:28:55.746401+00
121	1115	2025-09-03 02:28:59	89	NORMAL	[]	2025-09-02 17:28:57.721906+00
122	1115	2025-09-03 02:29:05	92	NORMAL	[]	2025-09-02 17:30:34.908619+00
123	1115	2025-09-03 02:30:25	89	NORMAL	[]	2025-09-02 17:30:34.932914+00
124	1115	2025-09-03 02:29:11	93	NORMAL	[]	2025-09-02 17:30:34.937816+00
125	1115	2025-09-03 02:29:36	93	NORMAL	[]	2025-09-02 17:30:34.938254+00
126	1115	2025-09-03 02:30:18	89	NORMAL	[]	2025-09-02 17:30:34.938483+00
127	1115	2025-09-03 02:29:53	89	NORMAL	[]	2025-09-02 17:30:34.939049+00
128	1115	2025-09-03 02:29:24	93	NORMAL	[]	2025-09-02 17:30:34.9393+00
129	1115	2025-09-03 02:29:30	92	NORMAL	[]	2025-09-02 17:30:34.939393+00
130	1115	2025-09-03 02:30:12	90	NORMAL	[]	2025-09-02 17:30:34.939744+00
131	1115	2025-09-03 02:29:45	91	NORMAL	[]	2025-09-02 17:30:34.940023+00
132	1115	2025-09-03 02:30:31	90	NORMAL	[]	2025-09-02 17:30:34.954899+00
133	1115	2025-09-03 02:30:40	89	NORMAL	[]	2025-09-02 17:30:37.614707+00
134	1115	2025-09-03 02:30:47	85	NORMAL	[]	2025-09-02 17:30:59.726083+00
135	1115	2025-09-03 02:30:54	84	NORMAL	[]	2025-09-02 17:30:59.745807+00
136	1115	2025-09-03 02:31:00	85	NORMAL	[]	2025-09-02 17:30:59.746478+00
137	1115	2025-09-03 02:31:07	85	NORMAL	[]	2025-09-02 17:33:27.198639+00
138	1115	2025-09-03 02:31:14	90	NORMAL	[]	2025-09-02 17:33:27.219463+00
139	1115	2025-09-03 02:32:18	91	NORMAL	[]	2025-09-02 17:33:27.225968+00
140	1115	2025-09-03 02:31:26	91	NORMAL	[]	2025-09-02 17:33:27.226964+00
141	1115	2025-09-03 02:31:34	90	NORMAL	[]	2025-09-02 17:33:27.227218+00
142	1115	2025-09-03 02:31:59	96	NORMAL	[]	2025-09-02 17:33:27.227391+00
143	1115	2025-09-03 02:32:11	91	NORMAL	[]	2025-09-02 17:33:27.23354+00
144	1115	2025-09-03 02:33:09	87	NORMAL	[]	2025-09-02 17:33:27.238624+00
145	1115	2025-09-03 02:33:16	85	NORMAL	[]	2025-09-02 17:33:27.239907+00
146	1115	2025-09-03 02:33:23	87	NORMAL	[]	2025-09-02 17:33:27.247659+00
147	1115	2025-09-03 02:32:34	88	NORMAL	[]	2025-09-02 17:33:27.259897+00
148	1115	2025-09-03 02:32:28	90	NORMAL	[]	2025-09-02 17:33:27.260647+00
149	1115	2025-09-03 02:32:44	89	NORMAL	[]	2025-09-02 17:33:27.260902+00
150	1115	2025-09-03 02:31:48	95	NORMAL	[]	2025-09-02 17:33:27.26115+00
151	1115	2025-09-03 02:31:42	90	NORMAL	[]	2025-09-02 17:33:27.261142+00
152	1115	2025-09-03 02:32:05	95	NORMAL	[]	2025-09-02 17:33:27.261621+00
153	1115	2025-09-03 02:33:03	88	NORMAL	[]	2025-09-02 17:33:27.262638+00
154	1115	2025-09-03 02:32:50	86	NORMAL	[]	2025-09-02 17:33:27.263261+00
155	1115	2025-09-03 02:32:57	86	NORMAL	[]	2025-09-02 17:33:27.263447+00
156	1115	2025-09-03 02:33:30	90	NORMAL	[]	2025-09-02 17:33:29.063164+00
157	1115	2025-09-03 02:33:50	93	NORMAL	[]	2025-09-02 17:34:20.436106+00
158	1115	2025-09-03 02:34:02	93	NORMAL	[]	2025-09-02 17:34:20.455006+00
159	1115	2025-09-03 02:34:15	95	NORMAL	[]	2025-09-02 17:34:20.455532+00
160	1115	2025-09-03 02:34:08	94	NORMAL	[]	2025-09-02 17:34:20.458119+00
161	1115	2025-09-03 02:34:27	95	NORMAL	[]	2025-09-02 17:34:57.791982+00
162	1115	2025-09-03 02:34:37	96	NORMAL	[]	2025-09-02 17:34:57.814994+00
163	1115	2025-09-03 02:34:43	98	NORMAL	[]	2025-09-02 17:34:57.816881+00
164	1115	2025-09-03 02:34:56	96	NORMAL	[]	2025-09-02 17:34:57.818041+00
165	1115	2025-09-03 02:34:49	97	NORMAL	[]	2025-09-02 17:34:57.81913+00
166	1115	2025-09-03 02:35:02	92	NORMAL	[]	2025-09-02 17:36:10.717901+00
167	1115	2025-09-03 02:35:08	90	NORMAL	[]	2025-09-02 17:36:10.835374+00
168	1115	2025-09-03 02:35:16	92	NORMAL	[]	2025-09-02 17:36:10.838218+00
169	1115	2025-09-03 02:35:22	92	NORMAL	[]	2025-09-02 17:36:10.839229+00
170	1115	2025-09-03 02:35:41	95	NORMAL	[]	2025-09-02 17:36:10.839945+00
171	1115	2025-09-03 02:35:31	96	NORMAL	[]	2025-09-02 17:36:10.840212+00
172	1115	2025-09-03 02:35:47	96	NORMAL	[]	2025-09-02 17:36:10.850451+00
173	1115	2025-09-03 02:35:54	99	NORMAL	[]	2025-09-02 17:36:10.850884+00
174	1115	2025-09-03 02:36:07	101	NORMAL	[]	2025-09-02 17:36:10.859897+00
175	1115	2025-09-03 02:36:14	103	NORMAL	[]	2025-09-02 17:36:11.532079+00
176	1115	2025-09-03 02:36:19	101	NORMAL	[]	2025-09-02 17:36:45.78616+00
177	1115	2025-09-03 02:36:25	99	NORMAL	[]	2025-09-02 17:36:45.806495+00
178	1115	2025-09-03 02:36:31	97	NORMAL	[]	2025-09-02 17:36:45.808309+00
179	1115	2025-09-03 02:36:39	96	NORMAL	[]	2025-09-02 17:36:45.809005+00
180	1115	2025-09-03 02:36:50	96	NORMAL	[]	2025-09-02 17:36:48.764559+00
181	1115	2025-09-03 02:36:59	98	NORMAL	[]	2025-09-02 17:36:57.811169+00
182	1115	2025-09-03 02:37:04	97	NORMAL	[]	2025-09-02 17:37:02.79879+00
183	1115	2025-09-03 02:37:10	96	NORMAL	[]	2025-09-02 17:37:08.791029+00
184	1115	2025-09-03 02:37:22	95	NORMAL	[]	2025-09-02 17:41:04.337888+00
185	1115	2025-09-03 02:37:30	93	NORMAL	[]	2025-09-02 17:41:04.360994+00
186	1115	2025-09-03 02:37:36	95	NORMAL	[]	2025-09-02 17:41:04.364265+00
187	1115	2025-09-03 02:37:46	97	NORMAL	[]	2025-09-02 17:41:04.364398+00
188	1115	2025-09-03 02:38:14	92	NORMAL	[]	2025-09-02 17:41:04.364521+00
189	1115	2025-09-03 02:38:08	94	NORMAL	[]	2025-09-02 17:41:04.365578+00
190	1115	2025-09-03 02:37:53	95	NORMAL	[]	2025-09-02 17:41:04.373182+00
191	1115	2025-09-03 02:38:21	91	NORMAL	[]	2025-09-02 17:41:04.377196+00
192	1115	2025-09-03 02:38:28	92	NORMAL	[]	2025-09-02 17:41:04.378031+00
193	1115	2025-09-03 02:38:37	92	NORMAL	[]	2025-09-02 17:41:04.378208+00
194	1115	2025-09-03 02:38:43	90	NORMAL	[]	2025-09-02 17:41:04.393505+00
195	1115	2025-09-03 02:38:53	88	NORMAL	[]	2025-09-02 17:41:04.408747+00
196	1115	2025-09-03 02:39:01	90	NORMAL	[]	2025-09-02 17:41:04.409244+00
197	1115	2025-09-03 02:39:08	94	NORMAL	[]	2025-09-02 17:41:04.422443+00
198	1115	2025-09-03 02:39:21	96	NORMAL	[]	2025-09-02 17:41:04.4226+00
199	1115	2025-09-03 02:39:27	98	NORMAL	[]	2025-09-02 17:41:04.422796+00
200	1115	2025-09-03 02:39:33	98	NORMAL	[]	2025-09-02 17:41:04.423645+00
201	1115	2025-09-03 02:39:46	98	NORMAL	[]	2025-09-02 17:41:04.460887+00
202	1115	2025-09-03 02:39:53	95	NORMAL	[]	2025-09-02 17:41:04.476002+00
203	1115	2025-09-03 02:40:01	90	NORMAL	[]	2025-09-02 17:41:04.476069+00
204	1115	2025-09-03 02:40:10	91	NORMAL	[]	2025-09-02 17:41:04.476201+00
205	1115	2025-09-03 02:40:17	88	NORMAL	[]	2025-09-02 17:41:04.489417+00
206	1115	2025-09-03 02:40:24	90	NORMAL	[]	2025-09-02 17:41:04.489655+00
207	1115	2025-09-03 02:40:38	89	NORMAL	[]	2025-09-02 17:41:04.498566+00
208	1115	2025-09-03 02:40:44	88	NORMAL	[]	2025-09-02 17:41:04.507421+00
209	1115	2025-09-03 02:40:52	90	NORMAL	[]	2025-09-02 17:41:04.513691+00
210	1115	2025-09-03 02:40:58	91	NORMAL	[]	2025-09-02 17:41:04.522878+00
211	1115	2025-09-03 02:41:06	92	NORMAL	[]	2025-09-02 17:41:04.993234+00
212	1115	2025-09-03 02:41:13	94	NORMAL	[]	2025-09-02 17:41:32.211715+00
213	1115	2025-09-03 02:41:21	95	NORMAL	[]	2025-09-02 17:41:32.336686+00
214	1115	2025-09-03 02:41:29	93	NORMAL	[]	2025-09-02 17:41:32.337878+00
215	1115	2025-09-03 02:41:38	91	NORMAL	[]	2025-09-02 17:41:52.500401+00
216	1115	2025-09-03 02:41:46	94	NORMAL	[]	2025-09-02 17:41:52.52094+00
217	1115	2025-09-03 02:41:52	94	NORMAL	[]	2025-09-02 17:41:52.522218+00
218	1115	2025-09-03 02:41:58	91	NORMAL	[]	2025-09-02 17:41:56.402155+00
219	1115	2025-09-03 02:42:04	92	NORMAL	[]	2025-09-02 17:42:25.760342+00
220	1115	2025-09-03 02:42:10	92	NORMAL	[]	2025-09-02 17:42:25.776925+00
221	1115	2025-09-03 02:42:16	92	NORMAL	[]	2025-09-02 17:42:25.779052+00
222	1115	2025-09-03 02:42:22	92	NORMAL	[]	2025-09-02 17:42:25.779438+00
223	1115	2025-09-03 02:42:34	91	NORMAL	[]	2025-09-02 17:43:02.039257+00
228	1115	2025-09-03 02:43:17	89	NORMAL	[]	2025-09-02 17:43:14.045218+00
230	1115	2025-09-03 02:43:32	91	NORMAL	[]	2025-09-02 17:47:11.367694+00
235	1115	2025-09-03 02:45:30	90	NORMAL	[]	2025-09-02 17:47:11.390384+00
224	1115	2025-09-03 02:42:45	89	NORMAL	[]	2025-09-02 17:43:02.066281+00
229	1115	2025-09-03 02:43:26	89	NORMAL	[]	2025-09-02 17:47:11.335209+00
233	1115	2025-09-03 02:44:10	85	NORMAL	[]	2025-09-02 17:47:11.369746+00
244	1115	2025-09-03 02:46:07	88	NORMAL	[]	2025-09-02 17:47:11.393269+00
256	1115	2025-09-03 02:45:39	87	NORMAL	[]	2025-09-02 17:47:11.405303+00
225	1115	2025-09-03 02:42:55	90	NORMAL	[]	2025-09-02 17:43:02.08703+00
227	1115	2025-09-03 02:43:08	90	NORMAL	[]	2025-09-02 17:43:12.031505+00
231	1115	2025-09-03 02:43:45	91	NORMAL	[]	2025-09-02 17:47:11.36883+00
237	1115	2025-09-03 02:45:47	88	NORMAL	[]	2025-09-02 17:47:11.392325+00
226	1115	2025-09-03 02:43:01	90	NORMAL	[]	2025-09-02 17:43:02.088125+00
232	1115	2025-09-03 02:43:51	93	NORMAL	[]	2025-09-02 17:47:11.36925+00
245	1115	2025-09-03 02:45:54	88	NORMAL	[]	2025-09-02 17:47:11.393843+00
234	1115	2025-09-03 02:44:03	88	NORMAL	[]	2025-09-02 17:47:11.37005+00
236	1115	2025-09-03 02:44:58	91	NORMAL	[]	2025-09-02 17:47:11.392268+00
238	1115	2025-09-03 02:45:11	92	NORMAL	[]	2025-09-02 17:47:11.39239+00
239	1115	2025-09-03 02:44:16	89	NORMAL	[]	2025-09-02 17:47:11.392396+00
240	1115	2025-09-03 02:46:16	87	NORMAL	[]	2025-09-02 17:47:11.392786+00
241	1115	2025-09-03 02:44:51	90	NORMAL	[]	2025-09-02 17:47:11.392762+00
242	1115	2025-09-03 02:43:57	91	NORMAL	[]	2025-09-02 17:47:11.393109+00
243	1115	2025-09-03 02:44:42	90	NORMAL	[]	2025-09-02 17:47:11.393079+00
246	1115	2025-09-03 02:44:24	91	NORMAL	[]	2025-09-02 17:47:11.393794+00
247	1115	2025-09-03 02:44:34	88	NORMAL	[]	2025-09-02 17:47:11.394287+00
248	1115	2025-09-03 02:45:18	92	NORMAL	[]	2025-09-02 17:47:11.394556+00
249	1115	2025-09-03 02:45:24	92	NORMAL	[]	2025-09-02 17:47:11.398545+00
250	1115	2025-09-03 02:46:33	87	NORMAL	[]	2025-09-02 17:47:11.402787+00
251	1115	2025-09-03 02:46:48	89	NORMAL	[]	2025-09-02 17:47:11.403888+00
252	1115	2025-09-03 02:46:54	91	NORMAL	[]	2025-09-02 17:47:11.40436+00
253	1115	2025-09-03 02:46:24	86	NORMAL	[]	2025-09-02 17:47:11.40457+00
254	1115	2025-09-03 02:47:01	91	NORMAL	[]	2025-09-02 17:47:11.404921+00
255	1115	2025-09-03 02:47:07	88	NORMAL	[]	2025-09-02 17:47:11.405109+00
257	1115	2025-09-03 02:46:01	88	NORMAL	[]	2025-09-02 17:47:11.405777+00
258	1115	2025-09-03 02:47:16	88	NORMAL	[]	2025-09-02 17:47:15.264278+00
259	1115	2025-09-03 02:47:26	87	NORMAL	[]	2025-09-02 17:49:57.910252+00
260	1115	2025-09-03 02:47:32	88	NORMAL	[]	2025-09-02 17:49:58.025486+00
261	1115	2025-09-03 02:48:16	92	NORMAL	[]	2025-09-02 17:49:58.033589+00
262	1115	2025-09-03 02:47:42	88	NORMAL	[]	2025-09-02 17:49:58.03363+00
263	1115	2025-09-03 02:48:03	90	NORMAL	[]	2025-09-02 17:49:58.035393+00
264	1115	2025-09-03 02:47:54	89	NORMAL	[]	2025-09-02 17:49:58.037192+00
265	1115	2025-09-03 02:48:32	92	NORMAL	[]	2025-09-02 17:49:58.045026+00
266	1115	2025-09-03 02:49:06	93	NORMAL	[]	2025-09-02 17:49:58.05569+00
267	1115	2025-09-03 02:47:48	86	NORMAL	[]	2025-09-02 17:49:58.059855+00
268	1115	2025-09-03 02:49:13	90	NORMAL	[]	2025-09-02 17:49:58.060113+00
269	1115	2025-09-03 02:48:09	87	NORMAL	[]	2025-09-02 17:49:58.060887+00
270	1115	2025-09-03 02:48:38	92	NORMAL	[]	2025-09-02 17:49:58.061491+00
271	1115	2025-09-03 02:48:45	94	NORMAL	[]	2025-09-02 17:49:58.061761+00
272	1115	2025-09-03 02:48:25	94	NORMAL	[]	2025-09-02 17:49:58.061819+00
273	1115	2025-09-03 02:49:19	89	NORMAL	[]	2025-09-02 17:49:58.061825+00
274	1115	2025-09-03 02:49:25	90	NORMAL	[]	2025-09-02 17:49:58.064285+00
275	1115	2025-09-03 02:49:32	92	NORMAL	[]	2025-09-02 17:49:58.071488+00
276	1115	2025-09-03 02:48:52	90	NORMAL	[]	2025-09-02 17:49:58.071555+00
277	1115	2025-09-03 02:48:59	92	NORMAL	[]	2025-09-02 17:49:58.072751+00
278	1115	2025-09-03 02:49:39	90	NORMAL	[]	2025-09-02 17:49:58.078793+00
279	1115	2025-09-03 02:49:45	90	NORMAL	[]	2025-09-02 17:49:58.08112+00
280	1115	2025-09-03 02:49:51	91	NORMAL	[]	2025-09-02 17:49:58.088384+00
281	1115	2025-09-03 02:49:58	89	NORMAL	[]	2025-09-02 17:49:58.102226+00
282	1115	2025-09-03 02:50:03	91	NORMAL	[]	2025-09-02 17:50:00.766754+00
283	1115	2025-09-03 02:50:10	95	NORMAL	[]	2025-09-02 17:53:06.830287+00
284	1115	2025-09-03 02:50:17	94	NORMAL	[]	2025-09-02 17:53:06.848023+00
285	1115	2025-09-03 02:50:42	89	NORMAL	[]	2025-09-02 17:53:06.8543+00
286	1115	2025-09-03 02:50:51	90	NORMAL	[]	2025-09-02 17:53:06.854577+00
287	1115	2025-09-03 02:50:36	88	NORMAL	[]	2025-09-02 17:53:06.854924+00
288	1115	2025-09-03 02:50:29	92	NORMAL	[]	2025-09-02 17:53:06.855167+00
289	1115	2025-09-03 02:50:58	91	NORMAL	[]	2025-09-02 17:53:06.867936+00
290	1115	2025-09-03 02:51:08	91	NORMAL	[]	2025-09-02 17:53:06.869011+00
291	1115	2025-09-03 02:51:15	90	NORMAL	[]	2025-09-02 17:53:06.87905+00
292	1115	2025-09-03 02:51:23	90	NORMAL	[]	2025-09-02 17:53:06.879274+00
293	1115	2025-09-03 02:51:30	89	NORMAL	[]	2025-09-02 17:53:06.879706+00
294	1115	2025-09-03 02:51:37	89	NORMAL	[]	2025-09-02 17:53:06.903115+00
295	1115	2025-09-03 02:51:43	88	NORMAL	[]	2025-09-02 17:53:07.000939+00
296	1115	2025-09-03 02:51:51	89	NORMAL	[]	2025-09-02 17:53:07.001204+00
297	1115	2025-09-03 02:52:03	87	NORMAL	[]	2025-09-02 17:53:07.001316+00
298	1115	2025-09-03 02:52:12	88	NORMAL	[]	2025-09-02 17:53:07.002291+00
299	1115	2025-09-03 02:51:57	90	NORMAL	[]	2025-09-02 17:53:07.003469+00
300	1115	2025-09-03 02:53:05	91	NORMAL	[]	2025-09-02 17:53:07.013179+00
301	1115	2025-09-03 02:52:35	95	NORMAL	[]	2025-09-02 17:53:07.013247+00
302	1115	2025-09-03 02:52:25	94	NORMAL	[]	2025-09-02 17:53:07.033456+00
303	1115	2025-09-03 02:52:49	90	NORMAL	[]	2025-09-02 17:53:07.034594+00
304	1115	2025-09-03 02:52:19	91	NORMAL	[]	2025-09-02 17:53:07.034422+00
305	1115	2025-09-03 02:52:57	91	NORMAL	[]	2025-09-02 17:53:07.034601+00
306	1115	2025-09-03 02:53:10	90	NORMAL	[]	2025-09-02 17:53:21.606315+00
307	1115	2025-09-03 02:53:18	88	NORMAL	[]	2025-09-02 17:53:21.620719+00
308	1115	2025-09-03 02:53:25	84	NORMAL	[]	2025-09-02 17:53:23.587543+00
309	1115	2025-09-03 02:53:35	84	NORMAL	[]	2025-09-02 17:53:53.049842+00
310	1115	2025-09-03 02:53:41	88	NORMAL	[]	2025-09-02 17:53:53.065893+00
311	1115	2025-09-03 02:53:47	88	NORMAL	[]	2025-09-02 17:53:53.083594+00
312	1115	2025-09-03 02:53:54	92	NORMAL	[]	2025-09-02 17:53:53.117109+00
313	1115	2025-09-03 02:54:00	96	NORMAL	[]	2025-09-02 17:54:59.449688+00
314	1115	2025-09-03 02:54:10	94	NORMAL	[]	2025-09-02 17:54:59.575241+00
315	1115	2025-09-03 02:54:18	87	NORMAL	[]	2025-09-02 17:54:59.578252+00
316	1115	2025-09-03 02:54:24	91	NORMAL	[]	2025-09-02 17:54:59.578506+00
317	1115	2025-09-03 02:54:32	87	NORMAL	[]	2025-09-02 17:54:59.580045+00
318	1115	2025-09-03 02:54:43	89	NORMAL	[]	2025-09-02 17:54:59.581029+00
319	1115	2025-09-03 02:54:50	89	NORMAL	[]	2025-09-02 17:54:59.596857+00
320	1115	2025-09-03 02:55:07	91	NORMAL	[]	2025-09-02 17:55:13.545096+00
321	1115	2025-09-03 02:55:13	90	NORMAL	[]	2025-09-02 17:55:13.563192+00
322	1115	2025-09-03 02:55:19	91	NORMAL	[]	2025-09-02 17:55:20.529302+00
323	1115	2025-09-03 02:55:25	90	NORMAL	[]	2025-09-02 17:55:22.556156+00
324	1115	2025-09-03 02:55:31	88	NORMAL	[]	2025-09-02 17:55:47.792184+00
325	1115	2025-09-03 02:55:37	87	NORMAL	[]	2025-09-02 17:55:47.809794+00
326	1115	2025-09-03 02:55:43	84	NORMAL	[]	2025-09-02 17:55:47.811544+00
327	1115	2025-09-03 02:55:49	82	NORMAL	[]	2025-09-02 17:55:47.812297+00
328	1115	2025-09-03 02:55:56	84	NORMAL	[]	2025-09-02 17:56:22.165806+00
329	1115	2025-09-03 02:56:02	84	NORMAL	[]	2025-09-02 17:56:22.182934+00
330	1115	2025-09-03 02:56:08	89	NORMAL	[]	2025-09-02 17:56:22.183932+00
331	1115	2025-09-03 02:56:15	91	NORMAL	[]	2025-09-02 17:56:22.184207+00
332	1115	2025-09-03 02:56:21	90	NORMAL	[]	2025-09-02 17:56:22.200027+00
333	1115	2025-09-03 04:04:06	84	NORMAL	[]	2025-09-02 19:04:04.403135+00
334	1115	2025-09-03 04:04:11	91	NORMAL	[]	2025-09-02 19:04:09.400921+00
335	1115	2025-09-03 04:04:16	100	NORMAL	[]	2025-09-02 19:04:14.45651+00
336	1115	2025-09-03 04:04:24	114	WARN	["high_hr"]	2025-09-02 19:04:22.432933+00
337	1115	2025-09-03 04:04:32	120	ALERT	["rapid_rise", "high_hr"]	2025-09-02 19:04:30.4592+00
338	1115	2025-09-03 04:04:42	118	ALERT	["rapid_rise", "high_hr"]	2025-09-02 19:04:49.559381+00
339	1115	2025-09-03 04:04:48	110	NORMAL	[]	2025-09-02 19:04:49.584274+00
340	1115	2025-09-03 04:04:53	98	NORMAL	[]	2025-09-02 19:04:51.474545+00
341	1115	2025-09-03 04:05:00	95	NORMAL	[]	2025-09-02 19:05:54.597396+00
342	1115	2025-09-03 04:05:10	95	NORMAL	[]	2025-09-02 19:05:54.618809+00
343	1115	2025-09-03 04:05:36	92	NORMAL	[]	2025-09-02 19:05:54.620691+00
344	1115	2025-09-03 04:05:17	94	NORMAL	[]	2025-09-02 19:05:54.620494+00
345	1115	2025-09-03 04:05:24	95	NORMAL	[]	2025-09-02 19:05:54.622117+00
349	1115	2025-09-03 04:05:30	95	NORMAL	[]	2025-09-02 19:05:54.643942+00
354	1115	2025-09-03 04:06:34	87	NORMAL	[]	2025-09-02 19:07:20.885028+00
360	1115	2025-09-03 04:07:19	87	NORMAL	[]	2025-09-02 19:07:20.897156+00
364	1115	2025-09-03 04:07:55	89	NORMAL	[]	2025-09-02 19:08:37.850251+00
372	1115	2025-09-03 04:08:58	90	NORMAL	[]	2025-09-02 19:08:58.850161+00
375	1115	2025-09-03 04:09:25	83	NORMAL	[]	2025-09-02 19:10:21.348781+00
346	1115	2025-09-03 04:05:42	91	NORMAL	[]	2025-09-02 19:05:54.622548+00
347	1115	2025-09-03 04:05:48	88	NORMAL	[]	2025-09-02 19:05:54.629397+00
356	1115	2025-09-03 04:06:41	87	NORMAL	[]	2025-09-02 19:07:20.885245+00
358	1115	2025-09-03 04:07:02	89	NORMAL	[]	2025-09-02 19:07:20.896827+00
362	1115	2025-09-03 04:07:43	86	NORMAL	[]	2025-09-02 19:07:41.736641+00
365	1115	2025-09-03 04:08:20	86	NORMAL	[]	2025-09-02 19:08:37.853508+00
371	1115	2025-09-03 04:08:53	93	NORMAL	[]	2025-09-02 19:08:51.823062+00
377	1115	2025-09-03 04:09:34	84	NORMAL	[]	2025-09-02 19:10:21.349666+00
380	1115	2025-09-03 04:09:59	86	NORMAL	[]	2025-09-02 19:10:21.359678+00
383	1115	2025-09-03 04:10:13	86	NORMAL	[]	2025-09-02 19:10:21.367132+00
388	1115	2025-09-03 04:10:47	90	NORMAL	[]	2025-09-02 19:10:49.507343+00
399	1115	2025-09-03 04:12:17	87	NORMAL	[]	2025-09-02 19:12:14.997801+00
404	1115	2025-09-03 04:12:50	96	NORMAL	[]	2025-09-02 19:12:49.066411+00
409	1115	2025-09-03 04:13:21	88	NORMAL	[]	2025-09-02 19:13:20.108445+00
414	1115	2025-09-03 04:13:54	85	NORMAL	[]	2025-09-02 19:13:52.126018+00
348	1115	2025-09-03 04:05:54	87	NORMAL	[]	2025-09-02 19:05:54.637212+00
351	1115	2025-09-03 04:06:08	88	NORMAL	[]	2025-09-02 19:07:20.828487+00
359	1115	2025-09-03 04:07:09	87	NORMAL	[]	2025-09-02 19:07:20.897062+00
361	1115	2025-09-03 04:07:25	85	NORMAL	[]	2025-09-02 19:07:37.714404+00
367	1115	2025-09-03 04:08:04	87	NORMAL	[]	2025-09-02 19:08:37.853705+00
373	1115	2025-09-03 04:09:04	90	NORMAL	[]	2025-09-02 19:09:02.84521+00
379	1115	2025-09-03 04:09:18	84	NORMAL	[]	2025-09-02 19:10:21.349675+00
381	1115	2025-09-03 04:09:46	86	NORMAL	[]	2025-09-02 19:10:21.359731+00
392	1115	2025-09-03 04:11:16	96	NORMAL	[]	2025-09-02 19:11:48.884335+00
393	1115	2025-09-03 04:11:24	94	NORMAL	[]	2025-09-02 19:11:48.898578+00
397	1115	2025-09-03 04:11:59	88	NORMAL	[]	2025-09-02 19:11:57.911455+00
402	1115	2025-09-03 04:12:36	96	NORMAL	[]	2025-09-02 19:12:34.061091+00
407	1115	2025-09-03 04:13:11	93	NORMAL	[]	2025-09-02 19:13:10.09923+00
412	1115	2025-09-03 04:13:40	88	NORMAL	[]	2025-09-02 19:13:38.131172+00
417	1115	2025-09-03 04:14:12	93	NORMAL	[]	2025-09-02 19:14:10.161585+00
350	1115	2025-09-03 04:06:01	86	NORMAL	[]	2025-09-02 19:05:59.574093+00
352	1115	2025-09-03 04:06:18	87	NORMAL	[]	2025-09-02 19:07:20.865533+00
353	1115	2025-09-03 04:06:25	88	NORMAL	[]	2025-09-02 19:07:20.882345+00
355	1115	2025-09-03 04:06:53	85	NORMAL	[]	2025-09-02 19:07:20.8851+00
357	1115	2025-09-03 04:06:47	85	NORMAL	[]	2025-09-02 19:07:20.88569+00
363	1115	2025-09-03 04:07:48	91	NORMAL	[]	2025-09-02 19:08:37.830861+00
366	1115	2025-09-03 04:08:38	88	NORMAL	[]	2025-09-02 19:08:37.853584+00
368	1115	2025-09-03 04:08:11	86	NORMAL	[]	2025-09-02 19:08:37.853857+00
369	1115	2025-09-03 04:08:43	90	NORMAL	[]	2025-09-02 19:08:41.803388+00
370	1115	2025-09-03 04:08:48	92	NORMAL	[]	2025-09-02 19:08:46.852241+00
374	1115	2025-09-03 04:09:09	85	NORMAL	[]	2025-09-02 19:10:21.315451+00
376	1115	2025-09-03 04:09:52	88	NORMAL	[]	2025-09-02 19:10:21.349281+00
378	1115	2025-09-03 04:09:40	84	NORMAL	[]	2025-09-02 19:10:21.349669+00
382	1115	2025-09-03 04:10:06	87	NORMAL	[]	2025-09-02 19:10:21.365954+00
384	1115	2025-09-03 04:10:23	87	NORMAL	[]	2025-09-02 19:10:22.214419+00
385	1115	2025-09-03 04:10:28	89	NORMAL	[]	2025-09-02 19:10:27.231417+00
386	1115	2025-09-03 04:10:35	93	NORMAL	[]	2025-09-02 19:10:49.487006+00
387	1115	2025-09-03 04:10:41	91	NORMAL	[]	2025-09-02 19:10:49.507137+00
389	1115	2025-09-03 04:10:56	92	NORMAL	[]	2025-09-02 19:10:54.469068+00
390	1115	2025-09-03 04:11:04	93	NORMAL	[]	2025-09-02 19:11:02.513506+00
391	1115	2025-09-03 04:11:10	97	NORMAL	[]	2025-09-02 19:11:08.497874+00
394	1115	2025-09-03 04:11:31	94	NORMAL	[]	2025-09-02 19:11:48.900075+00
395	1115	2025-09-03 04:11:38	90	NORMAL	[]	2025-09-02 19:11:48.900314+00
396	1115	2025-09-03 04:11:52	91	NORMAL	[]	2025-09-02 19:11:50.879569+00
398	1115	2025-09-03 04:12:06	89	NORMAL	[]	2025-09-02 19:12:12.944718+00
400	1115	2025-09-03 04:12:23	90	NORMAL	[]	2025-09-02 19:12:27.0108+00
401	1115	2025-09-03 04:12:29	94	NORMAL	[]	2025-09-02 19:12:27.029066+00
403	1115	2025-09-03 04:12:42	97	NORMAL	[]	2025-09-02 19:12:41.074937+00
405	1115	2025-09-03 04:13:00	91	NORMAL	[]	2025-09-02 19:12:59.084439+00
406	1115	2025-09-03 04:13:06	94	NORMAL	[]	2025-09-02 19:13:05.088366+00
408	1115	2025-09-03 04:13:16	87	NORMAL	[]	2025-09-02 19:13:15.078343+00
410	1115	2025-09-03 04:13:30	90	NORMAL	[]	2025-09-02 19:13:28.162062+00
411	1115	2025-09-03 04:13:35	91	NORMAL	[]	2025-09-02 19:13:33.122138+00
413	1115	2025-09-03 04:13:46	87	NORMAL	[]	2025-09-02 19:13:44.191404+00
415	1115	2025-09-03 04:13:59	90	NORMAL	[]	2025-09-02 19:13:57.147533+00
416	1115	2025-09-03 04:14:04	92	NORMAL	[]	2025-09-02 19:14:02.175445+00
418	1115	2025-09-03 04:14:17	92	NORMAL	[]	2025-09-02 19:14:58.657223+00
419	1115	2025-09-03 04:14:29	92	NORMAL	[]	2025-09-02 19:14:58.67783+00
420	1115	2025-09-03 04:14:42	89	NORMAL	[]	2025-09-02 19:14:58.678566+00
421	1115	2025-09-03 04:14:57	87	NORMAL	[]	2025-09-02 19:14:58.678683+00
422	1115	2025-09-03 04:14:50	86	NORMAL	[]	2025-09-02 19:14:58.679041+00
423	1115	2025-09-03 04:15:03	89	NORMAL	[]	2025-09-02 19:16:42.654857+00
424	1115	2025-09-03 04:15:15	92	NORMAL	[]	2025-09-02 19:16:42.677746+00
425	1115	2025-09-03 04:15:50	90	NORMAL	[]	2025-09-02 19:16:42.685085+00
426	1115	2025-09-03 04:15:41	91	NORMAL	[]	2025-09-02 19:16:42.685267+00
427	1115	2025-09-03 04:15:57	91	NORMAL	[]	2025-09-02 19:16:42.685352+00
428	1115	2025-09-03 04:15:32	92	NORMAL	[]	2025-09-02 19:16:42.685423+00
429	1115	2025-09-03 04:16:24	93	NORMAL	[]	2025-09-02 19:16:42.695787+00
430	1115	2025-09-03 04:16:03	92	NORMAL	[]	2025-09-02 19:16:42.696524+00
431	1115	2025-09-03 04:16:31	92	NORMAL	[]	2025-09-02 19:16:42.696699+00
432	1115	2025-09-03 04:16:09	96	NORMAL	[]	2025-09-02 19:16:42.697334+00
433	1115	2025-09-03 04:16:37	94	NORMAL	[]	2025-09-02 19:16:42.698278+00
434	1115	2025-09-03 04:16:43	94	NORMAL	[]	2025-09-02 19:16:42.698349+00
435	1115	2025-09-03 04:15:25	94	NORMAL	[]	2025-09-02 19:16:42.700665+00
436	1115	2025-09-03 04:16:15	95	NORMAL	[]	2025-09-02 19:16:42.714483+00
437	1115	2025-09-03 04:16:50	94	NORMAL	[]	2025-09-02 19:16:54.616796+00
438	1115	2025-09-03 04:17:02	96	NORMAL	[]	2025-09-02 19:17:44.054388+00
439	1115	2025-09-03 04:17:10	100	NORMAL	[]	2025-09-02 19:17:44.076087+00
440	1115	2025-09-03 04:17:16	92	NORMAL	[]	2025-09-02 19:17:44.078428+00
441	1115	2025-09-03 04:17:28	86	NORMAL	[]	2025-09-02 19:17:44.078641+00
442	1115	2025-09-03 04:17:22	93	NORMAL	[]	2025-09-02 19:17:44.078948+00
443	1115	2025-09-03 04:17:40	82	NORMAL	[]	2025-09-02 19:17:44.079104+00
444	1115	2025-09-03 04:17:46	85	NORMAL	[]	2025-09-02 19:17:45.047825+00
445	1115	2025-09-03 04:17:54	87	NORMAL	[]	2025-09-02 19:20:02.463937+00
446	1115	2025-09-03 04:18:00	87	NORMAL	[]	2025-09-02 19:20:02.485463+00
447	1115	2025-09-03 04:18:08	86	NORMAL	[]	2025-09-02 19:20:02.492069+00
448	1115	2025-09-03 04:18:55	91	NORMAL	[]	2025-09-02 19:20:02.492658+00
449	1115	2025-09-03 04:18:49	91	NORMAL	[]	2025-09-02 19:20:02.493887+00
450	1115	2025-09-03 04:18:15	88	NORMAL	[]	2025-09-02 19:20:02.493872+00
451	1115	2025-09-03 04:19:10	89	NORMAL	[]	2025-09-02 19:20:02.524133+00
452	1115	2025-09-03 04:18:34	91	NORMAL	[]	2025-09-02 19:20:02.525167+00
453	1115	2025-09-03 04:19:24	91	NORMAL	[]	2025-09-02 19:20:02.52554+00
454	1115	2025-09-03 04:19:17	89	NORMAL	[]	2025-09-02 19:20:02.525709+00
455	1115	2025-09-03 04:19:01	89	NORMAL	[]	2025-09-02 19:20:02.525834+00
456	1115	2025-09-03 04:18:43	89	NORMAL	[]	2025-09-02 19:20:02.525952+00
457	1115	2025-09-03 04:19:31	91	NORMAL	[]	2025-09-02 19:20:02.540813+00
458	1115	2025-09-03 04:19:39	90	NORMAL	[]	2025-09-02 19:20:02.541026+00
459	1115	2025-09-03 04:19:45	91	NORMAL	[]	2025-09-02 19:20:02.541535+00
460	1115	2025-09-03 04:19:53	93	NORMAL	[]	2025-09-02 19:20:02.542148+00
461	1115	2025-09-03 04:19:59	97	NORMAL	[]	2025-09-02 19:20:02.542501+00
462	1115	2025-09-03 04:20:06	95	NORMAL	[]	2025-09-02 19:20:03.348747+00
463	1115	2025-09-03 04:20:11	89	NORMAL	[]	2025-09-02 19:20:42.654035+00
464	1115	2025-09-03 04:20:20	87	NORMAL	[]	2025-09-02 19:20:42.672611+00
465	1115	2025-09-03 04:20:27	87	NORMAL	[]	2025-09-02 19:20:42.677309+00
466	1115	2025-09-03 04:20:41	93	NORMAL	[]	2025-09-02 19:20:42.680417+00
467	1115	2025-09-03 04:20:33	90	NORMAL	[]	2025-09-02 19:20:42.680562+00
468	1115	2025-09-03 04:20:47	85	NORMAL	[]	2025-09-02 19:20:46.669944+00
469	1115	2025-09-03 04:20:53	87	NORMAL	[]	2025-09-02 19:21:27.272563+00
470	1115	2025-09-03 04:21:02	89	NORMAL	[]	2025-09-02 19:21:27.391005+00
471	1115	2025-09-03 04:21:12	91	NORMAL	[]	2025-09-02 19:21:27.393469+00
472	1115	2025-09-03 04:21:21	90	NORMAL	[]	2025-09-02 19:21:27.394169+00
473	1115	2025-09-03 04:21:29	88	NORMAL	[]	2025-09-02 19:21:28.028521+00
474	1115	2025-09-03 04:21:41	88	NORMAL	[]	2025-09-02 19:22:22.582213+00
475	1115	2025-09-03 04:21:47	91	NORMAL	[]	2025-09-02 19:22:22.597166+00
476	1115	2025-09-03 04:21:57	91	NORMAL	[]	2025-09-02 19:22:22.611721+00
477	1115	2025-09-03 04:22:21	92	NORMAL	[]	2025-09-02 19:22:22.614614+00
478	1115	2025-09-03 04:22:06	91	NORMAL	[]	2025-09-02 19:22:22.614785+00
479	1115	2025-09-03 04:22:12	92	NORMAL	[]	2025-09-02 19:22:22.616433+00
480	1115	2025-09-03 04:22:30	94	NORMAL	[]	2025-09-02 19:22:55.836298+00
481	1115	2025-09-03 04:22:40	94	NORMAL	[]	2025-09-02 19:22:55.920759+00
482	1115	2025-09-03 04:22:47	95	NORMAL	[]	2025-09-02 19:22:55.922272+00
483	1115	2025-09-03 04:22:54	99	NORMAL	[]	2025-09-02 19:22:55.922422+00
484	1115	2025-09-03 04:23:02	95	NORMAL	[]	2025-09-02 19:22:58.756928+00
485	1115	2025-09-03 04:23:07	98	NORMAL	[]	2025-09-02 19:23:44.246995+00
486	1115	2025-09-03 04:23:15	100	NORMAL	[]	2025-09-02 19:23:44.274312+00
487	1115	2025-09-03 04:23:22	103	NORMAL	[]	2025-09-02 19:23:44.280723+00
488	1115	2025-09-03 04:23:29	106	NORMAL	[]	2025-09-02 19:23:44.281334+00
489	1115	2025-09-03 04:23:43	107	NORMAL	[]	2025-09-02 19:23:44.281139+00
494	1115	2025-09-03 04:24:14	99	NORMAL	[]	2025-09-02 19:26:14.754504+00
505	1115	2025-09-03 04:25:22	90	NORMAL	[]	2025-09-02 19:26:14.785446+00
490	1115	2025-09-03 04:23:36	103	NORMAL	[]	2025-09-02 19:23:44.281364+00
491	1115	2025-09-03 04:23:54	108	NORMAL	[]	2025-09-02 19:26:14.723183+00
493	1115	2025-09-03 04:24:08	103	NORMAL	[]	2025-09-02 19:26:14.755144+00
499	1115	2025-09-03 04:25:10	93	NORMAL	[]	2025-09-02 19:26:14.765876+00
504	1115	2025-09-03 04:25:55	93	NORMAL	[]	2025-09-02 19:26:14.773881+00
508	1115	2025-09-03 04:24:57	88	NORMAL	[]	2025-09-02 19:26:14.788645+00
492	1115	2025-09-03 04:24:01	104	NORMAL	[]	2025-09-02 19:26:14.739123+00
496	1115	2025-09-03 04:24:51	89	NORMAL	[]	2025-09-02 19:26:14.758529+00
503	1115	2025-09-03 04:26:14	88	NORMAL	[]	2025-09-02 19:26:14.77063+00
495	1115	2025-09-03 04:24:35	90	NORMAL	[]	2025-09-02 19:26:14.75737+00
509	1115	2025-09-03 04:26:01	92	NORMAL	[]	2025-09-02 19:26:14.796875+00
497	1115	2025-09-03 04:24:21	96	NORMAL	[]	2025-09-02 19:26:14.759062+00
498	1115	2025-09-03 04:25:03	90	NORMAL	[]	2025-09-02 19:26:14.76573+00
500	1115	2025-09-03 04:25:38	92	NORMAL	[]	2025-09-02 19:26:14.766597+00
501	1115	2025-09-03 04:26:07	92	NORMAL	[]	2025-09-02 19:26:14.770269+00
502	1115	2025-09-03 04:24:27	91	NORMAL	[]	2025-09-02 19:26:14.770623+00
506	1115	2025-09-03 04:25:16	90	NORMAL	[]	2025-09-02 19:26:14.787972+00
507	1115	2025-09-03 04:25:28	90	NORMAL	[]	2025-09-02 19:26:14.788475+00
510	1115	2025-09-03 04:26:20	89	NORMAL	[]	2025-09-02 19:26:18.711672+00
511	1115	2025-09-03 04:26:26	88	NORMAL	[]	2025-09-02 19:26:32.746659+00
512	1115	2025-09-03 04:26:32	86	NORMAL	[]	2025-09-02 19:26:32.763024+00
513	1115	2025-09-03 04:26:38	89	NORMAL	[]	2025-09-02 19:26:36.781776+00
514	1115	2025-09-03 04:26:44	93	NORMAL	[]	2025-09-02 19:28:07.70029+00
515	1115	2025-09-03 04:26:50	97	NORMAL	[]	2025-09-02 19:28:07.86044+00
516	1115	2025-09-03 04:26:56	93	NORMAL	[]	2025-09-02 19:28:07.86625+00
517	1115	2025-09-03 04:27:04	93	NORMAL	[]	2025-09-02 19:28:07.865958+00
518	1115	2025-09-03 04:27:10	95	NORMAL	[]	2025-09-02 19:28:07.867388+00
519	1115	2025-09-03 04:27:37	89	NORMAL	[]	2025-09-02 19:28:07.867445+00
520	1115	2025-09-03 04:28:05	93	NORMAL	[]	2025-09-02 19:28:07.874589+00
521	1115	2025-09-03 04:27:16	91	NORMAL	[]	2025-09-02 19:28:07.894509+00
522	1115	2025-09-03 04:27:47	90	NORMAL	[]	2025-09-02 19:28:07.895893+00
523	1115	2025-09-03 04:27:58	91	NORMAL	[]	2025-09-02 19:28:07.896147+00
524	1115	2025-09-03 04:27:29	89	NORMAL	[]	2025-09-02 19:28:07.897242+00
525	1115	2025-09-03 04:28:15	96	NORMAL	[]	2025-09-02 19:28:13.613411+00
526	1115	2025-09-03 04:28:20	95	NORMAL	[]	2025-09-02 19:28:18.628633+00
527	1115	2025-09-03 04:28:25	95	NORMAL	[]	2025-09-02 19:28:23.622729+00
528	1115	2025-09-03 04:28:30	95	NORMAL	[]	2025-09-02 19:28:28.664812+00
529	1115	2025-09-03 04:28:35	93	NORMAL	[]	2025-09-02 19:28:33.698234+00
530	1115	2025-09-03 04:28:46	92	NORMAL	[]	2025-09-02 19:30:11.50942+00
531	1115	2025-09-03 04:28:54	89	NORMAL	[]	2025-09-02 19:30:11.531322+00
532	1115	2025-09-03 04:29:21	90	NORMAL	[]	2025-09-02 19:30:11.540161+00
533	1115	2025-09-03 04:29:27	91	NORMAL	[]	2025-09-02 19:30:11.540296+00
534	1115	2025-09-03 04:29:40	94	NORMAL	[]	2025-09-02 19:30:11.540959+00
535	1115	2025-09-03 04:29:14	91	NORMAL	[]	2025-09-02 19:30:11.541736+00
536	1115	2025-09-03 04:29:59	92	NORMAL	[]	2025-09-02 19:30:11.550756+00
537	1115	2025-09-03 04:30:05	88	NORMAL	[]	2025-09-02 19:30:11.560604+00
538	1115	2025-09-03 04:29:05	89	NORMAL	[]	2025-09-02 19:30:11.560725+00
539	1115	2025-09-03 04:29:50	93	NORMAL	[]	2025-09-02 19:30:11.561126+00
540	1115	2025-09-03 04:29:34	93	NORMAL	[]	2025-09-02 19:30:11.561236+00
541	1115	2025-09-03 04:30:13	96	NORMAL	[]	2025-09-02 19:30:11.561319+00
542	1115	2025-09-03 04:30:22	95	NORMAL	[]	2025-09-02 19:30:44.766971+00
543	1115	2025-09-03 04:30:29	94	NORMAL	[]	2025-09-02 19:30:44.783848+00
544	1115	2025-09-03 04:30:40	93	NORMAL	[]	2025-09-02 19:30:44.784438+00
545	1115	2025-09-03 04:30:52	95	NORMAL	[]	2025-09-02 19:31:45.347259+00
546	1115	2025-09-03 04:31:00	98	NORMAL	[]	2025-09-02 19:31:45.368286+00
547	1115	2025-09-03 04:31:13	93	NORMAL	[]	2025-09-02 19:31:45.372927+00
548	1115	2025-09-03 04:31:30	91	NORMAL	[]	2025-09-02 19:31:45.373073+00
549	1115	2025-09-03 04:31:21	89	NORMAL	[]	2025-09-02 19:31:45.373446+00
550	1115	2025-09-03 04:31:07	96	NORMAL	[]	2025-09-02 19:31:45.373689+00
551	1115	2025-09-03 04:31:43	90	NORMAL	[]	2025-09-02 19:31:45.391881+00
552	1115	2025-09-03 04:31:50	89	NORMAL	[]	2025-09-02 19:31:48.348202+00
553	1115	2025-09-03 04:31:58	87	NORMAL	[]	2025-09-02 19:34:58.078105+00
554	1115	2025-09-03 04:32:06	86	NORMAL	[]	2025-09-02 19:34:58.10058+00
555	1115	2025-09-03 04:32:12	92	NORMAL	[]	2025-09-02 19:34:58.108945+00
556	1115	2025-09-03 04:32:32	91	NORMAL	[]	2025-09-02 19:34:58.108976+00
557	1115	2025-09-03 04:32:23	91	NORMAL	[]	2025-09-02 19:34:58.109818+00
558	1115	2025-09-03 04:32:38	93	NORMAL	[]	2025-09-02 19:34:58.111478+00
559	1115	2025-09-03 04:33:13	95	NORMAL	[]	2025-09-02 19:34:58.118729+00
560	1115	2025-09-03 04:33:22	92	NORMAL	[]	2025-09-02 19:34:58.11881+00
561	1115	2025-09-03 04:33:28	87	NORMAL	[]	2025-09-02 19:34:58.134768+00
562	1115	2025-09-03 04:32:48	96	NORMAL	[]	2025-09-02 19:34:58.134842+00
563	1115	2025-09-03 04:32:56	98	NORMAL	[]	2025-09-02 19:34:58.135911+00
564	1115	2025-09-03 04:33:06	98	NORMAL	[]	2025-09-02 19:34:58.136131+00
565	1115	2025-09-03 04:33:36	85	NORMAL	[]	2025-09-02 19:34:58.16472+00
566	1115	2025-09-03 04:34:04	88	NORMAL	[]	2025-09-02 19:34:58.165296+00
567	1115	2025-09-03 04:33:53	87	NORMAL	[]	2025-09-02 19:34:58.165208+00
568	1115	2025-09-03 04:33:44	86	NORMAL	[]	2025-09-02 19:34:58.165406+00
569	1115	2025-09-03 04:34:24	89	NORMAL	[]	2025-09-02 19:34:58.165647+00
570	1115	2025-09-03 04:34:31	90	NORMAL	[]	2025-09-02 19:34:58.173665+00
571	1115	2025-09-03 04:34:12	87	NORMAL	[]	2025-09-02 19:34:58.194837+00
572	1115	2025-09-03 04:34:44	86	NORMAL	[]	2025-09-02 19:34:58.196263+00
573	1115	2025-09-03 04:34:55	86	NORMAL	[]	2025-09-02 19:34:58.196954+00
574	1115	2025-09-03 04:34:18	88	NORMAL	[]	2025-09-02 19:34:58.1971+00
575	1115	2025-09-03 04:35:01	87	NORMAL	[]	2025-09-02 19:34:58.967697+00
576	1115	2025-09-03 04:35:10	86	NORMAL	[]	2025-09-02 19:36:39.211676+00
577	1115	2025-09-03 04:35:16	88	NORMAL	[]	2025-09-02 19:36:39.348374+00
578	1115	2025-09-03 04:36:16	88	NORMAL	[]	2025-09-02 19:36:39.356316+00
579	1115	2025-09-03 04:35:42	90	NORMAL	[]	2025-09-02 19:36:39.356527+00
580	1115	2025-09-03 04:36:05	88	NORMAL	[]	2025-09-02 19:36:39.356434+00
581	1115	2025-09-03 04:35:31	90	NORMAL	[]	2025-09-02 19:36:39.358029+00
582	1115	2025-09-03 04:36:36	86	NORMAL	[]	2025-09-02 19:36:39.363431+00
583	1115	2025-09-03 04:35:48	88	NORMAL	[]	2025-09-02 19:36:39.365565+00
584	1115	2025-09-03 04:36:22	89	NORMAL	[]	2025-09-02 19:36:39.382764+00
585	1115	2025-09-03 04:36:28	89	NORMAL	[]	2025-09-02 19:36:39.382828+00
586	1115	2025-09-03 04:35:23	91	NORMAL	[]	2025-09-02 19:36:39.382917+00
587	1115	2025-09-03 04:35:56	89	NORMAL	[]	2025-09-02 19:36:39.382975+00
588	1115	2025-09-03 04:36:48	84	NORMAL	[]	2025-09-02 19:37:31.564738+00
589	1115	2025-09-03 04:36:56	87	NORMAL	[]	2025-09-02 19:37:31.580035+00
590	1115	2025-09-03 04:37:07	88	NORMAL	[]	2025-09-02 19:37:31.580976+00
591	1115	2025-09-03 04:37:13	85	NORMAL	[]	2025-09-02 19:37:31.595474+00
592	1115	2025-09-03 04:37:19	83	NORMAL	[]	2025-09-02 19:37:31.595705+00
593	1115	2025-09-03 04:37:31	89	NORMAL	[]	2025-09-02 19:37:31.597403+00
594	1115	2025-09-03 04:37:25	83	NORMAL	[]	2025-09-02 19:37:31.597331+00
595	1115	2025-09-03 04:37:36	89	NORMAL	[]	2025-09-02 19:37:33.506443+00
596	1115	2025-09-03 04:37:47	90	NORMAL	[]	2025-09-02 19:39:44.767605+00
597	1115	2025-09-03 04:38:09	86	NORMAL	[]	2025-09-02 19:39:44.801826+00
598	1115	2025-09-03 04:37:54	87	NORMAL	[]	2025-09-02 19:39:44.80188+00
599	1115	2025-09-03 04:38:33	87	NORMAL	[]	2025-09-02 19:39:44.80239+00
600	1115	2025-09-03 04:38:01	84	NORMAL	[]	2025-09-02 19:39:44.803179+00
601	1115	2025-09-03 04:38:18	88	NORMAL	[]	2025-09-02 19:39:44.804052+00
602	1115	2025-09-03 04:39:39	94	NORMAL	[]	2025-09-02 19:39:44.8115+00
603	1115	2025-09-03 04:38:49	88	NORMAL	[]	2025-09-02 19:39:44.811742+00
604	1115	2025-09-03 04:39:31	96	NORMAL	[]	2025-09-02 19:39:44.812066+00
605	1115	2025-09-03 04:39:24	92	NORMAL	[]	2025-09-02 19:39:44.812163+00
606	1115	2025-09-03 04:39:09	94	NORMAL	[]	2025-09-02 19:39:44.820039+00
607	1115	2025-09-03 04:38:25	89	NORMAL	[]	2025-09-02 19:39:44.821056+00
608	1115	2025-09-03 04:39:02	94	NORMAL	[]	2025-09-02 19:39:44.821204+00
609	1115	2025-09-03 04:38:43	86	NORMAL	[]	2025-09-02 19:39:44.821362+00
610	1115	2025-09-03 04:38:55	90	NORMAL	[]	2025-09-02 19:39:44.821678+00
611	1115	2025-09-03 04:39:46	88	NORMAL	[]	2025-09-02 19:39:45.726195+00
617	1115	2025-09-03 04:40:25	92	NORMAL	[]	2025-09-02 19:41:17.519952+00
618	1115	2025-09-03 04:41:00	84	NORMAL	[]	2025-09-02 19:41:17.527483+00
612	1115	2025-09-03 04:39:53	89	NORMAL	[]	2025-09-02 19:41:17.494081+00
613	1115	2025-09-03 04:39:59	89	NORMAL	[]	2025-09-02 19:41:17.511124+00
614	1115	2025-09-03 04:40:06	89	NORMAL	[]	2025-09-02 19:41:17.516609+00
615	1115	2025-09-03 04:40:12	90	NORMAL	[]	2025-09-02 19:41:17.518918+00
616	1115	2025-09-03 04:40:32	90	NORMAL	[]	2025-09-02 19:41:17.519491+00
619	1115	2025-09-03 04:40:19	93	NORMAL	[]	2025-09-02 19:41:17.529299+00
621	1115	2025-09-03 04:40:41	89	NORMAL	[]	2025-09-02 19:41:17.547813+00
623	1115	2025-09-03 04:41:08	82	NORMAL	[]	2025-09-02 19:41:17.547967+00
620	1115	2025-09-03 04:41:16	85	NORMAL	[]	2025-09-02 19:41:17.546871+00
622	1115	2025-09-03 04:40:49	85	NORMAL	[]	2025-09-02 19:41:17.547883+00
624	1115	2025-09-03 04:41:25	85	NORMAL	[]	2025-09-02 19:42:15.040123+00
625	1115	2025-09-03 04:41:32	87	NORMAL	[]	2025-09-02 19:42:15.058844+00
626	1115	2025-09-03 04:42:11	84	NORMAL	[]	2025-09-02 19:42:15.063921+00
627	1115	2025-09-03 04:42:04	89	NORMAL	[]	2025-09-02 19:42:15.065161+00
628	1115	2025-09-03 04:41:56	89	NORMAL	[]	2025-09-02 19:42:15.065006+00
629	1115	2025-09-03 04:41:39	87	NORMAL	[]	2025-09-02 19:42:15.065966+00
630	1115	2025-09-03 04:41:50	86	NORMAL	[]	2025-09-02 19:42:15.08129+00
631	1115	2025-09-03 04:42:22	85	NORMAL	[]	2025-09-02 19:43:48.734499+00
632	1115	2025-09-03 04:42:34	87	NORMAL	[]	2025-09-02 19:43:48.753081+00
633	1115	2025-09-03 04:42:49	86	NORMAL	[]	2025-09-02 19:43:48.756601+00
634	1115	2025-09-03 04:42:43	87	NORMAL	[]	2025-09-02 19:43:48.75785+00
635	1115	2025-09-03 04:42:55	89	NORMAL	[]	2025-09-02 19:43:48.758935+00
636	1115	2025-09-03 04:43:02	88	NORMAL	[]	2025-09-02 19:43:48.759784+00
637	1115	2025-09-03 04:43:16	94	NORMAL	[]	2025-09-02 19:43:48.772276+00
638	1115	2025-09-03 04:43:10	88	NORMAL	[]	2025-09-02 19:43:48.772428+00
639	1115	2025-09-03 04:43:23	90	NORMAL	[]	2025-09-02 19:43:48.772664+00
640	1115	2025-09-03 04:43:36	86	NORMAL	[]	2025-09-02 19:43:48.772666+00
641	1115	2025-09-03 04:43:30	84	NORMAL	[]	2025-09-02 19:43:48.772814+00
642	1115	2025-09-03 04:43:47	88	NORMAL	[]	2025-09-02 19:43:48.796973+00
643	1115	2025-09-03 04:43:52	88	NORMAL	[]	2025-09-02 19:43:50.629214+00
644	1115	2025-09-03 04:43:57	85	NORMAL	[]	2025-09-02 19:43:56.619365+00
645	1115	2025-09-03 04:44:04	87	NORMAL	[]	2025-09-02 19:44:00.673549+00
646	1115	2025-09-03 04:44:11	87	NORMAL	[]	2025-09-02 19:44:23.862816+00
647	1115	2025-09-03 04:44:19	86	NORMAL	[]	2025-09-02 19:44:23.881124+00
648	1115	2025-09-03 04:44:25	86	NORMAL	[]	2025-09-02 19:44:23.88186+00
649	1115	2025-09-03 04:44:30	87	NORMAL	[]	2025-09-02 19:44:27.878963+00
650	1115	2025-09-03 04:44:35	88	NORMAL	[]	2025-09-02 19:45:28.478581+00
651	1115	2025-09-03 04:45:00	86	NORMAL	[]	2025-09-02 19:45:28.497232+00
652	1115	2025-09-03 04:45:08	86	NORMAL	[]	2025-09-02 19:45:28.528359+00
653	1115	2025-09-03 04:44:47	85	NORMAL	[]	2025-09-02 19:45:28.528633+00
654	1115	2025-09-03 04:44:41	88	NORMAL	[]	2025-09-02 19:45:28.528737+00
655	1115	2025-09-03 04:45:26	87	NORMAL	[]	2025-09-02 19:45:28.529002+00
656	1115	2025-09-03 04:45:17	86	NORMAL	[]	2025-09-02 19:45:28.529245+00
657	1115	2025-09-03 04:45:33	90	NORMAL	[]	2025-09-02 19:45:31.463858+00
658	1115	2025-09-03 04:45:38	91	NORMAL	[]	2025-09-02 19:46:21.954794+00
659	1115	2025-09-03 04:45:44	86	NORMAL	[]	2025-09-02 19:46:21.979645+00
660	1115	2025-09-03 04:45:57	86	NORMAL	[]	2025-09-02 19:46:21.980739+00
661	1115	2025-09-03 04:46:08	86	NORMAL	[]	2025-09-02 19:46:21.98196+00
662	1115	2025-09-03 04:46:18	84	NORMAL	[]	2025-09-02 19:46:21.983343+00
663	1115	2025-09-03 04:46:24	85	NORMAL	[]	2025-09-02 19:46:22.85968+00
664	1115	2025-09-03 04:46:35	87	NORMAL	[]	2025-09-02 19:46:32.910292+00
665	1115	2025-09-03 04:46:42	87	NORMAL	[]	2025-09-02 19:46:39.897701+00
666	1115	2025-09-03 04:46:53	87	NORMAL	[]	2025-09-02 19:48:17.862183+00
667	1115	2025-09-03 04:46:59	87	NORMAL	[]	2025-09-02 19:48:17.88286+00
668	1115	2025-09-03 04:47:48	90	NORMAL	[]	2025-09-02 19:48:17.899876+00
669	1115	2025-09-03 04:47:26	84	NORMAL	[]	2025-09-02 19:48:17.899804+00
670	1115	2025-09-03 04:47:54	85	NORMAL	[]	2025-09-02 19:48:17.91216+00
671	1115	2025-09-03 04:47:33	91	NORMAL	[]	2025-09-02 19:48:17.913448+00
672	1115	2025-09-03 04:47:16	87	NORMAL	[]	2025-09-02 19:48:17.91369+00
673	1115	2025-09-03 04:47:07	88	NORMAL	[]	2025-09-02 19:48:17.913936+00
674	1115	2025-09-03 04:47:40	90	NORMAL	[]	2025-09-02 19:48:17.915458+00
675	1115	2025-09-03 04:48:07	85	NORMAL	[]	2025-09-02 19:48:17.920234+00
676	1115	2025-09-03 04:48:14	89	NORMAL	[]	2025-09-02 19:48:17.921007+00
677	1115	2025-09-03 04:48:00	82	NORMAL	[]	2025-09-02 19:48:17.92443+00
678	1115	2025-09-03 04:48:24	87	NORMAL	[]	2025-09-02 19:49:43.596159+00
679	1115	2025-09-03 04:48:30	87	NORMAL	[]	2025-09-02 19:49:43.725793+00
680	1115	2025-09-03 04:48:47	87	NORMAL	[]	2025-09-02 19:49:43.730825+00
681	1115	2025-09-03 04:48:41	88	NORMAL	[]	2025-09-02 19:49:43.730848+00
682	1115	2025-09-03 04:48:57	87	NORMAL	[]	2025-09-02 19:49:43.730954+00
683	1115	2025-09-03 04:49:13	87	NORMAL	[]	2025-09-02 19:49:43.731702+00
684	1115	2025-09-03 04:49:26	84	NORMAL	[]	2025-09-02 19:49:43.744857+00
685	1115	2025-09-03 04:49:19	87	NORMAL	[]	2025-09-02 19:49:43.745+00
686	1115	2025-09-03 04:49:32	85	NORMAL	[]	2025-09-02 19:49:43.745184+00
687	1115	2025-09-03 04:49:46	86	NORMAL	[]	2025-09-02 19:49:44.592834+00
688	1115	2025-09-03 04:49:51	89	NORMAL	[]	2025-09-02 19:49:49.595063+00
689	1115	2025-09-03 04:49:56	98	NORMAL	[]	2025-09-02 19:49:54.583783+00
690	1115	2025-09-03 04:50:01	107	NORMAL	[]	2025-09-02 19:49:59.65507+00
691	1115	2025-09-03 04:50:06	113	NORMAL	[]	2025-09-02 19:50:04.605587+00
692	1115	2025-09-03 04:50:16	123	WARN	["rapid_rise"]	2025-09-02 19:50:14.649659+00
693	1115	2025-09-03 04:50:21	129	WARN	["rapid_rise"]	2025-09-02 19:50:19.625051+00
694	1115	2025-09-03 04:50:26	136	WARN	["rapid_rise"]	2025-09-02 19:50:24.648247+00
695	1115	2025-09-03 04:50:32	138	WARN	["rapid_rise"]	2025-09-02 19:51:15.023857+00
696	1115	2025-09-03 04:50:40	137	WARN	["rapid_rise"]	2025-09-02 19:51:15.045091+00
697	1115	2025-09-03 04:50:46	122	WARN	["rapid_rise"]	2025-09-02 19:51:15.048887+00
698	1115	2025-09-03 04:50:52	92	NORMAL	[]	2025-09-02 19:51:15.049189+00
699	1115	2025-09-03 04:51:07	85	NORMAL	[]	2025-09-02 19:51:15.049429+00
700	1115	2025-09-03 04:51:00	89	NORMAL	[]	2025-09-02 19:51:15.049587+00
701	1115	2025-09-03 04:51:14	89	NORMAL	[]	2025-09-02 19:51:15.068788+00
702	1115	2025-09-03 04:51:20	94	NORMAL	[]	2025-09-02 19:51:18.032905+00
703	1115	2025-09-03 04:51:25	93	NORMAL	[]	2025-09-02 19:51:23.0274+00
704	1115	2025-09-03 04:51:32	90	NORMAL	[]	2025-09-02 19:51:30.050082+00
705	1115	2025-09-03 04:51:39	88	NORMAL	[]	2025-09-02 19:51:37.056115+00
706	1115	2025-09-03 04:51:49	89	NORMAL	[]	2025-09-02 19:51:47.068679+00
707	1115	2025-09-03 04:51:56	90	NORMAL	[]	2025-09-02 19:51:54.071792+00
708	1115	2025-09-03 04:52:05	87	NORMAL	[]	2025-09-02 19:52:03.099575+00
709	1115	2025-09-03 04:52:10	83	NORMAL	[]	2025-09-02 19:52:08.081051+00
710	1115	2025-09-03 04:52:17	83	NORMAL	[]	2025-09-02 19:52:42.406474+00
711	1115	2025-09-03 04:52:23	88	NORMAL	[]	2025-09-02 19:52:42.427524+00
712	1115	2025-09-03 04:52:30	89	NORMAL	[]	2025-09-02 19:52:42.429311+00
713	1115	2025-09-03 04:52:39	91	NORMAL	[]	2025-09-02 19:52:42.442756+00
714	1115	2025-09-03 04:52:50	90	NORMAL	[]	2025-09-02 19:52:48.378177+00
715	1115	2025-09-03 04:52:55	89	NORMAL	[]	2025-09-02 19:53:00.443131+00
716	1115	2025-09-03 04:53:03	85	NORMAL	[]	2025-09-02 19:53:00.458981+00
717	1115	2025-09-03 04:53:10	87	NORMAL	[]	2025-09-02 19:53:21.57629+00
718	1115	2025-09-03 04:53:21	86	NORMAL	[]	2025-09-02 19:53:21.599659+00
719	1115	2025-09-03 04:53:26	86	NORMAL	[]	2025-09-02 19:53:23.613508+00
720	1115	2025-09-03 04:53:43	89	NORMAL	[]	2025-09-02 19:54:16.993035+00
721	1115	2025-09-03 04:53:49	85	NORMAL	[]	2025-09-02 19:54:17.019337+00
722	1115	2025-09-03 04:54:01	83	NORMAL	[]	2025-09-02 19:54:17.022257+00
723	1115	2025-09-03 04:53:55	82	NORMAL	[]	2025-09-02 19:54:17.023129+00
724	1115	2025-09-03 04:54:07	83	NORMAL	[]	2025-09-02 19:54:17.023264+00
725	1115	2025-09-03 04:54:15	87	NORMAL	[]	2025-09-02 19:54:17.023891+00
726	1115	2025-09-03 04:54:26	88	NORMAL	[]	2025-09-02 19:54:23.967964+00
727	1115	2025-09-03 04:54:31	89	NORMAL	[]	2025-09-02 19:54:58.244351+00
728	1115	2025-09-03 04:54:45	89	NORMAL	[]	2025-09-02 19:54:58.322359+00
731	1115	2025-09-03 04:55:06	91	NORMAL	[]	2025-09-02 19:56:26.247547+00
737	1115	2025-09-03 04:55:50	90	NORMAL	[]	2025-09-02 19:56:26.301394+00
729	1115	2025-09-03 04:54:37	89	NORMAL	[]	2025-09-02 19:54:58.322433+00
735	1115	2025-09-03 04:55:20	88	NORMAL	[]	2025-09-02 19:56:26.285604+00
738	1115	2025-09-03 04:56:03	94	NORMAL	[]	2025-09-02 19:56:26.301504+00
730	1115	2025-09-03 04:54:57	89	NORMAL	[]	2025-09-02 19:54:58.322522+00
736	1115	2025-09-03 04:55:41	85	NORMAL	[]	2025-09-02 19:56:26.28613+00
741	1115	2025-09-03 04:56:09	92	NORMAL	[]	2025-09-02 19:56:26.30213+00
743	1115	2025-09-03 04:56:31	83	NORMAL	[]	2025-09-02 19:56:29.068611+00
732	1115	2025-09-03 04:55:12	90	NORMAL	[]	2025-09-02 19:56:26.279251+00
733	1115	2025-09-03 04:55:33	84	NORMAL	[]	2025-09-02 19:56:26.28543+00
739	1115	2025-09-03 04:55:56	93	NORMAL	[]	2025-09-02 19:56:26.301595+00
742	1115	2025-09-03 04:56:24	85	NORMAL	[]	2025-09-02 19:56:26.331309+00
734	1115	2025-09-03 04:55:26	84	NORMAL	[]	2025-09-02 19:56:26.285809+00
740	1115	2025-09-03 04:56:18	88	NORMAL	[]	2025-09-02 19:56:26.301793+00
744	1115	2025-09-03 04:56:40	83	NORMAL	[]	2025-09-02 19:56:38.102365+00
745	1115	2025-09-03 04:56:45	83	NORMAL	[]	2025-09-02 19:56:46.130272+00
746	1115	2025-09-03 15:13:38	79	NORMAL	[]	2025-09-02 21:13:56.414662+00
747	1115	2025-09-03 15:13:44	80	NORMAL	[]	2025-09-02 21:13:56.414874+00
748	1115	2025-09-03 15:13:55	83	NORMAL	[]	2025-09-02 21:15:03.048109+00
749	1115	2025-09-03 15:14:01	80	NORMAL	[]	2025-09-02 21:15:03.048661+00
750	1115	2025-09-03 15:14:08	80	NORMAL	[]	2025-09-02 21:15:03.049015+00
751	1115	2025-09-03 15:14:14	80	NORMAL	[]	2025-09-02 21:15:03.049728+00
752	1115	2025-09-03 15:14:25	84	NORMAL	[]	2025-09-02 21:15:03.049849+00
753	1115	2025-09-03 15:14:50	84	NORMAL	[]	2025-09-02 21:15:03.062725+00
754	1115	2025-09-03 15:14:38	86	NORMAL	[]	2025-09-02 21:15:03.064721+00
755	1115	2025-09-03 15:14:44	85	NORMAL	[]	2025-09-02 21:15:03.064967+00
756	1115	2025-09-03 15:14:32	89	NORMAL	[]	2025-09-02 21:15:03.06562+00
757	1115	2025-09-03 15:15:02	84	NORMAL	[]	2025-09-03 06:16:57.407853+00
758	1115	2025-09-03 15:15:12	84	NORMAL	[]	2025-09-03 06:16:57.54219+00
759	1115	2025-09-03 15:15:18	88	NORMAL	[]	2025-09-03 06:16:57.547281+00
760	1115	2025-09-03 15:15:51	90	NORMAL	[]	2025-09-03 06:16:57.547466+00
761	1115	2025-09-03 15:16:08	87	NORMAL	[]	2025-09-03 06:16:57.547698+00
762	1115	2025-09-03 15:16:30	87	NORMAL	[]	2025-09-03 06:16:57.547842+00
763	1115	2025-09-03 15:15:45	86	NORMAL	[]	2025-09-03 06:16:57.557808+00
764	1115	2025-09-03 15:16:21	88	NORMAL	[]	2025-09-03 06:16:57.558109+00
765	1115	2025-09-03 15:15:32	88	NORMAL	[]	2025-09-03 06:16:57.569379+00
766	1115	2025-09-03 15:16:02	91	NORMAL	[]	2025-09-03 06:16:57.570789+00
767	1115	2025-09-03 15:16:15	88	NORMAL	[]	2025-09-03 06:16:57.570845+00
768	1115	2025-09-03 15:15:24	89	NORMAL	[]	2025-09-03 06:16:57.570723+00
769	1115	2025-09-03 15:16:50	87	NORMAL	[]	2025-09-03 06:16:57.636962+00
770	1115	2025-09-03 15:16:40	85	NORMAL	[]	2025-09-03 06:16:57.63708+00
771	1115	2025-09-03 15:17:01	89	NORMAL	[]	2025-09-03 06:17:06.3006+00
772	1115	2025-09-03 15:17:09	89	NORMAL	[]	2025-09-03 06:17:07.281075+00
773	1115	2025-09-03 15:17:15	87	NORMAL	[]	2025-09-03 06:17:22.317973+00
774	1115	2025-09-03 15:17:24	86	NORMAL	[]	2025-09-03 06:17:22.337742+00
775	1115	2025-09-03 15:17:29	87	NORMAL	[]	2025-09-03 06:17:30.300857+00
776	1115	2025-09-03 15:17:35	87	NORMAL	[]	2025-09-03 06:19:03.602628+00
777	1115	2025-09-03 15:17:41	91	NORMAL	[]	2025-09-03 06:19:03.635086+00
778	1115	2025-09-03 15:17:48	88	NORMAL	[]	2025-09-03 06:19:03.639834+00
779	1115	2025-09-03 15:17:55	85	NORMAL	[]	2025-09-03 06:19:03.639887+00
780	1115	2025-09-03 15:18:01	82	NORMAL	[]	2025-09-03 06:19:03.640371+00
781	1115	2025-09-03 15:18:14	82	NORMAL	[]	2025-09-03 06:19:03.641349+00
782	1115	2025-09-03 15:18:39	86	NORMAL	[]	2025-09-03 06:19:03.649031+00
783	1115	2025-09-03 15:18:20	83	NORMAL	[]	2025-09-03 06:19:03.675028+00
784	1115	2025-09-03 15:18:26	80	NORMAL	[]	2025-09-03 06:19:03.675171+00
785	1115	2025-09-03 15:18:32	83	NORMAL	[]	2025-09-03 06:19:03.675134+00
786	1115	2025-09-03 15:18:49	86	NORMAL	[]	2025-09-03 06:19:03.67552+00
787	1115	2025-09-03 15:18:57	86	NORMAL	[]	2025-09-03 06:19:03.703913+00
788	1115	2025-09-03 15:19:04	88	NORMAL	[]	2025-09-03 06:19:03.704816+00
789	1115	2025-09-03 15:19:11	87	NORMAL	[]	2025-09-03 06:19:09.538477+00
790	1115	2025-09-03 15:19:16	86	NORMAL	[]	2025-09-03 06:19:46.527118+00
791	1115	2025-09-03 15:19:26	86	NORMAL	[]	2025-09-03 06:19:46.898004+00
792	1115	2025-09-03 15:19:33	88	NORMAL	[]	2025-09-03 06:19:46.898656+00
793	1115	2025-09-03 15:19:40	87	NORMAL	[]	2025-09-03 06:19:46.899629+00
794	1115	2025-09-03 15:19:55	87	NORMAL	[]	2025-09-03 06:19:53.590794+00
795	1115	2025-09-03 15:20:00	86	NORMAL	[]	2025-09-03 06:20:00.736193+00
796	1115	2025-09-17 06:37:27.485039	125	WARN	["high_hr"]	2025-09-17 06:37:27.676338+00
797	1115	2025-09-17 06:42:30.571953	125	WARN	["high_hr"]	2025-09-17 06:42:30.776587+00
798	1115	2025-09-17 06:43:36.203927	80	NORMAL	[]	2025-09-17 06:43:36.411709+00
799	1115	2025-09-17 06:43:56.183162	50	NORMAL	[]	2025-09-17 06:43:56.391683+00
800	1115	2025-09-17 06:44:04.649223	30	WARN	["low_hr"]	2025-09-17 06:44:04.858127+00
801	1115	2025-09-17 06:44:13.323058	40	WARN	["low_hr"]	2025-09-17 06:44:13.532318+00
802	1115	2025-09-17 06:44:21.062302	55	NORMAL	[]	2025-09-17 06:44:21.271897+00
803	1115	2025-09-17 06:45:08.21077	55	NORMAL	[]	2025-09-17 06:45:08.422303+00
804	1115	2025-09-17 06:52:39.088261	55	NORMAL	[]	2025-09-17 06:52:39.283583+00
805	1115	2025-09-17 06:52:46.526083	55	NORMAL	[]	2025-09-17 06:52:46.720568+00
806	1115	2025-09-17 08:04:51.054704	10	WARN	["low_hr"]	2025-09-17 08:04:51.365374+00
807	1115	2025-09-17 08:05:23.136353	10	WARN	["low_hr"]	2025-09-17 08:05:23.446802+00
808	1115	2025-09-17 08:21:33.659831	10	ALERT	["low_hr", "ai_outlier"]	2025-09-17 08:21:33.990323+00
809	1115	2025-09-17 08:23:49.03373	40	ALERT	["low_hr", "ai_outlier"]	2025-09-17 08:23:49.369053+00
810	1115	2025-09-17 08:25:54.645529	90	NORMAL	[]	2025-09-17 08:25:54.984067+00
811	1115	2025-09-19 02:06:30.367957	90	NORMAL	[]	2025-09-19 02:06:30.587001+00
812	1115	2025-09-19 02:06:56.518143	50	WARN	["ai_outlier"]	2025-09-19 02:06:56.736587+00
813	1115	2025-09-19 02:07:27.592876	70	WARN	["ai_outlier"]	2025-09-19 02:07:27.810981+00
814	1115	2025-09-19 02:07:36.875394	80	WARN	["ai_outlier"]	2025-09-19 02:07:37.09338+00
815	1115	2025-09-19 02:07:49.855137	150	ALERT	["high_hr", "ai_outlier"]	2025-09-19 02:07:50.073143+00
816	1111	2025-09-25 05:47:32.99916	40	WARN	["low_hr"]	2025-09-25 05:47:33.058254+00
817	1111	2025-09-25 07:40:35.851803	90	ALERT	["rapid_rise", "ai_outlier"]	2025-09-25 07:40:36.025135+00
818	1111	2025-09-25 07:58:22.0563	100	ALERT	["rapid_rise", "ai_outlier"]	2025-09-25 07:58:22.245662+00
819	1111	2025-09-25 07:58:29.471466	70	WARN	["ai_outlier"]	2025-09-25 07:58:29.660675+00
820	1111	2025-09-25 07:58:41.634946	60	NORMAL	[]	2025-09-25 07:58:41.824376+00
821	1115	2025-10-13 01:34:57.479698	85	NORMAL	[]	2025-10-13 01:34:57.625949+00
822	1115	2025-10-13 01:36:48.44269	75	NORMAL	[]	2025-10-13 01:36:48.58971+00
823	1115	2025-10-13 14:10:10	75	NORMAL	[]	2025-10-13 01:40:57.227366+00
824	1115	2025-10-13 14:10:10	75	NORMAL	[]	2025-10-13 01:41:36.417121+00
825	1115	2025-10-13 14:10:10	15	WARN	["low_hr"]	2025-10-13 01:41:52.643308+00
826	1115	2025-10-13 14:10:10	135	WARN	["high_hr"]	2025-10-13 01:43:13.480628+00
827	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 03:57:35.475681+00
828	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 03:58:26.928709+00
829	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 03:59:06.427352+00
830	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 04:03:18.594684+00
831	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 04:08:07.759931+00
832	1115	2025-10-13 14:10:10	75	NORMAL	[]	2025-10-13 04:45:55.125022+00
833	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 04:46:53.552608+00
834	1115	2025-10-13 14:10:05	120	WARN	["high_hr"]	2025-10-13 04:47:23.09418+00
835	1115	2025-10-13 14:10:00	85	NORMAL	[]	2025-10-13 05:00:18.954276+00
\.


--
-- Data for Name: data_beacon; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_beacon (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: data_heartrate; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_heartrate (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: data_spo2; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_spo2 (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
\.


--
-- Data for Name: data_step; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_step (inserted_time, sensor_type, sender, value, beacon_info) FROM stdin;
\.


--
-- Data for Name: data_temp; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_temp (inserted_time, sensor_type, sender, value, beacon_info, event_state) FROM stdin;
2025-11-17 09:49:55.159	watch_temp	1111	26.38018035888672	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 09:50:54.971	watch_temp	1111	26.650394439697266	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-17 15:04:58.507	watch_temp	1111	32.5546989440918	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:12:57.538	watch_temp	1111	33.28786849975586	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:14:57.538	watch_temp	1111	33.21616744995117	{"position": "UNKNOWN"}	NORMAL
2025-11-17 09:51:54.791	watch_temp	1111	27.44721031188965	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 15:05:58.336	watch_temp	1111	32.91950607299805	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:06:58.252	watch_temp	1111	33.25326156616211	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:07:58.214	watch_temp	1111	33.2467155456543	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:08:57.538	watch_temp	1111	33.45283889770508	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:13:57.538	watch_temp	1111	33.25751876831055	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:09:57.538	watch_temp	1111	33.39888381958008	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:11:57.538	watch_temp	1111	33.32882308959961	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:10:57.538	watch_temp	1111	33.377662658691406	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:16:57.538	watch_temp	1111	33.17728805541992	{"position": "UNKNOWN"}	NORMAL
2025-11-17 10:03:46.944	watch_temp	1111	28.70558738708496	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 10:04:46.425	watch_temp	1111	29.016468048095703	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:15:57.538	watch_temp	1111	33.20487594604492	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:17:57.538	watch_temp	1111	33.17460250854492	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:18:57.538	watch_temp	1111	33.17188262939453	{"position": "UNKNOWN"}	NORMAL
2025-11-17 15:19:57.602	watch_temp	1111	33.38473129272461	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:20:57.65	watch_temp	1111	33.43916702270508	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:21:57.691	watch_temp	1111	33.445438385009766	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:22:57.782	watch_temp	1111	33.44362258911133	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 12:15:26.924	watch_temp	1111	34.01614761352539	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:16:26.884	watch_temp	1111	34.065940856933594	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 10:06:04.177	watch_temp	1111	28.43407440185547	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 10:07:04.162	watch_temp	1111	28.50044059753418	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 10:08:04.086	watch_temp	1111	28.78430938720703	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:24:57.782	watch_temp	1111	33.4833869934082	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:23:57.782	watch_temp	1111	33.44532012939453	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 12:14:26.928	watch_temp	1111	33.922054290771484	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 12:54:58.14	watch_temp	1112	27.000185012817383	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 12:55:59.979	watch_temp	1112	27.471515655517578	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:56:59.979	watch_temp	1112	27.766582489013672	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:57:59.979	watch_temp	1112	28.083669662475586	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:58:59.979	watch_temp	1112	28.134357452392578	{"position": "UNKNOWN"}	NORMAL
2025-11-14 12:59:59.979	watch_temp	1112	28.351539611816406	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:00:59.979	watch_temp	1112	28.388795852661133	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:01:59.979	watch_temp	1112	26.557493209838867	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:02:59.979	watch_temp	1112	29.799636840820312	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:04:01.788	watch_temp	1112	27.685583114624023	{"position": "UNKNOWN"}	NORMAL
2025-11-14 13:16:44.537	watch_temp	1112	28.283523559570312	{"major": "30002", "minor": "27335", "position": "구역1"}	NORMAL
2025-11-14 13:47:47.049	watch_temp	1111	29.76546859741211	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-17 15:25:57.782	watch_temp	1111	33.48167037963867	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:26:57.782	watch_temp	1111	33.470394134521484	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 12:20:16.852	watch_temp	1111	34.698143005371094	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 12:21:16.84	watch_temp	1111	34.69667434692383	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:37:13.478	watch_temp	1111	33.684959411621094	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 13:49:12.65	watch_temp	1112	34.52320098876953	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-17 15:38:13.433	watch_temp	1111	33.70466232299805	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-17 15:39:13.25	watch_temp	1111	33.968631744384766	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 13:59:33.85	watch_temp	1112	35.00523376464844	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:00:35.486	watch_temp	1112	34.97833251953125	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:01:35.486	watch_temp	1112	34.970638275146484	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:09:13.934	watch_temp	1111	30.98677635192871	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 14:12:14.091	watch_temp	1111	31.41193389892578	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:10:14	watch_temp	1111	31.013065338134766	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 14:11:14.041	watch_temp	1111	31.095561981201172	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:13:14.135	watch_temp	1111	31.472137451171875	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:15:14.122	watch_temp	1111	31.530675888061523	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:35:30.93	watch_temp	1111	32.149723052978516	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:36:30.982	watch_temp	1111	32.185401916503906	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:37:30.982	watch_temp	1111	25.544763565063477	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:14.141	watch_temp	1111	31.485279083251953	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:16:06.16	watch_temp	1112	34.716922760009766	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:19:13.809	watch_temp	1111	31.552499771118164	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:28:30.69	watch_temp	1111	31.31546974182129	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:29:30.829	watch_temp	1111	31.394573211669922	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:32:30.829	watch_temp	1111	31.99898338317871	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:30:30.829	watch_temp	1111	31.4721736907959	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:31:30.829	watch_temp	1111	31.950613021850586	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:33:30.829	watch_temp	1111	32.05148696899414	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:12:06.16	watch_temp	1112	32.933990478515625	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:15:06.16	watch_temp	1112	34.517356872558594	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:13:06.16	watch_temp	1112	33.18561935424805	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:14:06.16	watch_temp	1112	33.70165252685547	{"position": "UNKNOWN"}	NORMAL
2025-11-14 14:16:14.003	watch_temp	1111	31.5511417388916	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:17:14.048	watch_temp	1111	31.551822662353516	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:18:13.942	watch_temp	1111	31.551498413085938	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:20:13.826	watch_temp	1111	31.51556968688965	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:27:30.618	watch_temp	1111	31.254638671875	{"major": "30002", "minor": "27351", "position": "구역4"}	NORMAL
2025-11-14 14:34:30.89	watch_temp	1111	32.097389221191406	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:25:12.873	watch_temp	1111	33.2119140625	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 10:26:12.762	watch_temp	1111	33.228633880615234	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:28:12.762	watch_temp	1111	33.33232116699219	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:29:12.762	watch_temp	1111	33.36984634399414	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:30:12.762	watch_temp	1111	24.661439895629883	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:27:12.762	watch_temp	1111	33.28607940673828	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:31:12.762	watch_temp	1111	26.819639205932617	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:33:52.455	watch_temp	1111	27.186450958251953	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:34:52.474	watch_temp	1111	27.170909881591797	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:35:55.815	watch_temp	1111	24.847991943359375	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:36:55.815	watch_temp	1111	26.47783660888672	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:37:55.824	watch_temp	1111	25.544843673706055	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:38:55.042	watch_temp	1111	25.511812210083008	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:39:55.091	watch_temp	1111	26.410152435302734	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:40:55.097	watch_temp	1111	28.68219566345215	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:41:55.172	watch_temp	1111	29.145172119140625	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:42:55.227	watch_temp	1111	30.20930290222168	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:43:55.254	watch_temp	1111	30.12225341796875	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:44:55.306	watch_temp	1111	29.774383544921875	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:45:55.317	watch_temp	1111	29.17685890197754	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:46:55.394	watch_temp	1111	30.69236183166504	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:47:55.437	watch_temp	1111	29.348207473754883	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:48:55.532	watch_temp	1111	28.84842300415039	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:49:55.589	watch_temp	1111	32.38782501220703	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:50:55.522	watch_temp	1111	29.275556564331055	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:51:55.599	watch_temp	1111	30.316038131713867	{"position": "UNKNOWN"}	NORMAL
2025-11-14 10:58:20.951	watch_temp	1111	32.90182876586914	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 10:59:21.04	watch_temp	1111	33.23927688598633	{"position": "UNKNOWN"}	NORMAL
2025-11-14 11:02:21.912	watch_temp	1111	33.92538070678711	{"major": "30002", "minor": "27399", "position": "구역6"}	NORMAL
2025-11-14 11:03:21.988	watch_temp	1111	33.9143180847168	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
2025-11-14 11:04:22.064	watch_temp	1111	34.230072021484375	{"major": "30002", "minor": "27400", "position": "구역5"}	NORMAL
\.


--
-- Data for Name: dept_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.dept_info (id, dept_name) FROM stdin;
1	부서 A
2	부서 B
3	부서 C
4	부서 D
\.


--
-- Data for Name: device_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.device_info (id, dev_id, dev_type, status, meta_data, created_time, updated_time, is_use) FROM stdin;
1	192.168.10.28	CCTV	NORMAL	{"port": 554, "type": "CCTV", "devPwd": "!Q2w3e4r5t", "address": "192.168.10.28", "devUser": "admin", "profile": "rtsp://192.168.10.28:554/0/onvif/profile1/media.smp"}	2025-09-16 09:20:27.756027	2025-09-16 09:20:27.756027	t
8	4ce1dd5788ac79e0	WATCH	NORMAL	{"type": "WATCH", "brand": "samsung", "model": "SM-R945N", "deviceId": "4ce1dd5788ac79e0"}	2025-09-16 17:19:21.140787	2025-09-16 17:19:21.140787	t
9	30002:27335	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27335", "model": "MBeacon", "battery": 100, "txpower": 0}	2025-09-17 16:49:04.828478	2025-09-17 16:49:04.828478	t
10	192.168.10.64	CCTV	NORMAL	{"port": 0, "type": "CCTV", "devPwd": "!Q2w3e4r5t", "address": "192.168.10.64", "devUser": "admin", "profile": "rtsp://admin:!Q2w3e4r5t@192.168.10.64"}	2025-10-13 04:46:09.149078	2025-10-13 04:46:09.149078	t
2	192.168.10.44	CCTV	NORMAL	{"port": 0, "type": "CCTV", "devPwd": "Thermal1594!", "address": "192.168.10.44", "devUser": "admin", "profile": "rtsp://admin:Thermal1594!@192.168.10.44/Primary"}	2025-09-16 09:42:58.574487	2025-09-16 09:42:58.574487	t
17	7b438e0a81ed551b	WATCH	NORMAL	{"type": "WATCH", "brand": "samsung", "model": "SM-L310", "deviceId": "7b438e0a81ed551b"}	2025-11-12 11:07:13.25606	2025-11-12 11:07:13.25606	t
3	192.168.10.6	CCTV	NORMAL	{"port": 554, "type": "CCTV", "useAi": true, "devPwd": "admin", "address": "192.168.10.6", "devUser": "admin", "profile": "rtsp://admin:admin@192.168.10.6:554/stream1"}	2025-09-16 09:43:35.173248	2025-09-16 09:43:35.173248	t
14	b54448e1068d2c71	WATCH	NORMAL	{"type": "WATCH", "brand": "samsung", "model": "SM-R940", "deviceId": "b54448e1068d2c71"}	2025-11-10 10:40:15.917435	2025-11-10 10:40:15.917435	t
4	30002:27350	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27350", "model": "MBeacon", "battery": 90, "txpower": 0}	2025-09-16 09:55:19.144234	2025-09-16 09:55:19.144234	t
5	30002:27349	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27349", "model": "MBeacon", "battery": 100, "txpower": 0}	2025-09-16 09:58:24.323182	2025-09-16 09:58:24.323182	t
15	30002:27351	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27351", "model": "MBeacon", "battery": 90, "txpower": 0}	2025-09-16 09:55:19.144234	2025-09-16 09:55:19.144234	t
16	30002:27400	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27400", "model": "MBeacon", "battery": 100, "txpower": 0}	2025-09-16 09:58:24.323182	2025-09-16 09:58:24.323182	t
6	30002:27399	BEACON	NORMAL	{"rssi": 0, "type": "BEACON", "major": "30002", "minor": "27399", "model": "MBeacon", "battery": 100, "txpower": 0}	2025-09-16 09:58:30.045664	2025-09-16 09:58:30.045664	t
\.


--
-- Data for Name: event_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.event_history (event_id, inserted_time, ref_region, ref_device, people, event_state, state, message, ref_device_name, accuracy, sender) FROM stdin;
7af24510-f370-4b25-921a-9dcdae2b2091	2025-11-17 10:05:00.594	\N	w-1111	0	ABNORMAL_CONNECT	UNSOLVED	작업자(1111) 통신안됨	\N	\N	1111
e558da80-652d-4b41-8c37-d9585d4de0d7	2025-11-17 10:09:34.181	\N	w-1111	0	ABNORMAL_CONNECT	UNSOLVED	작업자(1111) 통신안됨	\N	\N	1111
62d38efa-b7e6-4753-a0f2-94d1f6d141f5	2025-11-17 10:22:13.881	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8110282	192.168.10.6
e5a668bb-6a83-45f4-9a1f-53bd9de7aae3	2025-11-17 10:22:13.881	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8110282	192.168.10.6
7277eee9-0ceb-405e-b621-486c3b371bfd	2025-11-17 10:23:06.535	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82051116	192.168.10.6
c63b282f-2070-4a95-b086-b2991923c184	2025-11-17 10:23:38.699	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8454119	192.168.10.6
51012bd2-0c44-4328-a540-f101fba75c54	2025-11-17 10:23:47.282	구역7	CCTV-3	0	ABNORMAL_CCTV_3	UNSOLVED	(구역7) 에서 화재 발생	\N	0.36544994	192.168.10.6
34d90d41-fb63-49e6-b167-addcf5bc2e3a	2025-11-17 10:23:57.994	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6826285	192.168.10.6
098fe2c7-d00d-4f24-b1d8-528d1b96e5be	2025-11-17 10:24:08.781	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92614824	192.168.10.6
15d5cf9d-ee95-4d97-86cd-d9c7fec57461	2025-11-17 10:25:00.3	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.7409066	192.168.10.6
07d06dc6-b859-4755-9136-05aee5add2b9	2025-11-17 10:24:57.999	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9202196	192.168.10.6
8f570964-25cc-4b6e-8fec-0559f051cc6f	2025-11-17 10:25:39.811	구역7	CCTV-3	0	ABNORMAL_CCTV_2	SOLVED	(구역7) 에서 침입 발생	\N	0.87512654	192.168.10.6
dc02e931-59af-4edb-9862-9c1eec310a15	2025-11-17 10:27:17.32	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9244339	192.168.10.6
f645399f-d8b5-4b89-8629-f7079eb9f592	2025-11-17 10:28:51.729	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.68445736	192.168.10.6
32114856-24ea-4aa0-95d7-a78efa659169	2025-11-17 10:28:50.549	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92999184	192.168.10.6
543af3df-d23d-4f80-bd00-33c76acd9bf9	2025-11-17 10:30:37.67	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9202153	192.168.10.6
0e2a0f5c-e11c-4660-a6f0-b80e79eb448e	2025-11-17 10:32:51.529	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8821224	192.168.10.6
679d7ab2-a91c-4567-9f2a-73d402ad6873	2025-11-17 10:33:49.463	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90361667	192.168.10.6
07356cad-1e28-4ce9-9839-79ed2969206b	2025-11-17 10:34:19.499	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.853259	192.168.10.6
c262de82-52ea-47cd-8703-e89276faea9c	2025-11-17 10:34:50.55	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85709804	192.168.10.6
f395398c-a292-4825-93e0-d5cdd26c5790	2025-11-17 10:35:21.627	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89566946	192.168.10.6
109e7ca9-3000-417b-bc7d-3e6ff63c010e	2025-11-17 10:35:55.919	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8938308	192.168.10.6
b0f0a89f-18ec-4a1e-800e-582812693b3d	2025-11-17 10:36:25.93	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82905114	192.168.10.6
7317bc27-1839-47b2-9de1-f70a4b66596f	2025-11-17 10:36:59.061	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9365301	192.168.10.6
e1e450db-9c24-4212-b945-77ed2566112d	2025-11-17 10:38:08.895	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90723044	192.168.10.6
b4a56250-80ae-4932-a78f-1a241c020ae5	2025-11-17 10:43:34.479	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.93041617	192.168.10.6
15a9bb19-8cd5-4b13-bcc1-605c6a1eec27	2025-11-17 10:44:40.958	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8775734	192.168.10.6
1e1863a9-b0b0-4253-938a-c4a4c608c585	2025-11-17 10:45:21.65	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8759104	192.168.10.6
c7f17a96-bf0a-465d-aad8-23dce796647f	2025-11-17 10:46:18.609	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89527524	192.168.10.6
24df25a1-e8a6-43e9-b8f4-bfdb85985cf5	2025-11-17 10:47:14.349	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9255671	192.168.10.6
b583d818-99ea-4f32-84eb-c2ac9296e87d	2025-11-17 10:48:04.539	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91112167	192.168.10.6
25427f46-0dfc-4524-b723-7f0dc2529ae4	2025-11-17 10:48:38.882	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84464943	192.168.10.6
63d83ed2-1b31-436c-b569-028e167ec4a3	2025-11-17 10:49:09.93	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91044086	192.168.10.6
52f703d3-afbd-4dd1-9298-f006ffd90f6b	2025-11-17 10:49:41.137	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9279514	192.168.10.6
c5f8262c-ef21-4e25-87b7-f5ef583b3a12	2025-11-17 10:54:06.705	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8983953	192.168.10.6
9aabb296-8f4c-44aa-aad2-5fd89dbff411	2025-11-17 10:54:10.054	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.78206134	192.168.10.6
513dd49e-550e-4c65-90c7-1938c4826ad4	2025-11-17 10:54:37.855	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9182471	192.168.10.6
399de31e-285d-4565-b9b4-aeb931a940b6	2025-11-17 10:56:29.175	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85065824	192.168.10.6
29308cea-ca83-4191-ac1d-888f815b0551	2025-11-17 10:57:56.164	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8836503	192.168.10.6
4aaf7ac2-f1bf-4743-b6d5-4faab0f559ea	2025-11-17 10:59:57.051	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80847424	192.168.10.6
6d827be6-0730-471d-b6dd-9366c9404d3f	2025-11-17 10:59:57.051	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80847424	192.168.10.6
7fe448bd-052f-4de7-952b-7ad67008865c	2025-11-17 11:00:36.676	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8074537	192.168.10.6
1944b1c0-f65f-4758-bb20-7e14147ef30c	2025-11-17 11:00:36.676	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8074537	192.168.10.6
28213714-0e20-4615-b889-3467352fca39	2025-11-17 11:01:36.689	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89578384	192.168.10.6
83c0c5ba-f96a-4090-b029-6c9e9d5c2198	2025-11-17 11:01:36.689	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89578384	192.168.10.6
4f3010fb-0e0d-4fec-8c64-724b2b350f39	2025-11-17 11:03:52.788	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87904394	192.168.10.6
ab9e2533-a4e4-4f6a-9420-e0c4649fc48f	2025-11-17 11:03:52.788	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87904394	192.168.10.6
9ebe4401-e157-4ba8-af6f-83d4a7942a8a	2025-11-17 11:04:23.938	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87029165	192.168.10.6
52565c2c-41c9-49b4-9c46-b650eb5a07da	2025-11-17 11:04:23.938	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87029165	192.168.10.6
972922be-310d-45a5-ace8-585301c2990e	2025-11-17 11:08:45.292	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9182519	192.168.10.6
34e61da6-9fc9-4566-9dd3-a6af3f773b92	2025-11-17 11:08:45.292	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9182519	192.168.10.6
ed1430a2-fd62-4eac-822c-055404d5838b	2025-11-17 11:09:21.721	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85987866	192.168.10.6
5c37d720-5bba-4853-9592-0cecfac08faa	2025-11-17 11:09:21.721	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85987866	192.168.10.6
8039c93c-3ca4-44eb-8776-fa8d5fd600a8	2025-11-17 11:10:02.485	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9378555	192.168.10.6
cead0a03-4a58-46b4-94b2-beea0b13959d	2025-11-17 11:10:02.485	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9378555	192.168.10.6
4c93955b-df48-41bb-9bb4-3f59897eeeea	2025-11-17 11:10:30.285	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.72797006	192.168.10.6
fd7cc47c-9a72-471b-ac87-6602dd267778	2025-11-17 11:10:30.285	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.72797006	192.168.10.6
ca62aa26-3ff0-4f7a-b07c-d1e1d35b8380	2025-11-17 11:10:48.506	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9212373	192.168.10.6
dc7753bd-ff07-4196-a28c-5ef13920cc86	2025-11-17 11:10:48.506	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9212373	192.168.10.6
ee63dcbb-1278-4c23-9a9e-6529d370bd74	2025-11-17 11:11:31.384	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8771155	192.168.10.6
54f2906e-46e8-4577-bb75-bdee038083ad	2025-11-17 11:11:31.384	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8771155	192.168.10.6
2faabf5d-9c56-42fc-b118-28051ecc58a6	2025-11-17 11:12:13.147	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89700204	192.168.10.6
072743bb-898d-4528-91fe-b4cae6e721ee	2025-11-17 11:12:13.147	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89700204	192.168.10.6
c676350f-b77c-416a-a303-57859b98c404	2025-11-17 11:13:18.512	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.822882	192.168.10.6
3af4c082-840c-40a3-b72f-e539b108b954	2025-11-17 11:13:18.512	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.822882	192.168.10.6
9e8d7255-3ce7-4c0f-a932-83c69fa77c67	2025-11-17 11:14:35.672	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9127959	192.168.10.6
c860a74d-5dc5-4216-b171-73970418797b	2025-11-17 11:14:35.672	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9127959	192.168.10.6
e2792d7b-bc99-4c84-ace5-3f3a90aeaa45	2025-11-17 11:15:11.017	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8109169	192.168.10.6
febba263-1918-489f-bcb6-c6ecae9257e5	2025-11-17 11:15:11.017	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8109169	192.168.10.6
ba34305a-aa69-407c-b9ee-35d0f0c5fdd3	2025-11-17 11:16:46.35	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90354264	192.168.10.6
7d3c6167-988c-439d-85aa-8255d3ad752e	2025-11-17 11:16:46.35	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90354264	192.168.10.6
bbc03046-fa65-42a2-9a76-ef2b4421a5fd	2025-11-17 11:17:51.707	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9189384	192.168.10.6
fcac97e6-2900-4804-8a76-3290991f93ee	2025-11-17 11:17:51.707	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9189384	192.168.10.6
31f2d178-d1e0-46c8-b506-a391fac2e44d	2025-11-17 11:19:48.546	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9086139	192.168.10.6
1666b9b3-fdd9-427e-aac3-c2816ce26314	2025-11-17 11:19:48.546	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9086139	192.168.10.6
ec118f4a-d27f-4072-a3c5-b7b3240fead4	2025-11-17 11:23:46.488	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87532353	192.168.10.6
bf5a2100-f4e1-49e5-b0fa-dc5ce0a94bba	2025-11-17 11:23:46.488	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87532353	192.168.10.6
2d4a6013-7b16-464f-b2a7-6e3609e9a6c9	2025-11-17 11:25:39.974	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.872342	192.168.10.6
49c60e69-c6d8-46a0-aca4-a7b1d6bf4b11	2025-11-17 11:25:39.974	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.872342	192.168.10.6
cf1c817e-08cf-4fee-95f1-511a92b30669	2025-11-17 11:26:51.859	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8856125	192.168.10.6
0a57a42d-26de-4f6e-9e74-69e56f230bc2	2025-11-17 11:26:51.859	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8856125	192.168.10.6
3f230f52-48e0-4a07-9899-3ce6d7ecd8a1	2025-11-17 11:27:36.77	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8115322	192.168.10.6
0de82bf5-d969-4e48-a4d9-4ecf379a3d10	2025-11-17 11:27:36.77	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8115322	192.168.10.6
fb57ab14-790d-4f2c-ab63-9779cd4d5247	2025-11-17 11:28:08.959	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86730754	192.168.10.6
d5b89e3f-ba2e-4ac9-a62b-ed02713a87b4	2025-11-17 11:28:08.959	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86730754	192.168.10.6
e04a6129-f6a4-4a91-ac52-58ecfce3e212	2025-11-17 11:30:04.587	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82733977	192.168.10.6
862b8dd3-bb47-4f87-a9fc-d42d388c56b4	2025-11-17 11:30:04.587	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82733977	192.168.10.6
e0f29262-19f3-4a6b-9bdd-d0819c4cab2d	2025-11-17 11:30:34.635	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8593399	192.168.10.6
568d5368-06da-44cc-bd33-af8acf229e4a	2025-11-17 11:30:34.635	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8593399	192.168.10.6
52e6e0a2-d4f6-45d8-9e31-fbd09921fede	2025-11-17 11:31:04.659	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8756345	192.168.10.6
2f61f747-cc47-40cd-8958-cc98e961e434	2025-11-17 11:31:04.659	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8756345	192.168.10.6
1e6c4ab9-be26-4594-b361-c0260e229c9e	2025-11-17 11:31:35.812	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88953954	192.168.10.6
01287506-847d-4bc6-af6c-5a040eb38794	2025-11-17 11:31:35.812	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88953954	192.168.10.6
94021981-014b-4167-a9ef-e9ef28b60c0e	2025-11-17 11:32:17.452	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92243063	192.168.10.6
b7a2c88f-96e1-40fb-981b-7c7897b2bd7c	2025-11-17 11:32:17.452	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92243063	192.168.10.6
b0a88429-9ac2-4044-a5ec-9e1b6549271b	2025-11-17 11:34:22.842	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6465836	192.168.10.6
757258f4-79cc-4a2c-8445-7838503dd6fd	2025-11-17 11:34:22.842	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6465836	192.168.10.6
9610a6e3-9218-4955-bf5f-e1f01227a8e2	2025-11-17 11:34:22.937	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88957286	192.168.10.6
1e901721-2cac-48f1-923e-3d487fb0eb26	2025-11-17 11:34:22.937	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88957286	192.168.10.6
2d7985bb-c058-49b2-b3e2-a5eef4a90646	2025-11-17 11:35:37.849	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91418797	192.168.10.6
0a59b656-7d26-4c0c-911c-f7aea2d53693	2025-11-17 11:35:37.849	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91418797	192.168.10.6
919eaf8f-2ea4-49cf-968c-767e14013a48	2025-11-17 11:39:57.156	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.865461	192.168.10.6
a04f76b9-ff55-49da-9d11-5b2bce3094ba	2025-11-17 11:39:57.156	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.865461	192.168.10.6
27f6dce5-0287-412a-bc63-24952732b80e	2025-11-17 11:41:08.966	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.903238	192.168.10.6
203a305c-fa73-4139-9b34-59bcde66a1e7	2025-11-17 11:41:08.966	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.903238	192.168.10.6
baf70ccb-f499-4f86-9b9b-93a71b659b9d	2025-11-17 11:42:20.711	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88810045	192.168.10.6
1cef7cf9-8a38-4de5-bc98-f03799f41067	2025-11-17 11:42:20.711	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88810045	192.168.10.6
a34c374d-1904-485d-b6b8-8a775ac190f7	2025-11-17 11:43:35.75	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89225364	192.168.10.6
71d757ec-f2cc-4b26-927e-4b4a48c0fe9a	2025-11-17 11:43:35.75	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89225364	192.168.10.6
c09aeb88-963f-4271-98b8-0c858e718dd2	2025-11-17 11:35:06.905	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.897921	192.168.10.6
862c89c3-b03e-48aa-8814-fd565b1cf5dc	2025-11-17 11:35:06.905	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.897921	192.168.10.6
190ccd40-d020-4bfe-84a3-f92ddc63d26b	2025-11-17 11:46:41.361	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8493281	192.168.10.6
bb4009b7-098b-4556-ad5c-a3c30567c881	2025-11-17 11:46:41.361	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8493281	192.168.10.6
dcb6a206-2844-4b05-84dc-072bfac9977c	2025-11-17 11:47:20.062	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8858374	192.168.10.6
8c89fc86-864d-4941-aec3-124f4f004568	2025-11-17 11:47:20.062	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8858374	192.168.10.6
23a6500d-d79a-412c-a610-c226262aa891	2025-11-17 11:48:36.029	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87944406	192.168.10.6
7ef2914d-ca37-4c8f-ba7d-21471f53a832	2025-11-17 11:48:36.029	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87944406	192.168.10.6
eda6df46-d47b-412c-ac9c-7683119e50fe	2025-11-17 11:52:38.334	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8152066	192.168.10.6
a97a0e36-5977-4767-a4e8-ee8b9dfc0975	2025-11-17 11:52:38.334	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8152066	192.168.10.6
8c53cf19-334b-4694-bb82-e25b9c845240	2025-11-17 11:55:40.297	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9235234	192.168.10.6
881f31fd-9c7e-4343-99ec-8c401de08f79	2025-11-17 11:55:40.297	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9235234	192.168.10.6
bdad8d5a-b851-4de3-a7f7-f9f747b02237	2025-11-17 11:57:34.058	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.917676	192.168.10.6
48f548c1-2350-492a-96bf-69a7a4d378c6	2025-11-17 11:57:34.058	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.917676	192.168.10.6
a9c51964-60ca-475b-9225-19971850e9b0	2025-11-17 11:59:00.833	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8669247	192.168.10.6
6d3a8840-3470-468c-a018-dea6462f63e0	2025-11-17 11:59:00.833	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8669247	192.168.10.6
bdcc088f-6eb8-4a56-9942-81ae6a68c03a	2025-11-17 12:00:33.913	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.859082	192.168.10.6
9dfa687e-ecb7-46ca-8bdf-bf2254fefec9	2025-11-17 12:00:33.913	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.859082	192.168.10.6
b543247d-9776-4f72-b89b-a13e97028291	2025-11-17 12:01:24.21	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9223961	192.168.10.6
230999ee-b1e6-4f1b-97f9-000ad1fc8b69	2025-11-17 12:01:24.21	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9223961	192.168.10.6
40f06f01-490a-4829-84cf-6a7d1418c28b	2025-11-17 12:02:01.715	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.924969	192.168.10.6
339dbc5d-2147-4aa6-b4ba-11a5acab1784	2025-11-17 12:02:01.715	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.924969	192.168.10.6
35490ede-76e4-48ff-8b98-e8aada42fc28	2025-11-17 12:03:13.529	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80930614	192.168.10.6
96b92942-6c69-43f4-b5e3-af554b7c15e4	2025-11-17 12:03:13.529	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80930614	192.168.10.6
d4a35827-b4f8-40da-942d-5e0d5ed227ee	2025-11-17 12:03:45.662	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9104513	192.168.10.6
10af3164-2fb2-4c8e-bb5e-7f4ce91e20f7	2025-11-17 12:03:45.662	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9104513	192.168.10.6
e07dddd6-80ec-4d45-acab-a02cd355c463	2025-11-17 12:04:16.696	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84577733	192.168.10.6
b0d2f87d-3458-42e7-8f1f-2ade33a974b1	2025-11-17 12:04:16.696	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84577733	192.168.10.6
45dcc781-b2fd-449d-ba84-74e213998309	2025-11-17 12:07:29.592	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88719624	192.168.10.6
0919b473-c2a5-430c-a423-fc7f5786408d	2025-11-17 12:07:29.592	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88719624	192.168.10.6
7ff793f7-2ca0-46e1-b180-e7c7e49678e1	2025-11-17 12:08:38.161	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.647138	192.168.10.6
d5545fca-7e72-4433-8c68-dcab5527decb	2025-11-17 12:08:38.161	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.647138	192.168.10.6
08b38e92-4b38-4058-9b8d-c8a2d010e1b3	2025-11-17 12:08:39.428	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9344427	192.168.10.6
7e77378a-e24c-4ae9-ad2f-601fbefd6bef	2025-11-17 12:08:39.428	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9344427	192.168.10.6
85fb0a29-98a3-464b-9c23-b43e0ebeaab5	2025-11-17 12:09:28.566	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9008247	192.168.10.6
69e4896f-3e44-4a9c-a592-69264c6c51a6	2025-11-17 12:09:28.566	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9008247	192.168.10.6
90ceb724-3e82-4175-ae66-d61a22f8baaf	2025-11-17 12:12:08.197	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9000584	192.168.10.6
40250dcb-f655-4966-8651-46850ef1fd40	2025-11-17 12:12:08.197	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9000584	192.168.10.6
672423c6-366b-47dd-b5fa-0fa22f0e3a72	2025-11-17 12:18:11.645	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91123015	192.168.10.6
564a6f22-4c74-4918-892b-6de529b8103d	2025-11-17 12:18:11.645	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91123015	192.168.10.6
09e9ccd8-44e3-4bb9-8c04-4ac53b41a2d1	2025-11-17 12:19:04.129	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92590904	192.168.10.6
dae38d91-51aa-4f2b-82c6-d0f24cea128f	2025-11-17 12:19:04.129	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92590904	192.168.10.6
eaf9e02c-2f75-4555-ae40-5903a3d151db	2025-11-17 12:20:31.975	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9283537	192.168.10.6
ab2c6539-61e7-4774-80ea-1b1b669fdb3e	2025-11-17 12:20:31.975	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9283537	192.168.10.6
c5352bb9-a700-49e5-8ff7-da2e3c2471e2	2025-11-17 12:22:24.644	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90460175	192.168.10.6
db23faaf-c759-4bb1-91f3-2fec0125b4af	2025-11-17 12:22:24.644	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90460175	192.168.10.6
5127fd51-ae5c-491e-950a-a36173ff3afb	2025-11-17 12:23:13.957	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9240064	192.168.10.6
2e3ce90b-e3f4-4356-a066-0a020990146c	2025-11-17 12:23:13.957	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9240064	192.168.10.6
7c97bfa9-795b-40a2-bea1-68767fd0fd51	2025-11-17 12:24:20.44	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.93106	192.168.10.6
839561c8-7204-4021-bf6e-fb200ca78126	2025-11-17 12:24:20.44	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.93106	192.168.10.6
2ceb36e4-4fc7-413e-85b5-38b2cc3c8c31	2025-11-17 12:25:25.759	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8971336	192.168.10.6
2a8531ab-42a9-4465-9241-547ef9e15c2d	2025-11-17 12:25:25.759	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8971336	192.168.10.6
afe585e2-71ef-4a46-9d09-00d7daef8d63	2025-11-17 12:25:58.821	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87717843	192.168.10.6
375f8a44-7d8d-4c32-9369-388e41ab810f	2025-11-17 12:25:58.821	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87717843	192.168.10.6
1291a936-e19a-4c99-850d-84a942e69022	2025-11-17 12:27:53.421	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88583034	192.168.10.6
29c5ced4-be4c-4a8b-98e0-93ace1ebdd8d	2025-11-17 12:27:53.421	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88583034	192.168.10.6
de7fb873-8d9f-4817-9156-83e0c8949016	2025-11-17 12:28:28.798	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8844439	192.168.10.6
1eb84d7e-9aac-4676-8e47-8f1d8cb31884	2025-11-17 12:28:28.798	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8844439	192.168.10.6
b64cd3c1-7e53-4fbc-a1d8-27ee872b79f5	2025-11-17 12:30:23.441	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91293913	192.168.10.6
90a07f36-d52f-4664-ac61-7ca18ba96b62	2025-11-17 12:30:23.441	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91293913	192.168.10.6
50d97efd-9cf8-42a5-9a65-ccc9fcbffbca	2025-11-17 12:32:21.331	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8862269	192.168.10.6
17ba5cbd-4208-4575-a092-efe6f0dcae1f	2025-11-17 12:32:21.331	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8862269	192.168.10.6
10a5481d-3ce0-427e-a08e-7cfbe0c02adc	2025-11-17 12:34:33.225	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9444676	192.168.10.6
5a6f6274-f7b5-4e65-a53c-3ccb433bab46	2025-11-17 12:34:33.225	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9444676	192.168.10.6
7a45ed14-11ed-4935-a1fa-1e7629289c1f	2025-11-17 12:33:26.839	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9149732	192.168.10.6
16629ca9-d830-41ad-b860-6ab4b321a392	2025-11-17 12:33:26.839	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9149732	192.168.10.6
8a89f435-5001-452c-a475-7be5be203656	2025-11-17 12:39:57.911	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8486978	192.168.10.6
6c60acd9-27a9-44db-a94a-dcdac9be2eb2	2025-11-17 12:39:57.911	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8486978	192.168.10.6
cfecb742-1a42-4a49-8434-2d6d70a99c89	2025-11-17 12:40:07.459	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6510603	192.168.10.6
288315af-3f8c-4a61-a81f-0f9982316d99	2025-11-17 12:40:07.459	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6510603	192.168.10.6
d9428a21-9178-4c3b-89ce-e2a1cef89fe7	2025-11-17 12:40:28.826	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90187556	192.168.10.6
5f5b062f-1926-4e93-927e-5452dff851e9	2025-11-17 12:40:28.826	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90187556	192.168.10.6
8c9df1dd-26c3-483f-9734-c126c85bc909	2025-11-17 12:42:32.085	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8769964	192.168.10.6
8934c876-246c-4a7e-b230-0af4be2b0c6a	2025-11-17 12:42:32.085	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8769964	192.168.10.6
485a76d5-08b0-4053-a44f-bae3d02d815b	2025-11-17 12:43:03.295	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8375614	192.168.10.6
2ea228f3-d836-4132-87c7-2a22f7d07f8f	2025-11-17 12:43:03.295	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8375614	192.168.10.6
9d028a06-f002-4e3c-8661-b5d183c6aa58	2025-11-17 12:44:20.418	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8837908	192.168.10.6
02d2482b-9743-45d6-a323-f0b8b5fd2261	2025-11-17 12:44:20.418	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8837908	192.168.10.6
d55f5f47-c12b-4b31-81e3-52491384beea	2025-11-17 12:45:20.424	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8789416	192.168.10.6
e5f103ef-71db-4919-a243-2f0e5e276496	2025-11-17 12:45:20.424	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8789416	192.168.10.6
02fdd780-437b-4ebf-a6b6-e121d3d48b38	2025-11-17 12:46:18.149	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9069824	192.168.10.6
5e0f511c-8090-41eb-bdaf-ecd43ee05a2f	2025-11-17 12:46:18.149	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9069824	192.168.10.6
4ef4b8de-2daa-421e-97f1-b80ce284bf30	2025-11-17 12:46:48.159	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90583616	192.168.10.6
e2dc5e48-eccc-4cf3-90dd-9aead274224f	2025-11-17 12:46:48.159	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90583616	192.168.10.6
ef889eea-432c-4737-8b8d-08f9a63b5b67	2025-11-17 12:47:41.728	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9312038	192.168.10.6
7ce47e8c-6ef8-49ff-bedc-e36612dbdc8a	2025-11-17 12:47:41.728	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9312038	192.168.10.6
5d5526be-1f38-4bba-9aa1-bab31228de02	2025-11-17 12:48:39.542	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9339848	192.168.10.6
0cbc7fe3-2b63-4120-8ba1-dfab0d8ee1e2	2025-11-17 12:48:39.542	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9339848	192.168.10.6
cbb7b1fb-6916-4524-847f-03a8ace31c99	2025-11-17 12:49:10.642	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84014463	192.168.10.6
6ac851f9-05e9-40ca-8f58-04281ad3c7e1	2025-11-17 12:49:10.642	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84014463	192.168.10.6
8da92f5f-4de8-4d98-9e2d-b544e7aaed1c	2025-11-17 12:49:41.653	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87795085	192.168.10.6
ee9d1458-47ce-4f7d-b89b-77fa14bf2d78	2025-11-17 12:49:41.653	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87795085	192.168.10.6
8d528c7d-1358-4271-922c-2574c282b979	2025-11-17 12:50:11.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87714106	192.168.10.6
60a69c9a-46a7-4559-8d21-11a1d2eb7380	2025-11-17 12:50:11.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87714106	192.168.10.6
98f67a8c-54ad-488f-b5ff-62a94c71803c	2025-11-17 12:50:42.802	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9073114	192.168.10.6
fa4352b2-7cca-4f82-a783-5f447b30e4c7	2025-11-17 12:50:42.802	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9073114	192.168.10.6
a12f9e80-aa1f-4adc-bc9c-9eaf6de658f2	2025-11-17 12:51:13.861	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92203325	192.168.10.6
3e54227f-1ba4-4cbb-939c-5c847f61baf9	2025-11-17 12:51:13.861	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.92203325	192.168.10.6
f23dec69-5040-420d-81bb-68113900e41c	2025-11-17 12:51:43.87	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88212776	192.168.10.6
36a38a0b-1e39-4b36-8f68-ca4148c81bd2	2025-11-17 12:51:43.87	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88212776	192.168.10.6
f9bc16a2-e270-4851-8c77-c8b12ab70971	2025-11-17 12:52:14.061	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8784875	192.168.10.6
58286ee5-06a8-4f43-ab0e-33eeba0a2727	2025-11-17 12:52:14.061	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8784875	192.168.10.6
080fc79d-c98e-45df-9998-3a64e3ab88a9	2025-11-17 12:52:44.938	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86635447	192.168.10.6
9023bc11-f970-46c4-a2b6-467413a898c4	2025-11-17 12:52:44.938	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86635447	192.168.10.6
c3ee662a-78f3-47e7-a215-67364a4d5cf2	2025-11-17 12:55:19.427	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84990275	192.168.10.6
c7a94445-f3b6-4910-8732-12815d904430	2025-11-17 12:55:19.427	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84990275	192.168.10.6
b5f7a697-f255-4531-9931-59c2e11d5461	2025-11-17 12:55:52.576	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87828535	192.168.10.6
6dfae048-b304-45be-bd72-dcd923c4c8fb	2025-11-17 12:55:52.576	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87828535	192.168.10.6
c301ba4a-f37d-49a9-92cc-e61605f6737a	2025-11-17 12:56:23.76	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87526965	192.168.10.6
66197387-2a00-4582-9f1c-05f6941777a9	2025-11-17 12:56:23.76	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87526965	192.168.10.6
71f888bd-fd49-4523-a97f-001629a23c31	2025-11-17 13:02:13.087	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8534252	192.168.10.6
e8d3d5b2-2b1f-48df-80df-caa3c6e8814d	2025-11-17 13:02:13.087	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8534252	192.168.10.6
b38ea317-7f9f-4f71-8c86-aa3d8dc9a90e	2025-11-17 13:02:53.656	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91186625	192.168.10.6
6730ed40-5aee-42de-ba1e-d0c69aa22868	2025-11-17 13:02:53.656	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91186625	192.168.10.6
f26523f3-8bdf-4eea-a1eb-f84047e90b39	2025-11-17 13:05:08.931	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82833564	192.168.10.6
4fc97486-f91e-432c-b13c-25a854e1bc60	2025-11-17 13:05:08.931	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82833564	192.168.10.6
b3f5543c-0c97-4475-98f1-868cec5c66a6	2025-11-17 13:05:39.768	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91796494	192.168.10.6
c9bac24a-96b7-4559-b28e-8e60ec609338	2025-11-17 13:05:39.768	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91796494	192.168.10.6
bc34faed-3ab6-438b-aabf-0f7625d219f9	2025-11-17 13:12:38.748	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.93300045	192.168.10.6
9727cb87-d29e-47dc-9f4e-2bf5263e8937	2025-11-17 13:12:38.748	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.93300045	192.168.10.6
927e288c-e97d-42f5-98da-3d56d41e7d26	2025-11-17 13:14:07.836	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9033835	192.168.10.6
67b22b62-1dab-4686-ab93-a59eb447ab32	2025-11-17 13:14:07.836	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9033835	192.168.10.6
8e873dbd-f23c-4df2-8ff0-067f1189ef6f	2025-11-17 13:15:07.662	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86445594	192.168.10.6
16546fbb-8fab-41c7-aa1a-a44151077631	2025-11-17 13:15:07.662	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86445594	192.168.10.6
bfe07b05-7569-45cb-a02c-326947a78b94	2025-11-17 13:16:34.456	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.912356	192.168.10.6
556b0248-9085-4dc5-97a2-a478f55c3519	2025-11-17 13:16:34.456	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.912356	192.168.10.6
a8b130b0-e91c-40b2-bbc0-03f3329b1622	2025-11-17 13:27:13.075	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8844344	192.168.10.6
af52c2c6-5ad0-4195-9f1b-34541c80a5ef	2025-11-17 13:27:13.075	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8844344	192.168.10.6
c3804805-2e5e-42db-845e-bd5e9abe32a5	2025-11-17 13:27:43.08	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8411095	192.168.10.6
886f122b-9d62-4ee2-ad3a-1ef7556f7689	2025-11-17 13:27:43.08	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8411095	192.168.10.6
0b2ba35b-c5fc-4a33-9a65-7dec98a93c9a	2025-11-17 13:28:18.44	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8171022	192.168.10.6
5caae7d1-8a4e-4a22-b010-0cce9b5b9e54	2025-11-17 13:28:18.44	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8171022	192.168.10.6
25779177-426f-4aa7-92c1-39c3ba726a31	2025-11-17 13:28:53.975	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8266518	192.168.10.6
f7eaf802-7fc6-4b0f-9b65-6c42d9350fb2	2025-11-17 13:28:53.975	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8266518	192.168.10.6
fa5417bc-3422-4cb3-bef7-1669522bb8a0	2025-11-17 13:29:39.014	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9241528	192.168.10.6
48d484b9-743c-465b-bbc3-9aee9dddb8ac	2025-11-17 13:29:39.014	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9241528	192.168.10.6
962ff5ec-706c-42f9-9865-41d5d002386b	2025-11-17 12:56:54.728	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8916387	192.168.10.6
f26e77af-fda7-439d-b24c-827aa16fd6b4	2025-11-17 12:56:54.728	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8916387	192.168.10.6
857b349e-fb16-45a3-8151-7d4d23a99be9	2025-11-17 13:00:39.709	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82367796	192.168.10.6
6cb23e5e-e28a-4923-9621-e942a8e86a6b	2025-11-17 13:00:39.709	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82367796	192.168.10.6
700aca75-4c68-4e56-baea-3d5b63b8f0ad	2025-11-17 13:08:25.998	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83749086	192.168.10.6
80fc8f2a-e792-4ed9-9752-d8cc932435ee	2025-11-17 13:08:25.998	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83749086	192.168.10.6
5e86483b-33ef-44b9-b227-f9509c88ab00	2025-11-17 13:09:21.545	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9153107	192.168.10.6
bd88d1fe-a43d-463d-93fb-00895f6eea17	2025-11-17 13:09:21.545	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9153107	192.168.10.6
cca44bbc-9447-49d7-ac8a-af1c490a0872	2025-11-17 13:13:31.274	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9137107	192.168.10.6
f64bcbff-0278-43e7-8378-5b4ae2be2795	2025-11-17 13:13:31.274	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9137107	192.168.10.6
96a85883-dee3-4353-89f3-af0f2c9cb270	2025-11-17 13:30:10.037	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84635323	192.168.10.6
f5af61b5-180a-4e08-a37f-47addb568fc5	2025-11-17 13:30:10.037	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84635323	192.168.10.6
57c339ba-7b8f-4205-9497-1aff27f2f17f	2025-11-17 13:30:46.439	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9263093	192.168.10.6
dc2b62e7-2173-43e4-85c6-83b4acff7a20	2025-11-17 13:30:46.439	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9263093	192.168.10.6
d3ca0333-6423-408f-b089-217bc012d3b2	2025-11-17 04:31:31.952	\N	w-1111	0	ABNORMAL_CONNECT	UNSOLVED	작업자(1111) 통신안됨	\N	\N	1111
1a4cc92d-1da7-4ef3-b37e-98020a80d03a	2025-11-17 13:31:51.652	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9085101	192.168.10.6
dc497952-9f12-42aa-9259-2ed9175e0b71	2025-11-17 13:31:51.652	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9085101	192.168.10.6
d918acc9-9966-4897-ab2f-ac6a499ccbd6	2025-11-17 13:32:25.953	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8200431	192.168.10.6
501f84ef-3067-4cc9-ae11-96d82c74ffdf	2025-11-17 13:32:25.953	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8200431	192.168.10.6
1abc664b-8f49-47d3-8839-381cc63a6a3e	2025-11-17 04:33:00.469	\N	w-1111	0	ABNORMAL_CONNECT	UNSOLVED	작업자(1111) 통신안됨	\N	\N	1111
3adeaf1e-fc46-4332-9b79-d2d0ddd6ab62	2025-11-17 13:33:22.712	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85890627	192.168.10.6
b8c2dece-2b55-4f67-b73c-b7a2c9e3697c	2025-11-17 13:33:22.712	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85890627	192.168.10.6
645f1198-6b43-4b83-a381-6de840bb11c1	2025-11-17 13:34:03.488	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86801285	192.168.10.6
63869ada-44c9-4f5e-afd0-2251117375e5	2025-11-17 13:34:03.488	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86801285	192.168.10.6
59fbc81e-be77-4a52-996a-1cbb1448dba8	2025-11-17 13:35:59.139	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81071115	192.168.10.6
deeb3772-3849-4109-9de5-2e7bbd353e51	2025-11-17 13:35:59.139	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81071115	192.168.10.6
8c02c8e8-7025-4e0e-9987-5faca81e9f0b	2025-11-17 13:36:37.689	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89637583	192.168.10.6
1c111d8a-ba99-46e5-ae19-fed81a2a81e3	2025-11-17 13:36:37.689	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89637583	192.168.10.6
87f373a4-218f-40a6-bfc9-a94a08ee2408	2025-11-17 13:37:22.761	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8843186	192.168.10.6
043d0e17-665e-4b33-83c2-1904b1bc8483	2025-11-17 13:37:22.761	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8843186	192.168.10.6
fef4fc9c-d1eb-48d9-8add-1b0cb88333b8	2025-11-17 13:38:11.954	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8900237	192.168.10.6
25f9350f-16d4-43f0-9bf2-d4c25a002656	2025-11-17 13:38:11.954	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8900237	192.168.10.6
b92b2d36-9bdc-4528-83ef-3d70c4bc7800	2025-11-17 13:38:42.055	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8939305	192.168.10.6
47ca3f99-1d11-4c22-9290-c9b9e6501e9e	2025-11-17 13:38:42.055	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8939305	192.168.10.6
64422f64-2b92-480d-9d58-fa1c0af61766	2025-11-17 13:39:29.344	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90568787	192.168.10.6
53d86df8-27b7-496a-95f5-b8445cecede6	2025-11-17 13:39:29.344	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90568787	192.168.10.6
c8a80229-8d3a-4788-9553-76d8599c1c3c	2025-11-17 13:39:29.344	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90568787	192.168.10.6
2393a113-07a9-4e61-8c2a-91feab9a67f7	2025-11-17 13:42:20.589	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8392215	192.168.10.6
3ba9fc35-3bd8-4588-9a54-f99ebe395204	2025-11-17 13:42:20.589	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8392215	192.168.10.6
fb1b7e4a-4d6c-4e77-8c5c-f87a550ec833	2025-11-17 13:42:20.589	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8392215	192.168.10.6
113831a2-2673-429e-82ea-8432ed4fbc63	2025-11-17 13:43:29.157	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9019168	192.168.10.6
0db29ff2-4086-41cd-b590-b4ae75d3875b	2025-11-17 13:43:29.157	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9019168	192.168.10.6
a39bb909-530d-4213-8e2a-a95faee0a668	2025-11-17 13:43:29.157	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9019168	192.168.10.6
a0a15afc-63ed-4981-a4fe-52715983362c	2025-11-17 13:44:12.088	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85704875	192.168.10.6
d3e65153-4736-4f1a-b31d-c245d9a575f1	2025-11-17 13:44:12.088	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85704875	192.168.10.6
b191f7f6-1e7c-4588-ac09-09011af4e47d	2025-11-17 13:44:12.088	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85704875	192.168.10.6
1b379bee-f470-4899-a99f-e52ae72a5fdc	2025-11-17 13:46:03.412	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.938267	192.168.10.6
23447968-c08f-45b2-8dd9-7d66576af220	2025-11-17 13:46:03.412	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.938267	192.168.10.6
98d1246b-90fb-4ade-95fe-124562b88a7d	2025-11-17 13:46:03.412	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.938267	192.168.10.6
5de60254-502f-41db-b43e-0e643dbdac76	2025-11-17 13:47:13.211	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8111537	192.168.10.6
e3061247-4af4-4715-937f-364f83b82dd5	2025-11-17 13:47:13.211	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8111537	192.168.10.6
0bcfa33a-9807-45e6-b4b1-006259def601	2025-11-17 13:47:13.211	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8111537	192.168.10.6
24c5bd8a-966f-467e-85f6-08e829017273	2025-11-17 13:52:44.175	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9010714	192.168.10.6
4d63be39-92d7-48b1-9488-501434db9431	2025-11-17 13:52:44.175	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9010714	192.168.10.6
8af88f8b-8936-44e1-9d4c-69401ba3b568	2025-11-17 13:52:44.175	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9010714	192.168.10.6
86e60806-3b15-49a0-85bb-e0c8f7ae2b34	2025-11-17 13:53:28.144	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6099676	192.168.10.6
aff87f28-61f6-4dce-9923-657bb4857941	2025-11-17 13:53:28.144	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6099676	192.168.10.6
8d5c75c5-ecc5-4e3c-bf7a-658664bfe8a4	2025-11-17 13:53:28.144	구역7	CCTV-3	0	ABNORMAL_CCTV_1	UNSOLVED	(구역7) 에서 헬멧 미착용 발생	\N	0.6099676	192.168.10.6
acf8e2f3-82a4-47c9-842e-eafba4346a45	2025-11-17 13:53:59.219	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8969191	192.168.10.6
d664f497-5744-43bd-ba5c-30ae9246176a	2025-11-17 13:53:59.219	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8969191	192.168.10.6
caf0f0fb-6535-4ede-9917-5e84447a801b	2025-11-17 13:53:59.219	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8969191	192.168.10.6
b9ca31ca-1206-4f24-b09f-32f16a044d34	2025-11-17 13:55:34.607	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9144619	192.168.10.6
fa264aa0-45dc-4779-bc12-0fd718b8ab87	2025-11-17 13:55:34.607	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9144619	192.168.10.6
5d8f1449-37b0-45f8-91a8-5990a4073ee5	2025-11-17 13:56:22.833	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87460774	192.168.10.6
dfaed46c-86f7-4d5c-a9d9-9dc3ea96bc8a	2025-11-17 13:56:22.833	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87460774	192.168.10.6
5a03a494-d978-4dc4-87ec-b2e403a5b4ca	2025-11-17 13:56:53.885	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84277725	192.168.10.6
2ae8d459-388e-4f65-97c0-b8379dda9545	2025-11-17 13:56:53.885	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84277725	192.168.10.6
098479b5-8b96-473a-be82-354f3312d972	2025-11-17 13:57:23.886	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.94056875	192.168.10.6
84a4891d-73e7-45fd-bca1-8cdc97b31513	2025-11-17 13:57:23.886	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.94056875	192.168.10.6
955978f8-03af-4340-aa8d-a27ad2c954ad	2025-11-17 13:58:53.867	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9349893	192.168.10.6
4eceadfa-87e8-44dc-99b2-5b8050ef52ee	2025-11-17 13:58:53.867	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9349893	192.168.10.6
f52ed646-2d8a-4049-ae6f-0591f9cba468	2025-11-17 13:59:48.664	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8849131	192.168.10.6
96f3e08b-df24-4bbf-b6df-d8c35cc7d119	2025-11-17 13:59:48.664	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8849131	192.168.10.6
ef75b62b-e651-4ac9-9caa-ef9e63fc3b70	2025-11-17 14:00:19.573	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84082174	192.168.10.6
56ef7fd2-7ccf-4756-bea9-c71c1cd5546e	2025-11-17 14:00:19.573	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84082174	192.168.10.6
21797d4b-af56-4e84-a10c-a8472f1c7b6b	2025-11-17 13:51:57.2	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88488674	192.168.10.6
887a960c-6483-4d67-acdd-fd84c48b765c	2025-11-17 13:51:57.2	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88488674	192.168.10.6
972c6872-965c-43c0-8cdb-329eb23f6212	2025-11-17 13:51:57.2	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88488674	192.168.10.6
b34774d1-b976-4d13-98d2-3c607d9dfa74	2025-11-17 13:53:27.173	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80947787	192.168.10.6
082496f0-9239-4329-bc4c-04319879d2ec	2025-11-17 13:53:27.173	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80947787	192.168.10.6
df0a52bb-404c-4852-b273-ecba4fd07a37	2025-11-17 13:53:27.173	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80947787	192.168.10.6
2c19dbe1-8c67-4238-bebb-24e3f5bddcd4	2025-11-17 13:54:31.379	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9324318	192.168.10.6
b1f34e1c-6525-4345-9985-e2dc247e9941	2025-11-17 13:54:31.379	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9324318	192.168.10.6
4f349eb0-d795-4243-be43-c2363899e583	2025-11-17 13:54:31.379	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9324318	192.168.10.6
0f0453e7-2f74-4ba0-a24c-37f586d80748	2025-11-17 13:55:02.429	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8302361	192.168.10.6
555d8004-740e-44cd-ad30-cb45af9b513c	2025-11-17 13:55:02.429	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8302361	192.168.10.6
d5e2548b-7e26-4cdd-b848-c1d30428f714	2025-11-17 13:55:02.429	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8302361	192.168.10.6
84d3fb9e-09de-47f1-af3f-3d14c0a9b901	2025-11-17 14:00:49.78	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8641062	192.168.10.6
dda1b9e5-55a0-4d57-bd15-4573d0a6eb87	2025-11-17 14:00:49.78	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8641062	192.168.10.6
86edb7f0-5954-4aa7-9130-de1ca5eac13c	2025-11-17 14:01:20.801	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9223376	192.168.10.6
ce5b9962-4630-4ec2-afef-c85acf9c4775	2025-11-17 14:01:20.801	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9223376	192.168.10.6
b3968c4b-f10f-42e8-9b44-ec43d68d842c	2025-11-17 14:02:07.831	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88557565	192.168.10.6
5c6efe95-5533-4d1a-82ee-30f51f2e496f	2025-11-17 14:02:07.831	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88557565	192.168.10.6
cb7bf1fe-0cbf-4546-bb22-14df45e697bf	2025-11-17 14:04:07.844	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90731806	192.168.10.6
f010ce24-9978-487b-b3a0-95a1026f86f8	2025-11-17 14:04:07.844	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.90731806	192.168.10.6
b53484ee-07c5-47aa-ae42-e3bffbe912c8	2025-11-17 14:09:25.3	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9265524	192.168.10.6
885a4864-9bf3-4507-bce4-403fdec9ac17	2025-11-17 14:09:25.3	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9265524	192.168.10.6
9e4967e0-8809-4afe-8eca-a192246cf3de	2025-11-17 14:09:57.387	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87370396	192.168.10.6
c07f8b7b-7ec7-419c-9c09-ad69289288c2	2025-11-17 14:09:57.387	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87370396	192.168.10.6
892ec215-13f0-4e90-a82a-731668dacea2	2025-11-17 14:10:27.389	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87166864	192.168.10.6
b84146b0-fe10-4d55-b645-4b4e8242b743	2025-11-17 14:10:27.389	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87166864	192.168.10.6
911dcb83-8669-4944-8d89-505e40cb04f8	2025-11-17 14:11:39.287	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88432455	192.168.10.6
4d78c90d-de6b-481e-8289-605125712b64	2025-11-17 14:11:39.287	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88432455	192.168.10.6
6788d342-32e9-477a-881c-51b28d77e105	2025-11-17 14:12:12.317	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82440495	192.168.10.6
24805897-6c1f-4a8b-8f4b-05c1102c5e7c	2025-11-17 14:12:12.317	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82440495	192.168.10.6
9237ab79-de51-43bd-ae45-38a8e29fd491	2025-11-17 14:57:38.997	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83759445	192.168.10.6
6367e7d4-4c81-4b8c-9786-00854c8b5766	2025-11-17 14:25:45.788	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91421056	192.168.10.6
f98ebfcf-1a88-4ba7-83c6-4fe71f23e89f	2025-11-17 14:24:43.627	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8485121	192.168.10.6
d7c6dea9-3b26-42d3-98ad-21e3dda0dc1c	2025-11-17 14:46:30.395	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82396823	192.168.10.6
792bf834-c0db-4cd6-9feb-428aeca762ae	2025-11-17 14:27:34.409	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8224661	192.168.10.6
8009b0b8-4a46-49a7-a75c-5c95cb80dffb	2025-11-17 14:49:11.018	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.834294	192.168.10.6
9276e0b7-b2c8-42ec-b418-8a6e7ab208a0	2025-11-17 14:48:33.506	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82742286	192.168.10.6
78dfec26-e9cf-413a-8b55-95e33aeac7cc	2025-11-17 14:47:31.534	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83410716	192.168.10.6
a630b792-3ee8-437e-acbe-f2462fab2ee3	2025-11-17 14:26:48.251	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8024912	192.168.10.6
aaf31a44-98ff-4707-b7c3-652a4d21aa59	2025-11-17 14:48:33.506	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82742286	192.168.10.6
9da15d50-54f5-4163-8e5e-2bec7f57a858	2025-11-17 15:04:17.58	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9176618	192.168.10.6
b74320f8-3163-469f-af24-20e04b78088f	2025-11-17 14:56:37.98	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8145509	192.168.10.6
64dee772-f0ee-4693-b1aa-7096d3ab81e9	2025-11-17 14:47:01.365	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82378113	192.168.10.6
5f93b7ce-1fe7-49b9-a43a-3dd3167da1ea	2025-11-17 14:56:37.98	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8145509	192.168.10.6
132cc465-fb52-4b61-b747-36e0a99f0375	2025-11-17 14:23:05.229	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8095258	192.168.10.6
21397a3b-1d51-48fc-933f-7c367d4dd405	2025-11-17 14:41:23.928	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81810683	192.168.10.6
3f37510d-cc60-4b13-9e94-64df87da64a3	2025-11-17 14:49:42.003	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8049864	192.168.10.6
99ad1f4d-2c6b-44a2-8835-24904c4b61b1	2025-11-17 15:01:02.409	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83035517	192.168.10.6
011b5488-846d-4ec5-a804-9c17a5422728	2025-11-17 14:57:08.861	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8217009	192.168.10.6
9ff923d0-63e5-45ba-b22a-577a6f48c55e	2025-11-17 15:01:02.409	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83035517	192.168.10.6
ae23e686-7693-47e4-ab48-15847095734c	2025-11-17 14:33:55.923	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8027069	192.168.10.6
411423fc-20d1-499d-a1f4-f06a44f05346	2025-11-17 14:23:38.415	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8723603	192.168.10.6
201085e9-1d68-48ca-b07a-08f6bc366692	2025-11-17 14:52:45.299	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8079555	192.168.10.6
c3c4dc6f-1b7e-4ccc-bf41-17c5df6f7e49	2025-11-17 14:47:01.365	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82378113	192.168.10.6
b1c4908f-dad6-410d-badb-760010473d77	2025-11-17 15:04:17.58	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9176618	192.168.10.6
3273ec6f-2281-4dfe-bbdc-88fe8e83c556	2025-11-17 14:25:13.783	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81800884	192.168.10.6
75a07cf6-8fdd-46de-9e6a-472162705125	2025-11-17 14:41:23.928	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81810683	192.168.10.6
f4848a9f-b253-4ec0-9ded-41678ec48302	2025-11-17 14:50:45.291	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86444515	192.168.10.6
2b5ce25e-e71c-4c7d-a95c-dacd2768f439	2025-11-17 14:29:32.326	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8061804	192.168.10.6
80059ef8-3823-44ce-8b27-ecc27b15b903	2025-11-17 15:14:37.805	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83595383	192.168.10.6
c5ac769a-b9cd-4d79-9952-34dd59369afe	2025-11-17 15:10:42.005	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83251727	192.168.10.6
2bfff75e-6d21-4037-9b26-25027c45ee50	2025-11-17 14:46:30.395	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82396823	192.168.10.6
a7e4214c-744d-49d3-8879-ec52419de09c	2025-11-17 14:51:48.406	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.857592	192.168.10.6
14be23c1-f823-46ab-93e2-94d0211d2261	2025-11-17 15:02:20.605	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9388304	192.168.10.6
b56a8687-c10a-43bc-a326-fcd2c4a9eaf1	2025-11-17 15:15:41.171	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87028277	192.168.10.6
89cfdd7b-fe2c-4d95-96fb-b459a913896e	2025-11-17 14:50:45.291	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86444515	192.168.10.6
49b189a5-3634-4200-8e92-070821f08979	2025-11-17 14:57:08.861	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8217009	192.168.10.6
3a8b7628-09ce-4e7f-a046-fd9e9449577e	2025-11-17 15:02:50.637	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8582892	192.168.10.6
7c0c5ab6-3922-4f49-af57-dc130e2d41a7	2025-11-17 15:15:41.171	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87028277	192.168.10.6
4a971251-f05a-443a-b468-12e2c7c02431	2025-11-17 14:57:38.997	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83759445	192.168.10.6
3c704881-f7ca-4aeb-b843-d18e72c8e24d	2025-11-17 14:53:32.363	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91060776	192.168.10.6
e28fb241-a0ea-4a4c-a680-aaff6e470e58	2025-11-17 14:49:42.003	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8049864	192.168.10.6
88309370-fc00-4fb4-8038-98a66b462646	2025-11-17 14:51:48.406	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.857592	192.168.10.6
8e1e16e7-30a8-47d2-804e-09a4116c967f	2025-11-17 15:03:21.775	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8934634	192.168.10.6
0a584645-3b60-4aec-8d68-c483213c86ae	2025-11-17 15:12:59.419	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86872226	192.168.10.6
67da3658-fe88-434d-8e28-11b82a3db9e1	2025-11-17 14:29:32.326	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8061804	192.168.10.6
7bf0bedb-7d84-418e-b094-2c6ad18108b9	2025-11-17 14:16:58.424	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89613783	192.168.10.6
17f96247-1b5c-46aa-893d-583eb47984a7	2025-11-17 14:56:07.841	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8256589	192.168.10.6
4a23a7ef-8d02-4deb-958e-7efd8ca3b12f	2025-11-17 14:48:02.417	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81824654	192.168.10.6
5856b077-ae2a-4121-9c66-139955cbcc69	2025-11-17 15:12:59.419	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86872226	192.168.10.6
c63ad792-877d-472e-962c-3fc7d067991c	2025-11-17 14:48:02.417	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81824654	192.168.10.6
fb92321f-c495-4e39-96ae-20aa71123766	2025-11-17 15:10:42.005	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83251727	192.168.10.6
ee3c193e-96e1-4074-a16f-dccf5849c889	2025-11-17 15:09:41.13	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85178554	192.168.10.6
e6848450-5ff4-46a8-9ca8-2b9c443f29c7	2025-11-17 15:12:18.68	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8824474	192.168.10.6
f2d17977-8790-42cf-92eb-bba003bd4f58	2025-11-17 15:10:12.002	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8151767	192.168.10.6
e69e4ed3-7782-452f-ad31-3ad97ef91e6a	2025-11-17 15:12:18.68	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8824474	192.168.10.6
3814d6a8-89f1-47aa-93c7-c52b24497ec9	2025-11-17 15:11:48.474	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8195992	192.168.10.6
7a423873-16ce-45e2-8fae-42213664558d	2025-11-17 14:31:55.933	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80572903	192.168.10.6
ee086b69-dc27-4eea-b070-c0cc3f5ffe78	2025-11-17 15:15:08.871	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8213369	192.168.10.6
7694c70f-035b-49fe-9d1f-4818906948ba	2025-11-17 15:15:08.871	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8213369	192.168.10.6
7dfabb48-5688-4e01-93c7-43d37de9937d	2025-11-17 15:02:20.605	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9388304	192.168.10.6
38ac07b3-aae2-4533-9d4e-f5bc6535c792	2025-11-17 15:09:10.204	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.826405	192.168.10.6
8daaaed3-005e-4fea-97e9-b2628c8657a4	2025-11-17 14:52:45.299	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8079555	192.168.10.6
175aff81-6f2a-4964-9343-3cb5814ac835	2025-11-17 14:55:37.801	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8194438	192.168.10.6
249b2184-9594-4b17-b5ea-6e428f6f6012	2025-11-17 15:03:21.775	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8934634	192.168.10.6
3c113d6c-6694-48d1-92df-e4448599c2dc	2025-11-17 14:31:55.933	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.80572903	192.168.10.6
46c6633d-24c4-4003-a379-603e0c6bf9b7	2025-11-17 14:33:55.923	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8027069	192.168.10.6
33014ec6-44fe-4f6e-8629-0802d4cb6e36	2025-11-17 14:51:00.298	구역7	CCTV-3	0	ABNORMAL_CCTV_3	UNSOLVED	(구역7) 에서 화재 발생	\N	0.354685	192.168.10.6
8ffd2a4e-c8f4-437a-95d3-67c9e91d183f	2025-11-17 15:14:06.712	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86647636	192.168.10.6
dab58fc6-fba6-4311-8193-adb3f172c33a	2025-11-17 14:55:37.801	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8194438	192.168.10.6
526cf591-53fd-48ba-b337-232d4535b884	2025-11-17 14:50:15.262	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8157472	192.168.10.6
eafb47e4-8f38-425b-9e0a-dce78d888453	2025-11-17 15:10:12.002	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8151767	192.168.10.6
31a54b3c-68cd-42d6-8095-917c7bf89e8c	2025-11-17 14:50:15.262	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8157472	192.168.10.6
473496d4-707a-425c-9a51-f74b7fa670c3	2025-11-17 14:53:32.363	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91060776	192.168.10.6
8d4a678c-a242-4083-a378-551b40836870	2025-11-17 15:09:41.13	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85178554	192.168.10.6
645606b4-a9a6-4087-a281-d104814c766b	2025-11-17 14:24:12.767	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8291702	192.168.10.6
15fc5bb9-050a-4175-b889-571702b80ee3	2025-11-17 14:51:00.298	구역7	CCTV-3	0	ABNORMAL_CCTV_3	UNSOLVED	(구역7) 에서 화재 발생	\N	0.354685	192.168.10.6
eae01221-4e23-4f95-9eaf-783cee4e3a89	2025-11-17 14:56:07.841	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8256589	192.168.10.6
97eafc83-737f-4d9c-a7e6-e3e14df64399	2025-11-17 15:14:06.712	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.86647636	192.168.10.6
670989b8-d346-4b13-a7f8-3231ca5113c4	2025-11-17 14:49:11.018	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.834294	192.168.10.6
68f8534d-dd94-45e6-997c-819f91da08f0	2025-11-17 15:11:12.041	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8656393	192.168.10.6
1609bb86-3d60-4eb2-93a3-3d0e2069deb3	2025-11-17 14:47:31.534	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.83410716	192.168.10.6
dec14bc5-c231-4ab3-aa0f-607c3388a2c0	2025-11-17 14:16:10.36	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8872829	192.168.10.6
654d1096-b251-4e5e-b3ae-545704efb4da	2025-11-17 15:02:50.637	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8582892	192.168.10.6
495ebd31-898d-4d62-8648-c4d1997de9c1	2025-11-17 15:09:10.204	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.826405	192.168.10.6
8b5b34c2-05fb-4cf9-bcab-8d9d4ec26f81	2025-11-17 15:11:12.041	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8656393	192.168.10.6
328b7ea2-0a4c-4f6e-a6b2-11ea5fa272a5	2025-11-17 15:11:48.474	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8195992	192.168.10.6
fe1aaf30-20eb-4598-b759-d56105555e00	2025-11-17 15:18:42.119	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.846799	192.168.10.6
de1bbb1d-f131-4eb3-aae6-864325004f28	2025-11-17 15:18:42.119	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.846799	192.168.10.6
07141a55-a230-4ee3-8dd2-d605776607b5	2025-11-17 15:18:42.119	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.846799	192.168.10.6
a4467786-796a-4dc3-ac51-266e904f6f75	2025-11-17 15:19:33.553	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81428826	192.168.10.6
f8477bee-8f07-4559-a080-d3e93baa0aa4	2025-11-17 15:19:33.553	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81428826	192.168.10.6
be637e95-aca4-4435-a41b-8d9815025075	2025-11-17 15:19:33.553	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.81428826	192.168.10.6
1a0d73d3-5086-4e4f-859c-3da441fc0978	2025-11-17 15:14:37.805	구역7	CCTV-3	0	ABNORMAL_CCTV_2	SOLVED	(구역7) 에서 침입 발생	\N	0.83595383	192.168.10.6
56380a91-3c56-4f15-93c5-e029e9971dd5	2025-11-17 15:21:17.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85196	192.168.10.6
de39a453-c712-4470-9184-419c758306bf	2025-11-17 15:21:17.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85196	192.168.10.6
c41a453e-0c02-4404-aa21-63d7125ef4d6	2025-11-17 15:21:17.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.85196	192.168.10.6
0128b34c-7876-46e8-98b9-78ca6752f486	2025-11-17 15:22:51.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8026061	192.168.10.6
9003d49e-a34a-4eaa-9bbb-56e899b85b7c	2025-11-17 15:22:51.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8026061	192.168.10.6
418e3885-cff0-4af0-8cc0-994c687ec742	2025-11-17 15:22:51.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8026061	192.168.10.6
627b55eb-bd5b-461c-b93b-7672956ee3c8	2025-11-17 15:25:50.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8737451	192.168.10.6
cc3b8708-756f-4461-80d8-0508571ee267	2025-11-17 15:25:50.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8737451	192.168.10.6
37622eda-5b97-4390-9ce3-2bb8e4fc6fed	2025-11-17 15:25:50.708	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8737451	192.168.10.6
fbc2db68-623c-4a01-986d-2ea752d62fbe	2025-11-17 15:27:20.821	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9196949	192.168.10.6
118786fc-c5a3-4b3b-9fa4-15ac87decab6	2025-11-17 15:27:20.821	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9196949	192.168.10.6
2c5216d9-724c-45ab-9512-fa82719c8b06	2025-11-17 15:27:20.821	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9196949	192.168.10.6
e5cdd21a-88f3-446e-aa14-09de44f6bde0	2025-11-17 15:28:14.271	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8604816	192.168.10.6
8c256577-d7d5-4c82-a142-6d0fe06dfaaa	2025-11-17 15:28:14.271	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8604816	192.168.10.6
6a1c6cf8-eb89-43c5-88cf-14f8d7426599	2025-11-17 15:28:14.271	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8604816	192.168.10.6
94e52f45-d791-470c-86a5-107d8314f402	2025-11-17 15:30:50.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84155834	192.168.10.6
470cd2d4-61de-4c33-bbac-da03b0cc657d	2025-11-17 15:30:50.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84155834	192.168.10.6
17b08955-50c8-4550-bc9e-ac58409dc285	2025-11-17 15:30:50.793	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.84155834	192.168.10.6
568a5776-e86f-44fa-b01b-8314b5422cb5	2025-11-17 15:32:24.926	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87252855	192.168.10.6
2ff0fdc2-eab2-43ad-bb57-2af1cea9ecc2	2025-11-17 15:32:24.926	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87252855	192.168.10.6
c2ab9da8-54d7-4378-80e3-7d7926acd027	2025-11-17 15:34:10.115	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8081359	192.168.10.6
c9425708-db73-4870-bcb5-4c46bcb4bd42	2025-11-17 15:34:10.115	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8081359	192.168.10.6
a84d4f17-f1b3-4ffc-9122-bac97a01874d	2025-11-17 15:35:15.507	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8504766	192.168.10.6
41d133e8-f36d-4603-b072-27ec021690e1	2025-11-17 15:35:15.507	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8504766	192.168.10.6
a0957951-562b-423a-af9f-7b9dc7127770	2025-11-17 15:36:02.442	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9122911	192.168.10.6
d61230f8-1370-456c-a4ba-3563af15b223	2025-11-17 15:36:02.442	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9122911	192.168.10.6
55f4cc90-afce-49e7-8991-8a2b7463bc82	2025-11-17 06:45:04.859	\N	w-1111	0	ABNORMAL_CONNECT	UNSOLVED	작업자(1111) 통신안됨	\N	\N	1111
844e3cf0-f494-4522-90c8-04d7580295f5	2025-11-17 15:54:38.064	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89621985	192.168.10.6
bf2116e5-3e9d-4311-a401-5b3125458a7f	2025-11-17 15:54:38.064	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89621985	192.168.10.6
2d8b83c1-b4cb-4b5d-8323-2d351c504576	2025-11-17 15:57:46.433	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89384675	192.168.10.6
ee9446ef-7139-4398-85a0-f470df16393f	2025-11-17 15:57:46.433	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.89384675	192.168.10.6
fdccfba8-6963-4747-afe5-a2ccfaed5a0a	2025-11-17 15:59:18.63	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9220593	192.168.10.6
be329909-1eda-4e49-811c-1868e4c68ef4	2025-11-17 15:59:18.63	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9220593	192.168.10.6
344a2d69-e9fb-4083-aad0-85fcf66c79c8	2025-11-17 16:02:23.025	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8131373	192.168.10.6
9c87d66b-43f6-44fa-a47a-4d72d32dbf3e	2025-11-17 16:02:23.025	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8131373	192.168.10.6
b459e3e9-f89b-4d22-bc90-4b7079fe571b	2025-11-17 16:02:23.025	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8131373	192.168.10.6
ea682a2f-b35e-4501-95af-aa746d576d2d	2025-11-17 16:02:54.155	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8411825	192.168.10.6
1fc631cc-6a2f-4f34-ac5a-e6ebb79e348e	2025-11-17 16:02:54.155	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8411825	192.168.10.6
8019d5ab-4899-424b-a9ed-560048b85467	2025-11-17 16:02:54.155	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8411825	192.168.10.6
aa8e5d1f-19f1-458a-95c9-547417fa44fe	2025-11-17 16:03:25.191	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8476522	192.168.10.6
ec392b5e-7810-4021-9dd9-a2b3be546085	2025-11-17 16:03:25.191	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8476522	192.168.10.6
c697b439-7c38-4936-bbe1-8083f31efaee	2025-11-17 16:03:25.191	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8476522	192.168.10.6
2de92b3b-20ff-4a40-9173-d5cbb40402c8	2025-11-17 16:03:56.26	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9276901	192.168.10.6
e4ed4c2c-22bc-4c15-b99f-35cf47b19bec	2025-11-17 16:03:56.26	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9276901	192.168.10.6
cd53b150-6272-4494-bb7d-61fcb1ea5a7c	2025-11-17 16:03:56.26	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9276901	192.168.10.6
a00e4fc6-565e-4cef-ad02-8e6a97220408	2025-11-17 16:04:27.314	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.917831	192.168.10.6
365bcc90-4276-4770-9d1d-0695996b6044	2025-11-17 16:04:27.314	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.917831	192.168.10.6
2f229fa3-1d40-49ef-a986-d66281158fb9	2025-11-17 16:04:27.314	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.917831	192.168.10.6
587b89c6-7d38-4dbc-b64e-c07237b82870	2025-11-17 16:04:57.358	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8715547	192.168.10.6
15ffad32-6e35-4316-96d4-5f4dbc4b5132	2025-11-17 16:04:57.358	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8715547	192.168.10.6
d573c9d2-08ef-4dae-a92d-653d86a8fa4c	2025-11-17 16:04:57.358	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8715547	192.168.10.6
10df1097-0367-4b29-aae3-95096f31320a	2025-11-17 16:05:28.317	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87171423	192.168.10.6
cb25cc04-71ab-4ef0-ab95-3cbefd22406a	2025-11-17 16:05:28.317	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87171423	192.168.10.6
cf1d48f3-84a8-4ae1-b069-660fa81ddd86	2025-11-17 16:05:28.317	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87171423	192.168.10.6
d6c78f5d-fae4-4fb9-bbdf-257a8a95600f	2025-11-17 16:05:58.518	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87790227	192.168.10.6
c42568ec-b365-437e-8fae-14162331aa5d	2025-11-17 16:05:58.518	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87790227	192.168.10.6
51d7702c-d143-45c6-85c2-7b9f5e1bb4ef	2025-11-17 16:05:58.518	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87790227	192.168.10.6
1598d437-ae14-4b51-96de-9d1b5553c6b2	2025-11-17 16:13:28.434	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82239455	192.168.10.6
0530d90a-386b-43b8-906d-ae5a558007a7	2025-11-17 16:13:28.434	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82239455	192.168.10.6
0312701a-b226-438e-a897-b9edfb9dc56a	2025-11-17 16:13:28.434	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.82239455	192.168.10.6
f81bc42f-abf2-41c6-a5cb-ab196004fcb6	2025-11-17 16:15:35.995	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8047347	192.168.10.6
3c837dd8-4247-4926-92fe-8e49d492f463	2025-11-17 16:15:35.995	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8047347	192.168.10.6
278923d8-2c08-4a39-b808-7d906a9bbb5c	2025-11-17 16:15:35.995	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8047347	192.168.10.6
593e467a-fa4f-438b-88bf-69342ec6bc80	2025-11-17 16:06:30.702	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87135285	192.168.10.6
eb04b7f6-d02e-4a90-8f88-002db653fac3	2025-11-17 16:06:30.702	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87135285	192.168.10.6
ef794baa-b754-4e06-a641-c22c761d5312	2025-11-17 16:06:30.702	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87135285	192.168.10.6
9348dd09-0d77-4a02-b7e0-a3b9b2883357	2025-11-17 16:07:56.153	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87159723	192.168.10.6
5acc201c-fd6a-40e9-bc18-bdc95993bffe	2025-11-17 16:07:56.153	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87159723	192.168.10.6
be10f37f-314a-44b7-96c8-7f6215f61113	2025-11-17 16:07:56.153	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.87159723	192.168.10.6
aedb1abf-4071-49bd-b809-3703b55b78d9	2025-11-17 16:08:27.241	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8879681	192.168.10.6
c85eb538-5067-41a8-ba96-23cd7f4f4ea4	2025-11-17 16:08:27.241	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8879681	192.168.10.6
a57e0332-b0c3-45fc-8c7f-b2fc2c83bb7a	2025-11-17 16:08:27.241	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8879681	192.168.10.6
db5b99fa-64a8-4d9b-8888-8abb59a5bc3b	2025-11-17 16:12:32.641	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8435302	192.168.10.6
b643706b-e08d-4436-9c0b-47bd36ae8582	2025-11-17 16:12:32.641	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8435302	192.168.10.6
ef7d0a36-1788-4e91-b45e-e4dab9c94506	2025-11-17 16:12:32.641	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8435302	192.168.10.6
f67e2f00-daab-4de0-9fda-94f6a21f9590	2025-11-17 16:14:26.268	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88894624	192.168.10.6
3b3b16e1-fd26-4fa2-92b5-333a8bda17a5	2025-11-17 16:14:26.268	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88894624	192.168.10.6
40fe8b4d-75fa-475d-9d1b-5140ad55f0cb	2025-11-17 16:14:26.268	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.88894624	192.168.10.6
ed51a302-2c61-44aa-95fd-295c81ea3b91	2025-11-17 16:14:57.31	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8460851	192.168.10.6
aea00b3f-d141-4aa8-9db1-f0cd6307279d	2025-11-17 16:14:57.31	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8460851	192.168.10.6
6e0bafbc-f4ac-40ca-b2a5-e8297cb3bc24	2025-11-17 16:14:57.31	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8460851	192.168.10.6
b71285fe-4cab-4556-b5b1-067a2838aa7b	2025-11-17 16:09:40.112	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8265813	192.168.10.6
276b9901-478c-4f29-ae3d-a1d7327b33ee	2025-11-17 16:09:40.112	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8265813	192.168.10.6
d35f5b18-377a-4312-81d1-8fb43e4ef214	2025-11-17 16:09:40.112	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8265813	192.168.10.6
4dd6f478-a01e-4d1e-9f9e-91cbad7c7184	2025-11-17 16:10:45.419	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.94403285	192.168.10.6
7046e846-2799-4445-9fa8-c6e91a4c4b38	2025-11-17 16:10:45.419	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.94403285	192.168.10.6
56c16f31-771c-4ecc-bcd1-d2c469e7299e	2025-11-17 16:10:45.419	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.94403285	192.168.10.6
6dacf84e-8fa2-4af2-a04a-d74731cd4425	2025-11-17 16:17:31.789	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91582847	192.168.10.6
aad94597-bb9e-4100-91d2-b700b4dbd1b0	2025-11-17 16:17:31.789	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91582847	192.168.10.6
c60054fa-ea2d-427f-be51-79cdea0990f2	2025-11-17 16:17:31.789	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.91582847	192.168.10.6
34284fea-ed87-45cd-b6fb-aa592b39b440	2025-11-17 16:18:03.8	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8020795	192.168.10.6
baf9e69a-ba00-4bf9-9ea1-054e2181ca64	2025-11-17 16:18:03.8	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8020795	192.168.10.6
66b31593-ce01-4241-9797-5fc6236fe4fa	2025-11-17 16:18:03.8	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8020795	192.168.10.6
23734411-81f5-4892-95da-ad25caf3e961	2025-11-17 16:20:29.746	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8293144	192.168.10.6
5bb3c055-68e3-4908-8124-e17fd38f8b5b	2025-11-17 16:20:29.746	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8293144	192.168.10.6
bf527a01-9da0-4f33-9488-81b7fc44523e	2025-11-17 16:20:29.746	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8293144	192.168.10.6
7c85aed5-15ed-4987-b341-f2f946abce7c	2025-11-17 16:21:23.267	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8597367	192.168.10.6
f5b80348-b24e-43ba-952f-07330eb527ff	2025-11-17 16:21:23.267	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8597367	192.168.10.6
c44aa0ee-0a29-45b5-aae9-6812e4fea051	2025-11-17 16:21:23.267	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8597367	192.168.10.6
30ca43b2-c34f-4247-b920-abb38c169e93	2025-11-17 16:22:10.591	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9379575	192.168.10.6
8670b58d-c34e-498a-a2ab-6eb329b2680a	2025-11-17 16:22:10.591	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9379575	192.168.10.6
71cb2f8c-01e8-4396-a252-92917010b4b7	2025-11-17 16:22:10.591	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.9379575	192.168.10.6
a9f37835-a0a9-45c7-95c9-d6a810ee7a2c	2025-11-17 16:23:07.249	구역7	CCTV-3	0	ABNORMAL_CCTV_2	UNSOLVED	(구역7) 에서 침입 발생	\N	0.8066109	192.168.10.6
29b5a6ef-ba31-4737-843b-3f28d2736d3b	2025-11-17 16:23:07.249	구역7	CCTV-3	0	ABNORMAL_CCTV_2	SOLVED	(구역7) 에서 침입 발생	\N	0.8066109	192.168.10.6
4a4512ba-2478-4854-86f3-aaebf8ff328f	2025-11-17 16:23:07.249	구역7	CCTV-3	0	ABNORMAL_CCTV_2	SOLVED	(구역7) 에서 침입 발생	\N	0.8066109	192.168.10.6
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	init	SQL	V1__init.sql	1001921305	root	2025-06-13 11:07:01.789154	22	t
\.


--
-- Data for Name: rank_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.rank_info (id, rank_name) FROM stdin;
1	사원
2	대리
3	과장
4	차장
5	부장
6	사장
\.


--
-- Data for Name: rule_event_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.rule_event_info (event_id, event_value, event_type, event_name, inserted_time) FROM stdin;
1	65	hr	심박수 이상	2025-06-17 04:10:36.566164
2	31.5	temp	체온 이상	2025-06-17 04:11:11.995327
\.


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_info (id, device_id, user_type, user_name, user_id, user_pw, dept_id, rank_id) FROM stdin;
1	aaa	admin	엠폴관리자	admin	admin123	\N	\N
9	4ce1dd5788ac79e0	worker	테스터2	1112	1234	1	1
23	b54448e1068d2c71	worker	테스터3	1113	1234	1	1
7	7b438e0a81ed551b	worker	테스터	1111	1234	1	1
\.


--
-- Data for Name: worker_baseline; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.worker_baseline (worker_id, mu, sigma, p05, p95, updated_at) FROM stdin;
1115	85.52381	2.7188766	81	91	2025-09-03 01:03:13.130711+00
1111	57.232143	3.3273277	53	63	2025-09-25 05:47:33.039079+00
\.


--
-- Data for Name: zone_device; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.zone_device (id, zone_id, dev_id, position_metadata, created_time, updated_time) FROM stdin;
6	8	192.168.10.64	{"px": -39.2, "py": -10.14, "pz": -43.487, "rx": 0, "ry": 180, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
10	10	192.168.10.28	{"px": -26.74, "py": -12.36, "pz": -25.36, "rx": 0, "ry": 0, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-10-13 04:54:28.911307	2025-10-13 04:54:28.911307
4	3	30002:27350	{"px": -35.418, "py": -12.36, "pz": -43.487, "rx": 0, "ry": 180, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
7	9	192.168.10.44	{"px": -26.87, "py": -12.36, "pz": -43.4, "rx": 0, "ry": 180, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
5	7	192.168.10.6	{"px": -39.2, "py": -10.14, "pz": -26.75, "rx": 0, "ry": 90, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
9	1	30002:27335	{"px": -26.51, "py": -13.11, "pz": -34.85, "rx": 0, "ry": 90, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-18 00:27:44.114899	2025-09-18 00:27:44.114899
3	6	30002:27399	{"px": -39.732, "py": -12.36, "pz": -35.06, "rx": 0, "ry": -90, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
12	5	30002:27400	{"px": -33.17, "py": -12.36, "pz": -24.99, "rx": 0, "ry": 0, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-11-10 01:49:35.468344	2025-11-10 01:49:35.468344
2	2	30002:27349	{"px": -35.17, "py": -12.36, "pz": -24.99, "rx": 0, "ry": 0, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-09-16 05:17:49.290903	2025-09-16 05:17:49.290903
11	4	30002:27351	{"px": -33.418, "py": -12.36, "pz": -43.487, "rx": 0, "ry": 180, "rz": 0, "sx": 1, "sy": 1, "sz": 1, "type": "POSITION"}	2025-11-10 01:49:35.468344	2025-11-10 01:49:35.468344
\.


--
-- Data for Name: zone_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.zone_info (id, name) FROM stdin;
1	구역1
2	구역2
3	구역3
4	구역4
5	구역5
6	구역6
7	구역7
8	구역8
9	구역9
10	구역10
\.


--
-- Name: chunk_column_stats_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_column_stats_id_seq', 1, false);


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 37, true);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 38, true);


--
-- Name: continuous_agg_migrate_plan_step_step_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.continuous_agg_migrate_plan_step_step_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 6, true);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 38, true);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 6, true);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: root
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- Name: ai_hr_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ai_hr_events_id_seq', 835, true);


--
-- Name: dept_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dept_info_id_seq', 4, true);


--
-- Name: device_info_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.device_info_id_seq1', 17, true);


--
-- Name: rank_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.rank_info_id_seq', 6, true);


--
-- Name: rule_event_info_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.rule_event_info_event_id_seq', 2, true);


--
-- Name: user_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_info_id_seq', 23, true);


--
-- Name: zone_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.zone_device_id_seq', 12, true);


--
-- Name: zone_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.zone_info_id_seq', 10, true);


--
-- Name: _hyper_6_12_chunk 12_11_data_spo2_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_6_12_chunk
    ADD CONSTRAINT "12_11_data_spo2_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_17_chunk 17_16_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_17_chunk
    ADD CONSTRAINT "17_16_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_6_18_chunk 18_17_data_spo2_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_6_18_chunk
    ADD CONSTRAINT "18_17_data_spo2_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_20_chunk 20_19_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_20_chunk
    ADD CONSTRAINT "20_19_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_24_chunk 24_23_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_24_chunk
    ADD CONSTRAINT "24_23_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_26_chunk 26_24_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_26_chunk
    ADD CONSTRAINT "26_24_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_3_35_chunk 35_34_data_heartrate_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_3_35_chunk
    ADD CONSTRAINT "35_34_data_heartrate_pkey" PRIMARY KEY (inserted_time, sender);


--
-- Name: _hyper_4_36_chunk 36_35_data_beacon_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_36_chunk
    ADD CONSTRAINT "36_35_data_beacon_pkey" PRIMARY KEY (inserted_time, sender);


--
-- Name: _hyper_6_37_chunk 37_36_data_spo2_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_6_37_chunk
    ADD CONSTRAINT "37_36_data_spo2_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_38_chunk 38_37_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_38_chunk
    ADD CONSTRAINT "38_37_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_4_chunk 4_3_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_4_chunk
    ADD CONSTRAINT "4_3_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_6_5_chunk 5_4_data_spo2_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_6_5_chunk
    ADD CONSTRAINT "5_4_data_spo2_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_5_6_chunk 6_5_data_step_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_5_6_chunk
    ADD CONSTRAINT "6_5_data_step_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: _hyper_6_9_chunk 9_8_data_spo2_pkey; Type: CONSTRAINT; Schema: _timescaledb_internal; Owner: root
--

ALTER TABLE ONLY _timescaledb_internal._hyper_6_9_chunk
    ADD CONSTRAINT "9_8_data_spo2_pkey" PRIMARY KEY (inserted_time, sender, value);


--
-- Name: ai_hr_events ai_hr_events_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ai_hr_events
    ADD CONSTRAINT ai_hr_events_pkey PRIMARY KEY (id);


--
-- Name: data_beacon data_beacon_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_beacon
    ADD CONSTRAINT data_beacon_pkey PRIMARY KEY (inserted_time, sender);


--
-- Name: data_heartrate data_heartrate_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_heartrate
    ADD CONSTRAINT data_heartrate_pkey PRIMARY KEY (inserted_time, sender);


--
-- Name: data_spo2 data_spo2_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_spo2
    ADD CONSTRAINT data_spo2_pkey PRIMARY KEY (inserted_time, sender, value);


--
-- Name: data_step data_step_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_step
    ADD CONSTRAINT data_step_pkey PRIMARY KEY (inserted_time, sender, value);


--
-- Name: data_temp data_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_temp
    ADD CONSTRAINT data_temp_pkey PRIMARY KEY (inserted_time, sender, value);


--
-- Name: dept_info dept_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dept_info
    ADD CONSTRAINT dept_info_pkey PRIMARY KEY (id);


--
-- Name: device_info device_info_dev_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.device_info
    ADD CONSTRAINT device_info_dev_id_key UNIQUE (dev_id);


--
-- Name: device_info device_info_pkey1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.device_info
    ADD CONSTRAINT device_info_pkey1 PRIMARY KEY (id);


--
-- Name: event_history event_history_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.event_history
    ADD CONSTRAINT event_history_pkey PRIMARY KEY (event_id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: rank_info rank_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rank_info
    ADD CONSTRAINT rank_info_pkey PRIMARY KEY (id);


--
-- Name: rule_event_info rule_event_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rule_event_info
    ADD CONSTRAINT rule_event_info_pkey PRIMARY KEY (event_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- Name: user_info user_info_user_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_user_name_key UNIQUE (user_name);


--
-- Name: worker_baseline worker_baseline_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.worker_baseline
    ADD CONSTRAINT worker_baseline_pkey PRIMARY KEY (worker_id);


--
-- Name: zone_device zone_device_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zone_device
    ADD CONSTRAINT zone_device_pkey PRIMARY KEY (id);


--
-- Name: zone_info zone_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zone_info
    ADD CONSTRAINT zone_info_pkey PRIMARY KEY (id);


--
-- Name: _hyper_3_35_chunk_data_heartrate_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_3_35_chunk_data_heartrate_inserted_time_idx ON _timescaledb_internal._hyper_3_35_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_3_35_chunk_data_heartrate_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_3_35_chunk_data_heartrate_sender_inserted_time_idx ON _timescaledb_internal._hyper_3_35_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_3_35_chunk_idx_heartrate_sender_time; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_3_35_chunk_idx_heartrate_sender_time ON _timescaledb_internal._hyper_3_35_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_4_36_chunk_data_beacon_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_4_36_chunk_data_beacon_inserted_time_idx ON _timescaledb_internal._hyper_4_36_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_4_36_chunk_data_beacon_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_4_36_chunk_data_beacon_sender_inserted_time_idx ON _timescaledb_internal._hyper_4_36_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_17_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_17_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_17_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_17_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_17_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_17_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_20_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_20_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_20_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_20_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_20_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_20_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_24_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_24_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_24_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_24_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_24_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_24_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_26_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_26_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_26_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_26_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_26_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_26_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_38_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_38_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_38_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_38_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_38_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_38_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_4_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_4_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_4_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_4_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_4_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_4_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_5_6_chunk_data_step_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_6_chunk_data_step_inserted_time_idx ON _timescaledb_internal._hyper_5_6_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_5_6_chunk_data_step_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_5_6_chunk_data_step_sender_inserted_time_idx ON _timescaledb_internal._hyper_5_6_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_6_12_chunk_data_spo2_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_12_chunk_data_spo2_inserted_time_idx ON _timescaledb_internal._hyper_6_12_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_6_12_chunk_data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_12_chunk_data_spo2_sender_inserted_time_idx ON _timescaledb_internal._hyper_6_12_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_6_18_chunk_data_spo2_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_18_chunk_data_spo2_inserted_time_idx ON _timescaledb_internal._hyper_6_18_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_6_18_chunk_data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_18_chunk_data_spo2_sender_inserted_time_idx ON _timescaledb_internal._hyper_6_18_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_6_37_chunk_data_spo2_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_37_chunk_data_spo2_inserted_time_idx ON _timescaledb_internal._hyper_6_37_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_6_37_chunk_data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_37_chunk_data_spo2_sender_inserted_time_idx ON _timescaledb_internal._hyper_6_37_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_6_5_chunk_data_spo2_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_5_chunk_data_spo2_inserted_time_idx ON _timescaledb_internal._hyper_6_5_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_6_5_chunk_data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_5_chunk_data_spo2_sender_inserted_time_idx ON _timescaledb_internal._hyper_6_5_chunk USING btree (sender, inserted_time DESC);


--
-- Name: _hyper_6_9_chunk_data_spo2_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_9_chunk_data_spo2_inserted_time_idx ON _timescaledb_internal._hyper_6_9_chunk USING btree (inserted_time DESC);


--
-- Name: _hyper_6_9_chunk_data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: root
--

CREATE INDEX _hyper_6_9_chunk_data_spo2_sender_inserted_time_idx ON _timescaledb_internal._hyper_6_9_chunk USING btree (sender, inserted_time DESC);


--
-- Name: data_beacon_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_beacon_inserted_time_idx ON public.data_beacon USING btree (inserted_time DESC);


--
-- Name: data_beacon_sender_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_beacon_sender_inserted_time_idx ON public.data_beacon USING btree (sender, inserted_time DESC);


--
-- Name: data_heartrate_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_heartrate_inserted_time_idx ON public.data_heartrate USING btree (inserted_time DESC);


--
-- Name: data_heartrate_sender_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_heartrate_sender_inserted_time_idx ON public.data_heartrate USING btree (sender, inserted_time DESC);


--
-- Name: data_spo2_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_spo2_inserted_time_idx ON public.data_spo2 USING btree (inserted_time DESC);


--
-- Name: data_spo2_sender_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_spo2_sender_inserted_time_idx ON public.data_spo2 USING btree (sender, inserted_time DESC);


--
-- Name: data_step_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_step_inserted_time_idx ON public.data_step USING btree (inserted_time DESC);


--
-- Name: data_step_sender_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_step_sender_inserted_time_idx ON public.data_step USING btree (sender, inserted_time DESC);


--
-- Name: data_temp_sender_inserted_time_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX data_temp_sender_inserted_time_idx ON public.data_temp USING btree (sender, inserted_time DESC);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_heartrate_sender_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_heartrate_sender_time ON public.data_heartrate USING btree (sender, inserted_time DESC);


--
-- Name: data_beacon ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.data_beacon FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();


--
-- Name: data_heartrate ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.data_heartrate FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();


--
-- Name: data_spo2 ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.data_spo2 FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();


--
-- Name: data_step ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.data_step FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();


--
-- Name: user_info user_info_dept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.dept_info(id);


--
-- Name: user_info user_info_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.rank_info(id);


--
-- PostgreSQL database dump complete
--

