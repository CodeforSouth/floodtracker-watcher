SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: batteries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batteries (
    id bigint NOT NULL,
    reading double precision,
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: batteries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.batteries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: batteries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.batteries_id_seq OWNED BY public.batteries.id;


--
-- Name: battery_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.battery_histories (
    id bigint NOT NULL,
    date date,
    coreid character varying,
    count integer,
    first_publish timestamp with time zone,
    last_id integer,
    min_reading double precision,
    mean_reading double precision,
    stddev_reading double precision,
    max_reading double precision,
    first_reading double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: battery_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.battery_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: battery_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.battery_histories_id_seq OWNED BY public.battery_histories.id;


--
-- Name: level_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.level_histories (
    id bigint NOT NULL,
    date date,
    coreid character varying,
    count integer,
    first_publish timestamp with time zone,
    last_id integer,
    min_reading integer,
    mean_reading double precision,
    stddev_reading double precision,
    max_reading integer,
    first_reading integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: level_raws; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.level_raws (
    id bigint NOT NULL,
    readings double precision[],
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.levels (
    id bigint NOT NULL,
    reading integer,
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: quips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quips (
    id bigint NOT NULL,
    body character varying,
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sleep_plan_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sleep_plan_histories (
    id bigint NOT NULL,
    date date,
    coreid character varying,
    sleep_count integer,
    first_publish timestamp with time zone,
    last_id integer,
    min_plan integer,
    mean_reading double precision,
    total_plan integer,
    max_plan integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sleep_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sleep_plans (
    id bigint NOT NULL,
    plan integer,
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spark_diagnostics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spark_diagnostics (
    id bigint NOT NULL,
    diagnostic json,
    coreid character varying,
    published_at timestamp with time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sparks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sparks (
    id bigint NOT NULL,
    event character varying,
    data character varying,
    coreid character varying,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: devices; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.devices AS
 SELECT cores.coreid AS id,
    min(cores.created_at) AS created_at,
    min(cores.updated_at) AS updated_at
   FROM ( SELECT DISTINCT batteries.coreid,
            min(batteries.created_at) AS created_at,
            min(batteries.updated_at) AS updated_at
           FROM public.batteries
          GROUP BY batteries.coreid
        UNION
         SELECT DISTINCT battery_histories.coreid,
            min(battery_histories.created_at) AS created_at,
            min(battery_histories.updated_at) AS updated_at
           FROM public.battery_histories
          GROUP BY battery_histories.coreid
        UNION
         SELECT DISTINCT levels.coreid,
            min(levels.created_at) AS created_at,
            min(levels.updated_at) AS updated_at
           FROM public.levels
          GROUP BY levels.coreid
        UNION
         SELECT DISTINCT level_histories.coreid,
            min(level_histories.created_at) AS created_at,
            min(level_histories.updated_at) AS updated_at
           FROM public.level_histories
          GROUP BY level_histories.coreid
        UNION
         SELECT DISTINCT level_raws.coreid,
            min(level_raws.created_at) AS created_at,
            min(level_raws.updated_at) AS updated_at
           FROM public.level_raws
          GROUP BY level_raws.coreid
        UNION
         SELECT DISTINCT quips.coreid,
            min(quips.created_at) AS created_at,
            min(quips.updated_at) AS updated_at
           FROM public.quips
          GROUP BY quips.coreid
        UNION
         SELECT DISTINCT sleep_plans.coreid,
            min(sleep_plans.created_at) AS created_at,
            min(sleep_plans.updated_at) AS updated_at
           FROM public.sleep_plans
          GROUP BY sleep_plans.coreid
        UNION
         SELECT DISTINCT sleep_plan_histories.coreid,
            min(sleep_plan_histories.created_at) AS created_at,
            min(sleep_plan_histories.updated_at) AS updated_at
           FROM public.sleep_plan_histories
          GROUP BY sleep_plan_histories.coreid
        UNION
         SELECT DISTINCT sparks.coreid,
            min(sparks.created_at) AS created_at,
            min(sparks.updated_at) AS updated_at
           FROM public.sparks
          GROUP BY sparks.coreid
        UNION
         SELECT DISTINCT spark_diagnostics.coreid,
            min(spark_diagnostics.created_at) AS created_at,
            min(spark_diagnostics.updated_at) AS updated_at
           FROM public.spark_diagnostics
          GROUP BY spark_diagnostics.coreid) cores
  GROUP BY cores.coreid
  ORDER BY cores.coreid;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    event character varying,
    data integer,
    coreid character varying,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: level_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.level_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: level_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.level_histories_id_seq OWNED BY public.level_histories.id;


--
-- Name: level_raws_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.level_raws_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: level_raws_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.level_raws_id_seq OWNED BY public.level_raws.id;


--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: quips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quips_id_seq OWNED BY public.quips.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sleep_plan_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sleep_plan_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sleep_plan_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sleep_plan_histories_id_seq OWNED BY public.sleep_plan_histories.id;


--
-- Name: sleep_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sleep_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sleep_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sleep_plans_id_seq OWNED BY public.sleep_plans.id;


--
-- Name: spark_diagnostics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spark_diagnostics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spark_diagnostics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spark_diagnostics_id_seq OWNED BY public.spark_diagnostics.id;


--
-- Name: sparks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sparks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sparks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sparks_id_seq OWNED BY public.sparks.id;


--
-- Name: synthetic_battery_histories; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.synthetic_battery_histories AS
 SELECT battery_histories.date,
    battery_histories.coreid,
    battery_histories.count,
    battery_histories.first_publish,
    battery_histories.last_id,
    battery_histories.min_reading,
    battery_histories.mean_reading,
    battery_histories.stddev_reading,
    battery_histories.max_reading,
    battery_histories.first_reading,
    battery_histories.created_at,
    battery_histories.updated_at
   FROM public.battery_histories
UNION
 SELECT i.date,
    i.coreid,
    i.count,
    i.first_publish,
    i.last_id,
    i.min_reading,
    i.mean_reading,
    i.stddev_reading,
    i.max_reading,
    t.reading AS first_reading,
    now() AS created_at,
    now() AS updated_at
   FROM (( SELECT windows.date,
            s.coreid,
            count(s.reading) AS count,
            min(s.published_at) AS first_publish,
            max(s.id) AS last_id,
            min(s.reading) AS min_reading,
            avg(s.reading) AS mean_reading,
            stddev(s.reading) AS stddev_reading,
            max(s.reading) AS max_reading
           FROM (( SELECT date(generate_series((( SELECT min(date(batteries.published_at)) AS min
                           FROM public.batteries))::timestamp with time zone, (( SELECT max(date(batteries.published_at)) AS max
                           FROM public.batteries
                          WHERE (date(batteries.published_at) < date((now() - '8 days'::interval)))))::timestamp with time zone, '1 day'::interval)) AS date) windows
             JOIN public.batteries s ON ((date(s.published_at) = windows.date)))
          GROUP BY windows.date, s.coreid
          ORDER BY windows.date, s.coreid) i
     JOIN public.batteries t ON ((((t.coreid)::text = (i.coreid)::text) AND (t.published_at = i.first_publish))));


--
-- Name: batteries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batteries ALTER COLUMN id SET DEFAULT nextval('public.batteries_id_seq'::regclass);


--
-- Name: battery_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.battery_histories ALTER COLUMN id SET DEFAULT nextval('public.battery_histories_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: level_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.level_histories ALTER COLUMN id SET DEFAULT nextval('public.level_histories_id_seq'::regclass);


--
-- Name: level_raws id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.level_raws ALTER COLUMN id SET DEFAULT nextval('public.level_raws_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: quips id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quips ALTER COLUMN id SET DEFAULT nextval('public.quips_id_seq'::regclass);


--
-- Name: sleep_plan_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sleep_plan_histories ALTER COLUMN id SET DEFAULT nextval('public.sleep_plan_histories_id_seq'::regclass);


--
-- Name: sleep_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sleep_plans ALTER COLUMN id SET DEFAULT nextval('public.sleep_plans_id_seq'::regclass);


--
-- Name: spark_diagnostics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spark_diagnostics ALTER COLUMN id SET DEFAULT nextval('public.spark_diagnostics_id_seq'::regclass);


--
-- Name: sparks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sparks ALTER COLUMN id SET DEFAULT nextval('public.sparks_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: batteries batteries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batteries
    ADD CONSTRAINT batteries_pkey PRIMARY KEY (id);


--
-- Name: battery_histories battery_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.battery_histories
    ADD CONSTRAINT battery_histories_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: level_histories level_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.level_histories
    ADD CONSTRAINT level_histories_pkey PRIMARY KEY (id);


--
-- Name: level_raws level_raws_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.level_raws
    ADD CONSTRAINT level_raws_pkey PRIMARY KEY (id);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: quips quips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quips
    ADD CONSTRAINT quips_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sleep_plan_histories sleep_plan_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sleep_plan_histories
    ADD CONSTRAINT sleep_plan_histories_pkey PRIMARY KEY (id);


--
-- Name: sleep_plans sleep_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sleep_plans
    ADD CONSTRAINT sleep_plans_pkey PRIMARY KEY (id);


--
-- Name: spark_diagnostics spark_diagnostics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spark_diagnostics
    ADD CONSTRAINT spark_diagnostics_pkey PRIMARY KEY (id);


--
-- Name: sparks sparks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sparks
    ADD CONSTRAINT sparks_pkey PRIMARY KEY (id);


--
-- Name: index_batteries_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_batteries_on_coreid ON public.batteries USING btree (coreid);


--
-- Name: index_level_raws_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_level_raws_on_coreid ON public.level_raws USING btree (coreid);


--
-- Name: index_levels_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_levels_on_coreid ON public.levels USING btree (coreid);


--
-- Name: index_quips_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quips_on_coreid ON public.quips USING btree (coreid);


--
-- Name: index_sleep_plans_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sleep_plans_on_coreid ON public.sleep_plans USING btree (coreid);


--
-- Name: index_spark_diagnostics_on_coreid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_spark_diagnostics_on_coreid ON public.spark_diagnostics USING btree (coreid);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190212013320'),
('20190212024653'),
('20190518022757'),
('20190518030705'),
('20190518031851'),
('20190518032710'),
('20190518033043'),
('20190518033143'),
('20190518173229'),
('20190518175029'),
('20190518175608'),
('20190518180215'),
('20190518181040'),
('20190518181738'),
('20190518182446'),
('20190518192208'),
('20190520015432'),
('20190520203626'),
('20190520213413'),
('20190624234204'),
('20190921162920');


