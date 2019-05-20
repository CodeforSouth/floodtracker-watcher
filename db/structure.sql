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
-- Name: batteries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batteries ALTER COLUMN id SET DEFAULT nextval('public.batteries_id_seq'::regclass);


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
('20190520203626');


