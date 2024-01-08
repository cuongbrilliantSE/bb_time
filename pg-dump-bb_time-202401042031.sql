--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-01-04 20:31:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 18202)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18201)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 244 (class 1259 OID 18349)
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18348)
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 243
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- TOC entry 222 (class 1259 OID 18224)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18223)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 220 (class 1259 OID 18213)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18212)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 246 (class 1259 OID 18361)
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18360)
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 245
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- TOC entry 272 (class 1259 OID 19046)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 19045)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 271
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 282 (class 1259 OID 19093)
-- Name: categories_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_localizations_links (
    id integer NOT NULL,
    category_id integer,
    inv_category_id integer,
    category_order double precision
);


ALTER TABLE public.categories_localizations_links OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 19092)
-- Name: categories_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 281
-- Name: categories_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_localizations_links_id_seq OWNED BY public.categories_localizations_links.id;


--
-- TOC entry 276 (class 1259 OID 19068)
-- Name: components_home_advantages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_home_advantages (
    id integer NOT NULL,
    title character varying(255),
    description text,
    subject character varying(255)
);


ALTER TABLE public.components_home_advantages OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 19067)
-- Name: components_home_advantages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_home_advantages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_home_advantages_id_seq OWNER TO postgres;

--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 275
-- Name: components_home_advantages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_home_advantages_id_seq OWNED BY public.components_home_advantages.id;


--
-- TOC entry 278 (class 1259 OID 19077)
-- Name: components_home_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_home_domains (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.components_home_domains OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 19076)
-- Name: components_home_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_home_domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_home_domains_id_seq OWNER TO postgres;

--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 277
-- Name: components_home_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_home_domains_id_seq OWNED BY public.components_home_domains.id;


--
-- TOC entry 280 (class 1259 OID 19084)
-- Name: components_home_home_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_home_home_posts (
    id integer NOT NULL,
    subject character varying(255),
    title character varying(255),
    description text
);


ALTER TABLE public.components_home_home_posts OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 19083)
-- Name: components_home_home_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_home_home_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_home_home_posts_id_seq OWNER TO postgres;

--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 279
-- Name: components_home_home_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_home_home_posts_id_seq OWNED BY public.components_home_home_posts.id;


--
-- TOC entry 358 (class 1259 OID 20626)
-- Name: components_introduce_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_introduce_ads (
    id integer NOT NULL,
    title character varying(255),
    description text,
    button character varying(255),
    items text
);


ALTER TABLE public.components_introduce_ads OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 20625)
-- Name: components_introduce_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_introduce_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_introduce_ads_id_seq OWNER TO postgres;

--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 357
-- Name: components_introduce_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_introduce_ads_id_seq OWNED BY public.components_introduce_ads.id;


--
-- TOC entry 350 (class 1259 OID 20531)
-- Name: components_introduce_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_introduce_attributes (
    id integer NOT NULL,
    title character varying(255),
    count integer,
    unit character varying(255),
    "character" character varying(255)
);


ALTER TABLE public.components_introduce_attributes OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 20530)
-- Name: components_introduce_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_introduce_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_introduce_attributes_id_seq OWNER TO postgres;

--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 349
-- Name: components_introduce_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_introduce_attributes_id_seq OWNED BY public.components_introduce_attributes.id;


--
-- TOC entry 354 (class 1259 OID 20579)
-- Name: components_introduce_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_introduce_histories (
    id integer NOT NULL,
    title character varying(255),
    description text,
    year character varying(255)
);


ALTER TABLE public.components_introduce_histories OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 20578)
-- Name: components_introduce_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_introduce_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_introduce_histories_id_seq OWNER TO postgres;

--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 353
-- Name: components_introduce_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_introduce_histories_id_seq OWNED BY public.components_introduce_histories.id;


--
-- TOC entry 356 (class 1259 OID 20604)
-- Name: components_introduce_missions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_introduce_missions (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_introduce_missions OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 20603)
-- Name: components_introduce_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_introduce_missions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_introduce_missions_id_seq OWNER TO postgres;

--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 355
-- Name: components_introduce_missions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_introduce_missions_id_seq OWNED BY public.components_introduce_missions.id;


--
-- TOC entry 300 (class 1259 OID 19572)
-- Name: components_product_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_product_documents (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_product_documents OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 19571)
-- Name: components_product_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_product_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_product_documents_id_seq OWNER TO postgres;

--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 299
-- Name: components_product_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_product_documents_id_seq OWNED BY public.components_product_documents.id;


--
-- TOC entry 310 (class 1259 OID 19790)
-- Name: components_product_galleries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_product_galleries (
    id integer NOT NULL,
    title character varying(255),
    description text,
    link text
);


ALTER TABLE public.components_product_galleries OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 19789)
-- Name: components_product_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_product_galleries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_product_galleries_id_seq OWNER TO postgres;

--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 309
-- Name: components_product_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_product_galleries_id_seq OWNED BY public.components_product_galleries.id;


--
-- TOC entry 302 (class 1259 OID 19581)
-- Name: components_product_specifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_product_specifications (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_product_specifications OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19580)
-- Name: components_product_specifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_product_specifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_product_specifications_id_seq OWNER TO postgres;

--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 301
-- Name: components_product_specifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_product_specifications_id_seq OWNED BY public.components_product_specifications.id;


--
-- TOC entry 324 (class 1259 OID 20032)
-- Name: components_service_commits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_service_commits (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_service_commits OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 20031)
-- Name: components_service_commits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_service_commits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_service_commits_id_seq OWNER TO postgres;

--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 323
-- Name: components_service_commits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_service_commits_id_seq OWNED BY public.components_service_commits.id;


--
-- TOC entry 328 (class 1259 OID 20076)
-- Name: components_service_customer_reponses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_service_customer_reponses (
    id integer NOT NULL,
    name character varying(255),
    company text,
    comment text
);


ALTER TABLE public.components_service_customer_reponses OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 20075)
-- Name: components_service_customer_reponses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_service_customer_reponses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_service_customer_reponses_id_seq OWNER TO postgres;

--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 327
-- Name: components_service_customer_reponses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_service_customer_reponses_id_seq OWNED BY public.components_service_customer_reponses.id;


--
-- TOC entry 330 (class 1259 OID 20097)
-- Name: components_service_partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_service_partners (
    id integer NOT NULL
);


ALTER TABLE public.components_service_partners OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 20096)
-- Name: components_service_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_service_partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_service_partners_id_seq OWNER TO postgres;

--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 329
-- Name: components_service_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_service_partners_id_seq OWNED BY public.components_service_partners.id;


--
-- TOC entry 332 (class 1259 OID 20114)
-- Name: components_service_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_service_questions (
    id integer NOT NULL,
    question character varying(255),
    answer text
);


ALTER TABLE public.components_service_questions OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 20113)
-- Name: components_service_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_service_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_service_questions_id_seq OWNER TO postgres;

--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 331
-- Name: components_service_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_service_questions_id_seq OWNED BY public.components_service_questions.id;


--
-- TOC entry 262 (class 1259 OID 18769)
-- Name: components_shared_meta_socials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_meta_socials (
    id integer NOT NULL,
    social_network character varying(255),
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.components_shared_meta_socials OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18768)
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_meta_socials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_meta_socials_id_seq OWNER TO postgres;

--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 261
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_meta_socials_id_seq OWNED BY public.components_shared_meta_socials.id;


--
-- TOC entry 264 (class 1259 OID 18778)
-- Name: components_shared_seos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description character varying(255),
    keywords text,
    meta_robots character varying(255),
    structured_data jsonb,
    meta_viewport character varying(255),
    canonical_url character varying(255)
);


ALTER TABLE public.components_shared_seos OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 18787)
-- Name: components_shared_seos_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_seos_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_shared_seos_components OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 18786)
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_seos_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_seos_components_id_seq OWNER TO postgres;

--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 265
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_seos_components_id_seq OWNED BY public.components_shared_seos_components.id;


--
-- TOC entry 263 (class 1259 OID 18777)
-- Name: components_shared_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_seos_id_seq OWNER TO postgres;

--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 263
-- Name: components_shared_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_seos_id_seq OWNED BY public.components_shared_seos.id;


--
-- TOC entry 362 (class 1259 OID 20720)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    title text,
    email character varying(255),
    phone_number character varying(255),
    address text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    twiter_link character varying(255),
    fb_link character varying(255),
    insta_link character varying(255),
    pinterest_link character varying(255)
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 20719)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 361
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 364 (class 1259 OID 20731)
-- Name: contacts_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_localizations_links (
    id integer NOT NULL,
    contact_id integer,
    inv_contact_id integer,
    contact_order double precision
);


ALTER TABLE public.contacts_localizations_links OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 20730)
-- Name: contacts_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 363
-- Name: contacts_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_localizations_links_id_seq OWNED BY public.contacts_localizations_links.id;


--
-- TOC entry 232 (class 1259 OID 18275)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18410)
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18409)
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 253
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- TOC entry 231 (class 1259 OID 18274)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 231
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 252 (class 1259 OID 18398)
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18397)
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 251
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- TOC entry 290 (class 1259 OID 19206)
-- Name: footers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footers (
    id integer NOT NULL,
    phone character varying(255),
    email character varying(255),
    address text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.footers OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 19205)
-- Name: footers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footers_id_seq OWNER TO postgres;

--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 289
-- Name: footers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footers_id_seq OWNED BY public.footers.id;


--
-- TOC entry 292 (class 1259 OID 19217)
-- Name: footers_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footers_localizations_links (
    id integer NOT NULL,
    footer_id integer,
    inv_footer_id integer,
    footer_order double precision
);


ALTER TABLE public.footers_localizations_links OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 19216)
-- Name: footers_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footers_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footers_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 291
-- Name: footers_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footers_localizations_links_id_seq OWNED BY public.footers_localizations_links.id;


--
-- TOC entry 274 (class 1259 OID 19057)
-- Name: home_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.home_pages OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 19105)
-- Name: home_pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.home_pages_components OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 19104)
-- Name: home_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_components_id_seq OWNER TO postgres;

--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 283
-- Name: home_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_components_id_seq OWNED BY public.home_pages_components.id;


--
-- TOC entry 273 (class 1259 OID 19056)
-- Name: home_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_id_seq OWNER TO postgres;

--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 273
-- Name: home_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_id_seq OWNED BY public.home_pages.id;


--
-- TOC entry 286 (class 1259 OID 19119)
-- Name: home_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages_localizations_links (
    id integer NOT NULL,
    home_page_id integer,
    inv_home_page_id integer,
    home_page_order double precision
);


ALTER TABLE public.home_pages_localizations_links OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 19118)
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 285
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_localizations_links_id_seq OWNED BY public.home_pages_localizations_links.id;


--
-- TOC entry 236 (class 1259 OID 18307)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18306)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 235
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 346 (class 1259 OID 20477)
-- Name: introduces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.introduces (
    id integer NOT NULL,
    short_text text,
    long_text text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.introduces OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 20550)
-- Name: introduces_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.introduces_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.introduces_components OWNER TO postgres;

--
-- TOC entry 351 (class 1259 OID 20549)
-- Name: introduces_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.introduces_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.introduces_components_id_seq OWNER TO postgres;

--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 351
-- Name: introduces_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.introduces_components_id_seq OWNED BY public.introduces_components.id;


--
-- TOC entry 345 (class 1259 OID 20476)
-- Name: introduces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.introduces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.introduces_id_seq OWNER TO postgres;

--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 345
-- Name: introduces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.introduces_id_seq OWNED BY public.introduces.id;


--
-- TOC entry 348 (class 1259 OID 20488)
-- Name: introduces_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.introduces_localizations_links (
    id integer NOT NULL,
    introduce_id integer,
    inv_introduce_id integer,
    introduce_order double precision
);


ALTER TABLE public.introduces_localizations_links OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 20487)
-- Name: introduces_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.introduces_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.introduces_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 347
-- Name: introduces_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.introduces_localizations_links_id_seq OWNED BY public.introduces_localizations_links.id;


--
-- TOC entry 336 (class 1259 OID 20177)
-- Name: post_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_categories (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    slug character varying(255)
);


ALTER TABLE public.post_categories OWNER TO postgres;

--
-- TOC entry 335 (class 1259 OID 20176)
-- Name: post_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_categories_id_seq OWNER TO postgres;

--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 335
-- Name: post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_categories_id_seq OWNED BY public.post_categories.id;


--
-- TOC entry 338 (class 1259 OID 20188)
-- Name: post_categories_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_categories_localizations_links (
    id integer NOT NULL,
    post_category_id integer,
    inv_post_category_id integer,
    post_category_order double precision
);


ALTER TABLE public.post_categories_localizations_links OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 20187)
-- Name: post_categories_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_categories_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_categories_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 337
-- Name: post_categories_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_categories_localizations_links_id_seq OWNED BY public.post_categories_localizations_links.id;


--
-- TOC entry 334 (class 1259 OID 20138)
-- Name: post_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_pages (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.post_pages OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 20137)
-- Name: post_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_pages_id_seq OWNER TO postgres;

--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 333
-- Name: post_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_pages_id_seq OWNED BY public.post_pages.id;


--
-- TOC entry 294 (class 1259 OID 19541)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    content_html text,
    slug character varying(255)
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 20406)
-- Name: posts_author_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_author_links (
    id integer NOT NULL,
    post_id integer,
    user_id integer
);


ALTER TABLE public.posts_author_links OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 20405)
-- Name: posts_author_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_author_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_author_links_id_seq OWNER TO postgres;

--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 343
-- Name: posts_author_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_author_links_id_seq OWNED BY public.posts_author_links.id;


--
-- TOC entry 293 (class 1259 OID 19540)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 293
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 304 (class 1259 OID 19602)
-- Name: posts_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_localizations_links (
    id integer NOT NULL,
    post_id integer,
    inv_post_id integer,
    post_order double precision
);


ALTER TABLE public.posts_localizations_links OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 19601)
-- Name: posts_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 303
-- Name: posts_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_localizations_links_id_seq OWNED BY public.posts_localizations_links.id;


--
-- TOC entry 342 (class 1259 OID 20338)
-- Name: posts_post_category_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_post_category_links (
    id integer NOT NULL,
    post_id integer,
    post_category_id integer,
    post_order double precision
);


ALTER TABLE public.posts_post_category_links OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 20337)
-- Name: posts_post_category_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_post_category_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_category_links_id_seq OWNER TO postgres;

--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 341
-- Name: posts_post_category_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_post_category_links_id_seq OWNED BY public.posts_post_category_links.id;


--
-- TOC entry 360 (class 1259 OID 20674)
-- Name: posts_posts_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_posts_links (
    id integer NOT NULL,
    post_id integer,
    inv_post_id integer,
    post_order double precision
);


ALTER TABLE public.posts_posts_links OWNER TO postgres;

--
-- TOC entry 359 (class 1259 OID 20673)
-- Name: posts_posts_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_posts_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_posts_links_id_seq OWNER TO postgres;

--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 359
-- Name: posts_posts_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_posts_links_id_seq OWNED BY public.posts_posts_links.id;


--
-- TOC entry 312 (class 1259 OID 19865)
-- Name: posts_product_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_product_links (
    id integer NOT NULL,
    post_id integer,
    product_id integer,
    post_order double precision
);


ALTER TABLE public.posts_product_links OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 19864)
-- Name: posts_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_product_links_id_seq OWNER TO postgres;

--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 311
-- Name: posts_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_product_links_id_seq OWNED BY public.posts_product_links.id;


--
-- TOC entry 340 (class 1259 OID 20305)
-- Name: posts_tags_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_tags_links (
    id integer NOT NULL,
    post_id integer,
    tag_id integer,
    tag_order double precision,
    post_order double precision
);


ALTER TABLE public.posts_tags_links OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 20304)
-- Name: posts_tags_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_tags_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_tags_links_id_seq OWNER TO postgres;

--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 339
-- Name: posts_tags_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_tags_links_id_seq OWNED BY public.posts_tags_links.id;


--
-- TOC entry 296 (class 1259 OID 19552)
-- Name: product_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_pages (
    id integer NOT NULL,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.product_pages OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19551)
-- Name: product_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_pages_id_seq OWNER TO postgres;

--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 295
-- Name: product_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_pages_id_seq OWNED BY public.product_pages.id;


--
-- TOC entry 308 (class 1259 OID 19628)
-- Name: product_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_pages_localizations_links (
    id integer NOT NULL,
    product_page_id integer,
    inv_product_page_id integer,
    product_page_order double precision
);


ALTER TABLE public.product_pages_localizations_links OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 19627)
-- Name: product_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_pages_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 307
-- Name: product_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_pages_localizations_links_id_seq OWNED BY public.product_pages_localizations_links.id;


--
-- TOC entry 268 (class 1259 OID 18846)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    full_name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    short_name character varying(255),
    model character varying(255),
    manufacturer character varying(255),
    origin character varying(255),
    description text,
    technical_feature text,
    slug character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 19131)
-- Name: products_category_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category_links (
    id integer NOT NULL,
    product_id integer,
    category_id integer,
    product_order double precision
);


ALTER TABLE public.products_category_links OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 19130)
-- Name: products_category_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_links_id_seq OWNER TO postgres;

--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 287
-- Name: products_category_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_links_id_seq OWNED BY public.products_category_links.id;


--
-- TOC entry 306 (class 1259 OID 19614)
-- Name: products_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.products_components OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 19613)
-- Name: products_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_components_id_seq OWNER TO postgres;

--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 305
-- Name: products_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_components_id_seq OWNED BY public.products_components.id;


--
-- TOC entry 267 (class 1259 OID 18845)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 267
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 270 (class 1259 OID 18857)
-- Name: products_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_localizations_links (
    id integer NOT NULL,
    product_id integer,
    inv_product_id integer,
    product_order double precision
);


ALTER TABLE public.products_localizations_links OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 18856)
-- Name: products_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 269
-- Name: products_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_localizations_links_id_seq OWNED BY public.products_localizations_links.id;


--
-- TOC entry 314 (class 1259 OID 19901)
-- Name: service_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pages (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.service_pages OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 20049)
-- Name: service_pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.service_pages_components OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 20048)
-- Name: service_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pages_components_id_seq OWNER TO postgres;

--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 325
-- Name: service_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pages_components_id_seq OWNED BY public.service_pages_components.id;


--
-- TOC entry 313 (class 1259 OID 19900)
-- Name: service_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pages_id_seq OWNER TO postgres;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 313
-- Name: service_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pages_id_seq OWNED BY public.service_pages.id;


--
-- TOC entry 316 (class 1259 OID 19910)
-- Name: service_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pages_localizations_links (
    id integer NOT NULL,
    service_page_id integer,
    inv_service_page_id integer,
    service_page_order double precision
);


ALTER TABLE public.service_pages_localizations_links OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 19909)
-- Name: service_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pages_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 315
-- Name: service_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pages_localizations_links_id_seq OWNED BY public.service_pages_localizations_links.id;


--
-- TOC entry 322 (class 1259 OID 20002)
-- Name: service_pages_services_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pages_services_links (
    id integer NOT NULL,
    service_page_id integer,
    service_id integer,
    service_order double precision
);


ALTER TABLE public.service_pages_services_links OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 20001)
-- Name: service_pages_services_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pages_services_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pages_services_links_id_seq OWNER TO postgres;

--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 321
-- Name: service_pages_services_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pages_services_links_id_seq OWNED BY public.service_pages_services_links.id;


--
-- TOC entry 318 (class 1259 OID 19950)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 19949)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 317
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 320 (class 1259 OID 19961)
-- Name: services_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_localizations_links (
    id integer NOT NULL,
    service_id integer,
    inv_service_id integer,
    service_order double precision
);


ALTER TABLE public.services_localizations_links OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 19960)
-- Name: services_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_localizations_links_id_seq OWNER TO postgres;

--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 319
-- Name: services_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_localizations_links_id_seq OWNED BY public.services_localizations_links.id;


--
-- TOC entry 226 (class 1259 OID 18246)
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18245)
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 225
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- TOC entry 248 (class 1259 OID 18374)
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18373)
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 247
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- TOC entry 224 (class 1259 OID 18235)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18234)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 223
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 214 (class 1259 OID 18184)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18183)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 213
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 212 (class 1259 OID 18175)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18174)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 211
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 210 (class 1259 OID 18168)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18167)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 209
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 230 (class 1259 OID 18266)
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18265)
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 229
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- TOC entry 250 (class 1259 OID 18386)
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18385)
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- TOC entry 228 (class 1259 OID 18255)
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18254)
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 227
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- TOC entry 216 (class 1259 OID 18193)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18192)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 215
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 298 (class 1259 OID 19563)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 19562)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 297
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 238 (class 1259 OID 18318)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18317)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 258 (class 1259 OID 18434)
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18433)
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 257
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- TOC entry 240 (class 1259 OID 18327)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18326)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 239
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 242 (class 1259 OID 18338)
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18337)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 241
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 260 (class 1259 OID 18446)
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18445)
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 259
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- TOC entry 234 (class 1259 OID 18292)
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18291)
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 233
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- TOC entry 256 (class 1259 OID 18422)
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18421)
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 255
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- TOC entry 3560 (class 2604 OID 18205)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 3573 (class 2604 OID 18352)
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3562 (class 2604 OID 18227)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 18216)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 3574 (class 2604 OID 18364)
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- TOC entry 3587 (class 2604 OID 19049)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3592 (class 2604 OID 19096)
-- Name: categories_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.categories_localizations_links_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 19071)
-- Name: components_home_advantages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_advantages ALTER COLUMN id SET DEFAULT nextval('public.components_home_advantages_id_seq'::regclass);


--
-- TOC entry 3590 (class 2604 OID 19080)
-- Name: components_home_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_domains ALTER COLUMN id SET DEFAULT nextval('public.components_home_domains_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 19087)
-- Name: components_home_home_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_home_posts ALTER COLUMN id SET DEFAULT nextval('public.components_home_home_posts_id_seq'::regclass);


--
-- TOC entry 3630 (class 2604 OID 20629)
-- Name: components_introduce_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_ads ALTER COLUMN id SET DEFAULT nextval('public.components_introduce_ads_id_seq'::regclass);


--
-- TOC entry 3626 (class 2604 OID 20534)
-- Name: components_introduce_attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_attributes ALTER COLUMN id SET DEFAULT nextval('public.components_introduce_attributes_id_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 20582)
-- Name: components_introduce_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_histories ALTER COLUMN id SET DEFAULT nextval('public.components_introduce_histories_id_seq'::regclass);


--
-- TOC entry 3629 (class 2604 OID 20607)
-- Name: components_introduce_missions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_missions ALTER COLUMN id SET DEFAULT nextval('public.components_introduce_missions_id_seq'::regclass);


--
-- TOC entry 3601 (class 2604 OID 19575)
-- Name: components_product_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_documents ALTER COLUMN id SET DEFAULT nextval('public.components_product_documents_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 19793)
-- Name: components_product_galleries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_galleries ALTER COLUMN id SET DEFAULT nextval('public.components_product_galleries_id_seq'::regclass);


--
-- TOC entry 3602 (class 2604 OID 19584)
-- Name: components_product_specifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_specifications ALTER COLUMN id SET DEFAULT nextval('public.components_product_specifications_id_seq'::regclass);


--
-- TOC entry 3613 (class 2604 OID 20035)
-- Name: components_service_commits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_commits ALTER COLUMN id SET DEFAULT nextval('public.components_service_commits_id_seq'::regclass);


--
-- TOC entry 3615 (class 2604 OID 20079)
-- Name: components_service_customer_reponses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_customer_reponses ALTER COLUMN id SET DEFAULT nextval('public.components_service_customer_reponses_id_seq'::regclass);


--
-- TOC entry 3616 (class 2604 OID 20100)
-- Name: components_service_partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_partners ALTER COLUMN id SET DEFAULT nextval('public.components_service_partners_id_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 20117)
-- Name: components_service_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_questions ALTER COLUMN id SET DEFAULT nextval('public.components_service_questions_id_seq'::regclass);


--
-- TOC entry 3582 (class 2604 OID 18772)
-- Name: components_shared_meta_socials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_meta_socials ALTER COLUMN id SET DEFAULT nextval('public.components_shared_meta_socials_id_seq'::regclass);


--
-- TOC entry 3583 (class 2604 OID 18781)
-- Name: components_shared_seos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_id_seq'::regclass);


--
-- TOC entry 3584 (class 2604 OID 18790)
-- Name: components_shared_seos_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_components_id_seq'::regclass);


--
-- TOC entry 3632 (class 2604 OID 20723)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 20734)
-- Name: contacts_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.contacts_localizations_links_id_seq'::regclass);


--
-- TOC entry 3567 (class 2604 OID 18278)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 3578 (class 2604 OID 18413)
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- TOC entry 3577 (class 2604 OID 18401)
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- TOC entry 3596 (class 2604 OID 19209)
-- Name: footers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers ALTER COLUMN id SET DEFAULT nextval('public.footers_id_seq'::regclass);


--
-- TOC entry 3597 (class 2604 OID 19220)
-- Name: footers_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.footers_localizations_links_id_seq'::regclass);


--
-- TOC entry 3588 (class 2604 OID 19060)
-- Name: home_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages ALTER COLUMN id SET DEFAULT nextval('public.home_pages_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 19108)
-- Name: home_pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_components ALTER COLUMN id SET DEFAULT nextval('public.home_pages_components_id_seq'::regclass);


--
-- TOC entry 3594 (class 2604 OID 19122)
-- Name: home_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.home_pages_localizations_links_id_seq'::regclass);


--
-- TOC entry 3569 (class 2604 OID 18310)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 20480)
-- Name: introduces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces ALTER COLUMN id SET DEFAULT nextval('public.introduces_id_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 20553)
-- Name: introduces_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_components ALTER COLUMN id SET DEFAULT nextval('public.introduces_components_id_seq'::regclass);


--
-- TOC entry 3625 (class 2604 OID 20491)
-- Name: introduces_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.introduces_localizations_links_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 20180)
-- Name: post_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories ALTER COLUMN id SET DEFAULT nextval('public.post_categories_id_seq'::regclass);


--
-- TOC entry 3620 (class 2604 OID 20191)
-- Name: post_categories_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.post_categories_localizations_links_id_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 20141)
-- Name: post_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_pages ALTER COLUMN id SET DEFAULT nextval('public.post_pages_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 19544)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 20409)
-- Name: posts_author_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_author_links ALTER COLUMN id SET DEFAULT nextval('public.posts_author_links_id_seq'::regclass);


--
-- TOC entry 3603 (class 2604 OID 19605)
-- Name: posts_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.posts_localizations_links_id_seq'::regclass);


--
-- TOC entry 3622 (class 2604 OID 20341)
-- Name: posts_post_category_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_category_links ALTER COLUMN id SET DEFAULT nextval('public.posts_post_category_links_id_seq'::regclass);


--
-- TOC entry 3631 (class 2604 OID 20677)
-- Name: posts_posts_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_posts_links ALTER COLUMN id SET DEFAULT nextval('public.posts_posts_links_id_seq'::regclass);


--
-- TOC entry 3607 (class 2604 OID 19868)
-- Name: posts_product_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_product_links ALTER COLUMN id SET DEFAULT nextval('public.posts_product_links_id_seq'::regclass);


--
-- TOC entry 3621 (class 2604 OID 20308)
-- Name: posts_tags_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tags_links ALTER COLUMN id SET DEFAULT nextval('public.posts_tags_links_id_seq'::regclass);


--
-- TOC entry 3599 (class 2604 OID 19555)
-- Name: product_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages ALTER COLUMN id SET DEFAULT nextval('public.product_pages_id_seq'::regclass);


--
-- TOC entry 3605 (class 2604 OID 19631)
-- Name: product_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.product_pages_localizations_links_id_seq'::regclass);


--
-- TOC entry 3585 (class 2604 OID 18849)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3595 (class 2604 OID 19134)
-- Name: products_category_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links ALTER COLUMN id SET DEFAULT nextval('public.products_category_links_id_seq'::regclass);


--
-- TOC entry 3604 (class 2604 OID 19617)
-- Name: products_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_components ALTER COLUMN id SET DEFAULT nextval('public.products_components_id_seq'::regclass);


--
-- TOC entry 3586 (class 2604 OID 18860)
-- Name: products_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.products_localizations_links_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 19904)
-- Name: service_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages ALTER COLUMN id SET DEFAULT nextval('public.service_pages_id_seq'::regclass);


--
-- TOC entry 3614 (class 2604 OID 20052)
-- Name: service_pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_components ALTER COLUMN id SET DEFAULT nextval('public.service_pages_components_id_seq'::regclass);


--
-- TOC entry 3609 (class 2604 OID 19913)
-- Name: service_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.service_pages_localizations_links_id_seq'::regclass);


--
-- TOC entry 3612 (class 2604 OID 20005)
-- Name: service_pages_services_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_services_links ALTER COLUMN id SET DEFAULT nextval('public.service_pages_services_links_id_seq'::regclass);


--
-- TOC entry 3610 (class 2604 OID 19953)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 3611 (class 2604 OID 19964)
-- Name: services_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.services_localizations_links_id_seq'::regclass);


--
-- TOC entry 3564 (class 2604 OID 18249)
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 18377)
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 18238)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 18187)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 18178)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 3556 (class 2604 OID 18171)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 18269)
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- TOC entry 3576 (class 2604 OID 18389)
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- TOC entry 3565 (class 2604 OID 18258)
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 18196)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 3600 (class 2604 OID 19566)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3570 (class 2604 OID 18321)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 3580 (class 2604 OID 18437)
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3571 (class 2604 OID 18330)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 3572 (class 2604 OID 18341)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 3581 (class 2604 OID 18449)
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- TOC entry 3568 (class 2604 OID 18295)
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- TOC entry 3579 (class 2604 OID 18425)
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- TOC entry 4275 (class 0 OID 18202)
-- Dependencies: 218
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	{}	\N	{}	[]	2023-11-08 09:51:33.507	2023-11-08 09:51:33.507	\N	\N
2	plugin::upload.configure-view	{}	\N	{}	[]	2023-11-08 09:51:33.885	2023-11-08 09:51:33.885	\N	\N
3	plugin::upload.assets.create	{}	\N	{}	[]	2023-11-08 09:51:34.263	2023-11-08 09:51:34.263	\N	\N
4	plugin::upload.assets.update	{}	\N	{}	[]	2023-11-08 09:51:34.609	2023-11-08 09:51:34.609	\N	\N
5	plugin::upload.assets.download	{}	\N	{}	[]	2023-11-08 09:51:34.905	2023-11-08 09:51:34.905	\N	\N
6	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-11-08 09:51:35.224	2023-11-08 09:51:35.224	\N	\N
7	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2023-11-08 09:51:35.614	2023-11-08 09:51:35.614	\N	\N
8	plugin::upload.configure-view	{}	\N	{}	[]	2023-11-08 09:51:35.99	2023-11-08 09:51:35.99	\N	\N
9	plugin::upload.assets.create	{}	\N	{}	[]	2023-11-08 09:51:36.403	2023-11-08 09:51:36.403	\N	\N
10	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2023-11-08 09:51:36.861	2023-11-08 09:51:36.861	\N	\N
11	plugin::upload.assets.download	{}	\N	{}	[]	2023-11-08 09:51:37.438	2023-11-08 09:51:37.438	\N	\N
12	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-11-08 09:51:37.875	2023-11-08 09:51:37.875	\N	\N
16	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2023-11-08 09:51:39.839	2023-11-08 09:51:39.839	\N	\N
17	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2023-11-08 09:51:40.159	2023-11-08 09:51:40.159	\N	\N
18	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2023-11-08 09:51:40.404	2023-11-08 09:51:40.404	\N	\N
19	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2023-11-08 09:51:40.644	2023-11-08 09:51:40.644	\N	\N
20	plugin::content-type-builder.read	{}	\N	{}	[]	2023-11-08 09:51:40.889	2023-11-08 09:51:40.889	\N	\N
21	plugin::email.settings.read	{}	\N	{}	[]	2023-11-08 09:51:41.136	2023-11-08 09:51:41.136	\N	\N
22	plugin::upload.read	{}	\N	{}	[]	2023-11-08 09:51:41.386	2023-11-08 09:51:41.386	\N	\N
23	plugin::upload.assets.create	{}	\N	{}	[]	2023-11-08 09:51:41.638	2023-11-08 09:51:41.638	\N	\N
24	plugin::upload.assets.update	{}	\N	{}	[]	2023-11-08 09:51:41.881	2023-11-08 09:51:41.881	\N	\N
25	plugin::upload.assets.download	{}	\N	{}	[]	2023-11-08 09:51:42.132	2023-11-08 09:51:42.132	\N	\N
26	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-11-08 09:51:42.378	2023-11-08 09:51:42.378	\N	\N
27	plugin::upload.configure-view	{}	\N	{}	[]	2023-11-08 09:51:42.621	2023-11-08 09:51:42.621	\N	\N
28	plugin::upload.settings.read	{}	\N	{}	[]	2023-11-08 09:51:42.891	2023-11-08 09:51:42.891	\N	\N
29	plugin::i18n.locale.create	{}	\N	{}	[]	2023-11-08 09:51:43.139	2023-11-08 09:51:43.139	\N	\N
30	plugin::i18n.locale.read	{}	\N	{}	[]	2023-11-08 09:51:43.385	2023-11-08 09:51:43.385	\N	\N
31	plugin::i18n.locale.update	{}	\N	{}	[]	2023-11-08 09:51:43.636	2023-11-08 09:51:43.636	\N	\N
32	plugin::i18n.locale.delete	{}	\N	{}	[]	2023-11-08 09:51:43.881	2023-11-08 09:51:43.881	\N	\N
33	plugin::users-permissions.roles.create	{}	\N	{}	[]	2023-11-08 09:51:44.126	2023-11-08 09:51:44.126	\N	\N
34	plugin::users-permissions.roles.read	{}	\N	{}	[]	2023-11-08 09:51:44.384	2023-11-08 09:51:44.384	\N	\N
35	plugin::users-permissions.roles.update	{}	\N	{}	[]	2023-11-08 09:51:44.653	2023-11-08 09:51:44.653	\N	\N
36	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2023-11-08 09:51:44.978	2023-11-08 09:51:44.978	\N	\N
37	plugin::users-permissions.providers.read	{}	\N	{}	[]	2023-11-08 09:51:45.248	2023-11-08 09:51:45.248	\N	\N
38	plugin::users-permissions.providers.update	{}	\N	{}	[]	2023-11-08 09:51:45.49	2023-11-08 09:51:45.49	\N	\N
39	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2023-11-08 09:51:45.735	2023-11-08 09:51:45.735	\N	\N
40	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2023-11-08 09:51:45.998	2023-11-08 09:51:45.998	\N	\N
41	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2023-11-08 09:51:46.243	2023-11-08 09:51:46.243	\N	\N
42	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2023-11-08 09:51:46.737	2023-11-08 09:51:46.737	\N	\N
43	admin::marketplace.read	{}	\N	{}	[]	2023-11-08 09:51:47.012	2023-11-08 09:51:47.012	\N	\N
44	admin::webhooks.create	{}	\N	{}	[]	2023-11-08 09:51:47.297	2023-11-08 09:51:47.297	\N	\N
45	admin::webhooks.read	{}	\N	{}	[]	2023-11-08 09:51:47.554	2023-11-08 09:51:47.554	\N	\N
46	admin::webhooks.update	{}	\N	{}	[]	2023-11-08 09:51:47.807	2023-11-08 09:51:47.807	\N	\N
47	admin::webhooks.delete	{}	\N	{}	[]	2023-11-08 09:51:48.065	2023-11-08 09:51:48.065	\N	\N
48	admin::users.create	{}	\N	{}	[]	2023-11-08 09:51:48.326	2023-11-08 09:51:48.326	\N	\N
49	admin::users.read	{}	\N	{}	[]	2023-11-08 09:51:48.572	2023-11-08 09:51:48.572	\N	\N
50	admin::users.update	{}	\N	{}	[]	2023-11-08 09:51:48.848	2023-11-08 09:51:48.848	\N	\N
51	admin::users.delete	{}	\N	{}	[]	2023-11-08 09:51:49.173	2023-11-08 09:51:49.173	\N	\N
52	admin::roles.create	{}	\N	{}	[]	2023-11-08 09:51:49.429	2023-11-08 09:51:49.429	\N	\N
53	admin::roles.read	{}	\N	{}	[]	2023-11-08 09:51:49.673	2023-11-08 09:51:49.673	\N	\N
54	admin::roles.update	{}	\N	{}	[]	2023-11-08 09:51:49.938	2023-11-08 09:51:49.938	\N	\N
55	admin::roles.delete	{}	\N	{}	[]	2023-11-08 09:51:50.24	2023-11-08 09:51:50.24	\N	\N
56	admin::api-tokens.access	{}	\N	{}	[]	2023-11-08 09:51:50.484	2023-11-08 09:51:50.484	\N	\N
57	admin::api-tokens.create	{}	\N	{}	[]	2023-11-08 09:51:50.754	2023-11-08 09:51:50.754	\N	\N
58	admin::api-tokens.read	{}	\N	{}	[]	2023-11-08 09:51:51.034	2023-11-08 09:51:51.034	\N	\N
59	admin::api-tokens.update	{}	\N	{}	[]	2023-11-08 09:51:51.29	2023-11-08 09:51:51.29	\N	\N
60	admin::api-tokens.regenerate	{}	\N	{}	[]	2023-11-08 09:51:51.555	2023-11-08 09:51:51.555	\N	\N
61	admin::api-tokens.delete	{}	\N	{}	[]	2023-11-08 09:51:51.796	2023-11-08 09:51:51.796	\N	\N
62	admin::project-settings.update	{}	\N	{}	[]	2023-11-08 09:51:52.046	2023-11-08 09:51:52.046	\N	\N
63	admin::project-settings.read	{}	\N	{}	[]	2023-11-08 09:51:52.316	2023-11-08 09:51:52.316	\N	\N
64	admin::transfer.tokens.access	{}	\N	{}	[]	2023-11-08 09:51:52.584	2023-11-08 09:51:52.584	\N	\N
65	admin::transfer.tokens.create	{}	\N	{}	[]	2023-11-08 09:51:52.828	2023-11-08 09:51:52.828	\N	\N
66	admin::transfer.tokens.read	{}	\N	{}	[]	2023-11-08 09:51:53.089	2023-11-08 09:51:53.089	\N	\N
67	admin::transfer.tokens.update	{}	\N	{}	[]	2023-11-08 09:51:53.337	2023-11-08 09:51:53.337	\N	\N
68	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2023-11-08 09:51:53.608	2023-11-08 09:51:53.608	\N	\N
69	admin::transfer.tokens.delete	{}	\N	{}	[]	2023-11-08 09:51:53.966	2023-11-08 09:51:53.966	\N	\N
70	plugin::seo.read	{}	\N	{}	[]	2023-11-08 09:58:19.013	2023-11-08 09:58:19.013	\N	\N
253	plugin::content-manager.explorer.create	{}	api::post-page.post-page	{"fields": ["banner"]}	[]	2023-11-27 22:33:56.874	2023-11-27 22:33:56.874	\N	\N
340	plugin::content-manager.explorer.delete	{}	api::contact.contact	{"locales": ["en", "vi-VN"]}	[]	2023-12-03 09:38:56.949	2023-12-03 09:38:56.949	\N	\N
350	plugin::content-manager.explorer.create	{}	api::home-page.home-page	{"fields": ["title", "banner", "categories.title", "categories.icon", "advantages.title", "advantages.description", "advantages.image", "advantages.subject"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 20:06:47.066	2023-12-03 20:06:47.066	\N	\N
351	plugin::content-manager.explorer.read	{}	api::home-page.home-page	{"fields": ["title", "banner", "categories.title", "categories.icon", "advantages.title", "advantages.description", "advantages.image", "advantages.subject"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 20:06:47.402	2023-12-03 20:06:47.402	\N	\N
254	plugin::content-manager.explorer.read	{}	api::post-page.post-page	{"fields": ["banner"]}	[]	2023-11-27 22:33:57.134	2023-11-27 22:33:57.134	\N	\N
255	plugin::content-manager.explorer.update	{}	api::post-page.post-page	{"fields": ["banner"]}	[]	2023-11-27 22:33:57.39	2023-11-27 22:33:57.39	\N	\N
256	plugin::content-manager.explorer.delete	{}	api::post-page.post-page	{}	[]	2023-11-27 22:33:57.637	2023-11-27 22:33:57.637	\N	\N
261	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "avatar"]}	[]	2023-11-27 23:10:59.813	2023-11-27 23:10:59.813	\N	\N
262	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "avatar"]}	[]	2023-11-27 23:11:00.069	2023-11-27 23:11:00.069	\N	\N
180	plugin::content-manager.explorer.create	{}	api::product-page.product-page	{"fields": ["description", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:27.825	2023-11-15 00:02:27.825	\N	\N
263	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "avatar"]}	[]	2023-11-27 23:11:00.322	2023-11-27 23:11:00.322	\N	\N
352	plugin::content-manager.explorer.update	{}	api::home-page.home-page	{"fields": ["title", "banner", "categories.title", "categories.icon", "advantages.title", "advantages.description", "advantages.image", "advantages.subject"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 20:06:47.719	2023-12-03 20:06:47.719	\N	\N
185	plugin::content-manager.explorer.read	{}	api::product-page.product-page	{"fields": ["description", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:28.941	2023-11-15 00:02:28.941	\N	\N
356	plugin::content-manager.explorer.create	{}	api::introduce.introduce	{"fields": ["banners", "short_text", "long_text", "attribute_list.title", "attribute_list.image", "attribute_list.count", "attribute_list.unit", "attribute_list.character", "histories.title", "histories.image", "histories.description", "histories.year", "missions.title", "missions.description", "missions.image", "missions.light_image", "ads.title", "ads.description", "ads.images", "ads.button", "ads.items", "banner", "bg"], "locales": ["en", "vi-VN"]}	[]	2023-12-07 21:18:52.756	2023-12-07 21:18:52.756	\N	\N
357	plugin::content-manager.explorer.read	{}	api::introduce.introduce	{"fields": ["banners", "short_text", "long_text", "attribute_list.title", "attribute_list.image", "attribute_list.count", "attribute_list.unit", "attribute_list.character", "histories.title", "histories.image", "histories.description", "histories.year", "missions.title", "missions.description", "missions.image", "missions.light_image", "ads.title", "ads.description", "ads.images", "ads.button", "ads.items", "banner", "bg"], "locales": ["en", "vi-VN"]}	[]	2023-12-07 21:18:52.98	2023-12-07 21:18:52.98	\N	\N
358	plugin::content-manager.explorer.update	{}	api::introduce.introduce	{"fields": ["banners", "short_text", "long_text", "attribute_list.title", "attribute_list.image", "attribute_list.count", "attribute_list.unit", "attribute_list.character", "histories.title", "histories.image", "histories.description", "histories.year", "missions.title", "missions.description", "missions.image", "missions.light_image", "ads.title", "ads.description", "ads.images", "ads.button", "ads.items", "banner", "bg"], "locales": ["en", "vi-VN"]}	[]	2023-12-07 21:18:53.202	2023-12-07 21:18:53.202	\N	\N
190	plugin::content-manager.explorer.update	{}	api::product-page.product-page	{"fields": ["description", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:30.052	2023-11-15 00:02:30.052	\N	\N
193	plugin::content-manager.explorer.delete	{}	api::post.post	{"locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:30.717	2023-11-15 00:02:30.717	\N	\N
194	plugin::content-manager.explorer.delete	{}	api::product-page.product-page	{"locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:30.936	2023-11-15 00:02:30.936	\N	\N
195	plugin::content-manager.explorer.delete	{}	api::tag.tag	{}	[]	2023-11-15 00:02:31.156	2023-11-15 00:02:31.156	\N	\N
91	plugin::content-manager.explorer.delete	{}	api::product.product	{"locales": ["en", "vi-VN"]}	[]	2023-11-08 10:10:56.995	2023-11-08 10:10:56.995	\N	\N
325	plugin::content-manager.explorer.create	{}	api::post.post	{"fields": ["title", "thumb", "description", "product", "banner", "author", "tags", "post_category", "content_html", "slug", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-12-02 14:44:46.139	2023-12-02 14:44:46.139	\N	\N
326	plugin::content-manager.explorer.read	{}	api::post.post	{"fields": ["title", "thumb", "description", "product", "banner", "author", "tags", "post_category", "content_html", "slug", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-12-02 14:44:46.443	2023-12-02 14:44:46.443	\N	\N
327	plugin::content-manager.explorer.update	{}	api::post.post	{"fields": ["title", "thumb", "description", "product", "banner", "author", "tags", "post_category", "content_html", "slug", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-12-02 14:44:46.737	2023-12-02 14:44:46.737	\N	\N
118	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["title", "icon", "products"], "locales": ["en", "vi-VN"]}	[]	2023-11-08 22:41:15.195	2023-11-08 22:41:15.195	\N	\N
121	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["title", "icon", "products"], "locales": ["en", "vi-VN"]}	[]	2023-11-08 22:41:15.897	2023-11-08 22:41:15.897	\N	\N
124	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["title", "icon", "products"], "locales": ["en", "vi-VN"]}	[]	2023-11-08 22:41:16.631	2023-11-08 22:41:16.631	\N	\N
127	plugin::content-manager.explorer.delete	{}	api::category.category	{"locales": ["en", "vi-VN"]}	[]	2023-11-08 22:41:17.311	2023-11-08 22:41:17.311	\N	\N
128	plugin::content-manager.explorer.delete	{}	api::home-page.home-page	{"locales": ["en", "vi-VN"]}	[]	2023-11-08 22:41:17.536	2023-11-08 22:41:17.536	\N	\N
129	plugin::content-manager.explorer.create	{}	api::footer.footer	{"fields": ["phone", "email", "address"], "locales": ["en", "vi-VN"]}	[]	2023-11-10 02:11:18.845	2023-11-10 02:11:18.845	\N	\N
130	plugin::content-manager.explorer.read	{}	api::footer.footer	{"fields": ["phone", "email", "address"], "locales": ["en", "vi-VN"]}	[]	2023-11-10 02:11:19.077	2023-11-10 02:11:19.077	\N	\N
131	plugin::content-manager.explorer.update	{}	api::footer.footer	{"fields": ["phone", "email", "address"], "locales": ["en", "vi-VN"]}	[]	2023-11-10 02:11:19.307	2023-11-10 02:11:19.307	\N	\N
132	plugin::content-manager.explorer.delete	{}	api::footer.footer	{"locales": ["en", "vi-VN"]}	[]	2023-11-10 02:11:19.535	2023-11-10 02:11:19.535	\N	\N
344	plugin::content-manager.explorer.create	{}	api::contact.contact	{"fields": ["title", "email", "phone_number", "address", "twiter_link", "fb_link", "insta_link", "pinterest_link", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 09:47:04.023	2023-12-03 09:47:04.023	\N	\N
345	plugin::content-manager.explorer.read	{}	api::contact.contact	{"fields": ["title", "email", "phone_number", "address", "twiter_link", "fb_link", "insta_link", "pinterest_link", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 09:47:04.32	2023-12-03 09:47:04.32	\N	\N
346	plugin::content-manager.explorer.update	{}	api::contact.contact	{"fields": ["title", "email", "phone_number", "address", "twiter_link", "fb_link", "insta_link", "pinterest_link", "banner"], "locales": ["en", "vi-VN"]}	[]	2023-12-03 09:47:04.617	2023-12-03 09:47:04.617	\N	\N
260	plugin::content-manager.explorer.delete	{}	api::post-category.post-category	{"locales": ["en", "vi-VN"]}	[]	2023-11-27 22:35:43.022	2023-11-27 22:35:43.022	\N	\N
196	plugin::content-manager.explorer.publish	{}	api::post.post	{"locales": ["en", "vi-VN"]}	[]	2023-11-15 00:02:31.376	2023-11-15 00:02:31.376	\N	\N
277	plugin::content-manager.explorer.create	{}	api::tag.tag	{"fields": ["title", "posts"]}	[]	2023-11-27 23:20:23.271	2023-11-27 23:20:23.271	\N	\N
279	plugin::content-manager.explorer.read	{}	api::tag.tag	{"fields": ["title", "posts"]}	[]	2023-11-27 23:20:23.882	2023-11-27 23:20:23.882	\N	\N
281	plugin::content-manager.explorer.update	{}	api::tag.tag	{"fields": ["title", "posts"]}	[]	2023-11-27 23:20:24.498	2023-11-27 23:20:24.498	\N	\N
300	plugin::content-manager.explorer.create	{}	api::post-category.post-category	{"fields": ["title", "posts", "slug"], "locales": ["en", "vi-VN"]}	[]	2023-11-29 21:43:58.079	2023-11-29 21:43:58.079	\N	\N
301	plugin::content-manager.explorer.read	{}	api::post-category.post-category	{"fields": ["title", "posts", "slug"], "locales": ["en", "vi-VN"]}	[]	2023-11-29 21:43:58.321	2023-11-29 21:43:58.321	\N	\N
302	plugin::content-manager.explorer.update	{}	api::post-category.post-category	{"fields": ["title", "posts", "slug"], "locales": ["en", "vi-VN"]}	[]	2023-11-29 21:43:58.564	2023-11-29 21:43:58.564	\N	\N
309	plugin::content-manager.explorer.delete	{}	api::introduce.introduce	{"locales": ["en", "vi-VN"]}	[]	2023-12-01 17:06:43.554	2023-12-01 17:06:43.554	\N	\N
228	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["short_name", "name", "full_name", "thumb", "category", "model", "manufacturer", "origin", "description", "technical_feature", "product_specifications.title", "product_specifications.description", "product_documents.title", "product_documents.description", "product_documents.attachment", "banner", "slug", "galleries.thumb", "galleries.file", "galleries.title", "galleries.description", "galleries.link", "galleries2.thumb", "galleries2.file", "galleries2.title", "galleries2.description", "galleries2.link", "guides.thumb", "guides.file", "guides.title", "guides.description", "guides.link", "videos.thumb", "videos.file", "videos.title", "videos.description", "videos.link", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-11-22 09:44:30.87	2023-11-22 09:44:30.87	\N	\N
230	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["short_name", "name", "full_name", "thumb", "category", "model", "manufacturer", "origin", "description", "technical_feature", "product_specifications.title", "product_specifications.description", "product_documents.title", "product_documents.description", "product_documents.attachment", "banner", "slug", "galleries.thumb", "galleries.file", "galleries.title", "galleries.description", "galleries.link", "galleries2.thumb", "galleries2.file", "galleries2.title", "galleries2.description", "galleries2.link", "guides.thumb", "guides.file", "guides.title", "guides.description", "guides.link", "videos.thumb", "videos.file", "videos.title", "videos.description", "videos.link", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-11-22 09:44:31.354	2023-11-22 09:44:31.354	\N	\N
232	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["short_name", "name", "full_name", "thumb", "category", "model", "manufacturer", "origin", "description", "technical_feature", "product_specifications.title", "product_specifications.description", "product_documents.title", "product_documents.description", "product_documents.attachment", "banner", "slug", "galleries.thumb", "galleries.file", "galleries.title", "galleries.description", "galleries.link", "galleries2.thumb", "galleries2.file", "galleries2.title", "galleries2.description", "galleries2.link", "guides.thumb", "guides.file", "guides.title", "guides.description", "guides.link", "videos.thumb", "videos.file", "videos.title", "videos.description", "videos.link", "posts"], "locales": ["en", "vi-VN"]}	[]	2023-11-22 09:44:31.853	2023-11-22 09:44:31.853	\N	\N
236	plugin::content-manager.explorer.delete	{}	api::service-page.service-page	{"locales": ["en", "vi-VN"]}	[]	2023-11-26 09:42:43.586	2023-11-26 09:42:43.586	\N	\N
237	plugin::content-manager.explorer.create	{}	api::service.service	{"fields": ["title", "image", "description"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 09:44:24.376	2023-11-26 09:44:24.376	\N	\N
238	plugin::content-manager.explorer.read	{}	api::service.service	{"fields": ["title", "image", "description"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 09:44:24.631	2023-11-26 09:44:24.631	\N	\N
239	plugin::content-manager.explorer.update	{}	api::service.service	{"fields": ["title", "image", "description"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 09:44:24.881	2023-11-26 09:44:24.881	\N	\N
240	plugin::content-manager.explorer.delete	{}	api::service.service	{"locales": ["en", "vi-VN"]}	[]	2023-11-26 09:44:25.134	2023-11-26 09:44:25.134	\N	\N
250	plugin::content-manager.explorer.create	{}	api::service-page.service-page	{"fields": ["banner", "services", "commits.title", "commits.description", "commits.image", "customer_responses.avatar", "customer_responses.name", "customer_responses.company", "customer_responses.comment", "partners.image", "questions.question", "questions.answer"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 10:48:41.647	2023-11-26 10:48:41.647	\N	\N
251	plugin::content-manager.explorer.read	{}	api::service-page.service-page	{"fields": ["banner", "services", "commits.title", "commits.description", "commits.image", "customer_responses.avatar", "customer_responses.name", "customer_responses.company", "customer_responses.comment", "partners.image", "questions.question", "questions.answer"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 10:48:41.892	2023-11-26 10:48:41.892	\N	\N
252	plugin::content-manager.explorer.update	{}	api::service-page.service-page	{"fields": ["banner", "services", "commits.title", "commits.description", "commits.image", "customer_responses.avatar", "customer_responses.name", "customer_responses.company", "customer_responses.comment", "partners.image", "questions.question", "questions.answer"], "locales": ["en", "vi-VN"]}	[]	2023-11-26 10:48:42.136	2023-11-26 10:48:42.136	\N	\N
\.


--
-- TOC entry 4301 (class 0 OID 18349)
-- Dependencies: 244
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
70	70	1	58
257	253	1	126
258	254	1	127
259	255	1	128
260	256	1	129
344	340	1	174
264	260	1	133
184	180	1	92
348	344	1	175
349	345	1	176
265	261	1	134
266	262	1	135
189	185	1	97
350	346	1	177
267	263	1	136
194	190	1	102
354	350	1	178
197	193	1	105
198	194	1	106
95	91	1	73
199	195	1	107
200	196	1	108
355	351	1	179
356	352	1	180
360	356	1	181
361	357	1	182
362	358	1	183
281	277	1	138
283	279	1	140
285	281	1	142
122	118	1	74
125	121	1	77
128	124	1	80
131	127	1	83
132	128	1	84
133	129	1	85
134	130	1	86
135	131	1	87
136	132	1	88
304	300	1	152
305	301	1	153
306	302	1	154
232	228	1	110
234	230	1	112
236	232	1	114
313	309	1	161
240	236	1	118
241	237	1	119
242	238	1	120
243	239	1	121
244	240	1	122
329	325	1	165
330	326	1	166
254	250	1	123
255	251	1	124
256	252	1	125
331	327	1	167
\.


--
-- TOC entry 4279 (class 0 OID 18224)
-- Dependencies: 222
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2023-11-08 09:51:32.606	2023-11-08 09:51:32.606	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2023-11-08 09:51:33.019	2023-11-08 09:51:33.019	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2023-11-08 09:51:33.32	2023-11-08 09:51:33.32	\N	\N
\.


--
-- TOC entry 4277 (class 0 OID 18213)
-- Dependencies: 220
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	admin	\N	\N	admin@gmail.com	$2a$10$EOGYTpAksBnUqzXffHaI4erp9Oj4WddLZJEcJnzu1ZPzCCxlSYY6W	\N	\N	t	f	\N	2023-11-08 09:52:23.944	2023-11-08 09:52:23.944	\N	\N
\.


--
-- TOC entry 4303 (class 0 OID 18361)
-- Dependencies: 246
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- TOC entry 4329 (class 0 OID 19046)
-- Dependencies: 272
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, title, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	Chức năng sưởi	2023-11-08 23:07:09.103	2023-11-08 23:07:09.103	1	1	vi-VN
2	Đèn chiếu vàng da	2023-11-08 23:07:30.039	2023-11-08 23:07:30.039	1	1	vi-VN
4	Hỗ trợ  sơ sinh	2023-11-08 23:09:04.035	2023-11-12 14:34:29.686	1	1	vi-VN
3	Hỗ trợ  hô hấp	2023-11-08 23:08:25.328	2023-11-12 14:34:37.342	1	1	vi-VN
\.


--
-- TOC entry 4339 (class 0 OID 19093)
-- Dependencies: 282
-- Data for Name: categories_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_localizations_links (id, category_id, inv_category_id, category_order) FROM stdin;
\.


--
-- TOC entry 4333 (class 0 OID 19068)
-- Dependencies: 276
-- Data for Name: components_home_advantages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_home_advantages (id, title, description, subject) FROM stdin;
3	Cẩm nang kiến thức chăm sóc sức khỏe	Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada.	\N
1	Cẩm nang kiến thức chăm sóc sức khỏe	Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada.	\N
4	Công bố giường điều trị đa năng cho trẻ sơ sinh	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et	Nghiên cứu
\.


--
-- TOC entry 4335 (class 0 OID 19077)
-- Dependencies: 278
-- Data for Name: components_home_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_home_domains (id, title) FROM stdin;
2	Sửa chữa & Linh kiện
1	Bảo dưỡng & Bảo hành
\.


--
-- TOC entry 4337 (class 0 OID 19084)
-- Dependencies: 280
-- Data for Name: components_home_home_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_home_home_posts (id, subject, title, description) FROM stdin;
2	Nghiên cứu	Công bố giường điều trị đa năng cho trẻ sơ sinh	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
\.


--
-- TOC entry 4415 (class 0 OID 20626)
-- Dependencies: 358
-- Data for Name: components_introduce_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_introduce_ads (id, title, description, button, items) FROM stdin;
2	Tailored Services designed for our Clients	Your field and industry changes the scope of needs, considerations, legal challenges and operational concerns. Our experience across broad industries allows you the best of all worlds.\n\nExperience with your space, and an understanding of what works across fields.	Services	Within the mobile and website related categories, no other agency has been recognized\nWe're a world-class team of diverse individuals
1	Our Mission is to Help Our Clients become Future-ready	Your field and industry changes the scope of needs, considerations, legal challenges and operational concerns. Our experience across broad industries allows you the best of all worlds.\n\nExperience with your space, and an understanding of what works across fields.	Our Philosophy	Within the mobile and website related categories, no other agency has been recognized\nWe're a world-class team of diverse individuals
\.


--
-- TOC entry 4407 (class 0 OID 20531)
-- Dependencies: 350
-- Data for Name: components_introduce_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_introduce_attributes (id, title, count, unit, "character") FROM stdin;
7	Khách hàng	50	\N	K
5	Quy mô nhà máy	4	m2	K
6	Quốc gia	50	\N	\N
8	Sản phẩm	100	\N	\N
2	Sản phẩm	100	\N	\N
4	Quy mô nhà máy	4000	m2	\N
1	Quốc gia	5	\N	\N
3	Khách hàng	50000	\N	\N
\.


--
-- TOC entry 4411 (class 0 OID 20579)
-- Dependencies: 354
-- Data for Name: components_introduce_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_introduce_histories (id, title, description, year) FROM stdin;
3	Archy Founding	The company is founded by John Smith, an experienced architect with a passion for sustainable design.	2020-2023
4	Archy Founding	The company is founded by John Smith, an experienced architect with a passion for sustainable design.	2020-2023
2	Archy Founding	The company is founded by John Smith, an experienced architect with a passion for sustainable design.	2000
5	Archy Founding	The company is founded by John Smith, an experienced architect with a passion for sustainable design.	2026
\.


--
-- TOC entry 4413 (class 0 OID 20604)
-- Dependencies: 356
-- Data for Name: components_introduce_missions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_introduce_missions (id, title, description) FROM stdin;
1	Sứ mệnh	BBTIME đặt cho mình sứ mệnh "Vì một cuộc sống tốt đẹp hơn cho mọi người", với 3 trụ cột cốt lõi là Công nghệ - Công nghiệp, Thương mại Dịch vụ, Thiện nguyện Xã hội.
2	Giá trị cốt lõi	Tạo nên những sản phẩm, dịch vụ có chất lượng tối ưu, mang lại sự hài lòng cho khách hàng ở mức độ cao nhất
3	Tầm nhìn	Trải qua chặng đường dài trưởng thành và phát triển, chính những con người BBTIME đã làm nên những giá trị tốt đẹp, đóng góp vào thành công của Công ty hôm nay.
\.


--
-- TOC entry 4357 (class 0 OID 19572)
-- Dependencies: 300
-- Data for Name: components_product_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_product_documents (id, title, description) FROM stdin;
2	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n
4	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
5	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
7	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
3	brochures	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
6	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
12	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n
9	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
10	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
1	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
11	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
8	brochures	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n
\.


--
-- TOC entry 4367 (class 0 OID 19790)
-- Dependencies: 310
-- Data for Name: components_product_galleries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_product_galleries (id, title, description, link) FROM stdin;
58	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
56	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
57	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
55	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
5	\N	\N	\N
6	\N	\N	\N
7	\N	\N	\N
8	\N	\N	\N
13	\N	\N	\N
14	\N	\N	\N
15	\N	\N	\N
16	\N	\N	\N
17	\N	\N	\N
18	\N	\N	\N
19	\N	\N	\N
20	\N	\N	\N
25	\N	\N	\N
26	\N	\N	\N
27	\N	\N	\N
28	\N	\N	\N
47	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
44	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
31	\N	\N	\N
11	\N	\N	\N
10	\N	\N	\N
9	\N	\N	\N
12	\N	\N	\N
30	\N	\N	\N
29	\N	\N	\N
32	\N	\N	\N
61	Hệ thống Phanh đĩa	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
3	\N	\N	\N
60	Hệ thống Phanh đĩa	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
59	Hệ thống Phanh đĩa	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
64	Huong dan lap dat	\N	https://www.youtube.com/embed/_M208KEJi_I
24	\N	\N	\N
22	\N	\N	\N
21	\N	\N	\N
23	\N	\N	\N
65	Huong dan lap dat	\N	https://www.youtube.com/embed/_M208KEJi_I
63	Huong dan lap dat	\N	https://www.youtube.com/embed/_M208KEJi_I
62	Huong dan lap dat	\N	https://www.youtube.com/embed/_M208KEJi_I
68	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
67	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
69	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
4	\N	\N	\N
2	\N	\N	\N
48	\N	\N	\N
1	\N	\N	\N
38	Động cơ chính hiệu Kubota	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
39	Hộp số tự động	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
37	Hệ thống Phanh đĩa	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n\n	\N
41	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
42	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
40	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
43	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
46	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
45	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
34	\N	\N	\N
35	\N	\N	\N
36	\N	\N	\N
33	\N	\N	\N
50	Động cơ chính hiệu Kubota	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
51	Hộp số tự động	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
49	Hệ thống Phanh đĩa	Equally at home in the heat of the day and the chill of cold storage, built to handle temperature extremes from shift to shift. built to handle  extremes from.\n	\N
54	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
53	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
52	Hướng dẫn lắp đặt	\N	https://www.youtube.com/embed/_M208KEJi_I
66	\N	\N	https://www.youtube.com/embed/_M208KEJi_I
\.


--
-- TOC entry 4359 (class 0 OID 19581)
-- Dependencies: 302
-- Data for Name: components_product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_product_specifications (id, title, description) FROM stdin;
15	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\n
17	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\n
18	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\n
2	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
4	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
5	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
7	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
3	Kích thước (DxRxC):	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.
6	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
14	Dải bước sóng:	Dải tổng 410-500 nm\nDải cường độ trên 10%: 430-480\nĐỉnh tại bước sóng 457,5 nm
13	Bóng đèn:	Đầu chiếu trên: 18 bóng LED ROYAL BLUE Đầu chiếu dưới: 30 bóng LED ROYAL BLUE
9	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
12	Dải bước sóng:	Dải tổng 410-500 nm\nDải cường độ trên 10%: 430-480\nĐỉnh tại bước sóng 457,5 nm
11	Bóng đèn:	Đầu chiếu trên: 18 bóng LED ROYAL BLUE Đầu chiếu dưới: 30 bóng LED ROYAL BLUE
10	Bóng đèn:	Đầu chiếu trên: 18 bóng LED ROYAL BLUE Đầu chiếu dưới: 30 bóng LED ROYAL BLUE
1	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
8	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\nMáng đèn chiếu dưới: 73cm x 35cm x 10cm
16	Kích thước (DxRxC):	Tổng thể: 73cm x 35cm x 45cm\nMáng đèn chiếu trên : 42cm x 10cm x 4cm\n
\.


--
-- TOC entry 4381 (class 0 OID 20032)
-- Dependencies: 324
-- Data for Name: components_service_commits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_service_commits (id, title, description) FROM stdin;
1	Cam kết chính hãng	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking 
2	Dịch vụ nhanh chóng & chất lượng	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking 
3	Hỗ trợ 24/7	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking 
\.


--
-- TOC entry 4385 (class 0 OID 20076)
-- Dependencies: 328
-- Data for Name: components_service_customer_reponses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_service_customer_reponses (id, name, company, comment) FROM stdin;
1	John Martin	Restoration Company	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
2	Kathleen Smith	Fuel Company	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
\.


--
-- TOC entry 4387 (class 0 OID 20097)
-- Dependencies: 330
-- Data for Name: components_service_partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_service_partners (id) FROM stdin;
1
2
3
4
5
\.


--
-- TOC entry 4389 (class 0 OID 20114)
-- Dependencies: 332
-- Data for Name: components_service_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_service_questions (id, question, answer) FROM stdin;
1	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
2	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
3	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
4	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. 
5	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
6	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
7	Proin arcu dui id sit	Leverage agile frameworks to provide a robust synopsis for strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
\.


--
-- TOC entry 4319 (class 0 OID 18769)
-- Dependencies: 262
-- Data for Name: components_shared_meta_socials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_shared_meta_socials (id, social_network, title, description) FROM stdin;
\.


--
-- TOC entry 4321 (class 0 OID 18778)
-- Dependencies: 264
-- Data for Name: components_shared_seos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_shared_seos (id, meta_title, meta_description, keywords, meta_robots, structured_data, meta_viewport, canonical_url) FROM stdin;
\.


--
-- TOC entry 4323 (class 0 OID 18787)
-- Dependencies: 266
-- Data for Name: components_shared_seos_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_shared_seos_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
\.


--
-- TOC entry 4419 (class 0 OID 20720)
-- Dependencies: 362
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, title, email, phone_number, address, created_at, updated_at, created_by_id, updated_by_id, locale, twiter_link, fb_link, insta_link, pinterest_link) FROM stdin;
1	Dynamically underwhelm integrated outsourcing\nvia timely models. Rapidiously reconceptualize visionary imperatives without	blog.notebook@gmail.com	+886554 654654	9567 Turner Trace Apt. BC C3G8A4\n	2023-12-03 09:41:44.392	2023-12-03 09:47:21.168	1	1	vi-VN	\N	\N	\N	\N
\.


--
-- TOC entry 4421 (class 0 OID 20731)
-- Dependencies: 364
-- Data for Name: contacts_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_localizations_links (id, contact_id, inv_contact_id, contact_order) FROM stdin;
\.


--
-- TOC entry 4289 (class 0 OID 18275)
-- Dependencies: 232
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	suoi.svg	\N	\N	81	80	\N	suoi_39026730ad	.svg	image/svg+xml	6.47	/uploads/suoi_39026730ad.svg	\N	local	\N	/	2023-11-08 10:03:30.731	2023-11-08 10:03:30.731	1	1
4	den_chieu.svg	\N	\N	75	80	\N	den_chieu_d1162ff6da	.svg	image/svg+xml	4.81	/uploads/den_chieu_d1162ff6da.svg	\N	local	\N	/	2023-11-08 10:03:30.734	2023-11-08 10:03:30.734	1	1
6	banner.png	\N	\N	2798	1179	{"large": {"ext": ".png", "url": "/uploads/large_banner_5d193871aa.png", "hash": "large_banner_5d193871aa", "mime": "image/png", "name": "large_banner.png", "path": null, "size": 739.66, "width": 1000, "height": 421}, "small": {"ext": ".png", "url": "/uploads/small_banner_5d193871aa.png", "hash": "small_banner_5d193871aa", "mime": "image/png", "name": "small_banner.png", "path": null, "size": 203.48, "width": 500, "height": 211}, "medium": {"ext": ".png", "url": "/uploads/medium_banner_5d193871aa.png", "hash": "medium_banner_5d193871aa", "mime": "image/png", "name": "medium_banner.png", "path": null, "size": 432.18, "width": 750, "height": 316}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_banner_5d193871aa.png", "hash": "thumbnail_banner_5d193871aa", "mime": "image/png", "name": "thumbnail_banner.png", "path": null, "size": 56.44, "width": 245, "height": 103}}	banner_5d193871aa	.png	image/png	943.86	/uploads/banner_5d193871aa.png	\N	local	\N	/	2023-11-08 10:06:22.983	2023-11-08 10:06:22.983	1	1
7	den_chieu_vang_da_tre_so_sinh.png	\N	\N	270	567	{"small": {"ext": ".png", "url": "/uploads/small_den_chieu_vang_da_tre_so_sinh_9a224ed897.png", "hash": "small_den_chieu_vang_da_tre_so_sinh_9a224ed897", "mime": "image/png", "name": "small_den_chieu_vang_da_tre_so_sinh.png", "path": null, "size": 94.83, "width": 238, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_den_chieu_vang_da_tre_so_sinh_9a224ed897.png", "hash": "thumbnail_den_chieu_vang_da_tre_so_sinh_9a224ed897", "mime": "image/png", "name": "thumbnail_den_chieu_vang_da_tre_so_sinh.png", "path": null, "size": 14.7, "width": 74, "height": 156}}	den_chieu_vang_da_tre_so_sinh_9a224ed897	.png	image/png	29.43	/uploads/den_chieu_vang_da_tre_so_sinh_9a224ed897.png	\N	local	\N	/	2023-11-08 10:12:09.546	2023-11-08 10:12:09.546	1	1
8	bao_duong.svg	\N	\N	121	120	\N	bao_duong_df430c6f9b	.svg	image/svg+xml	10.62	/uploads/bao_duong_df430c6f9b.svg	\N	local	\N	/	2023-11-08 10:19:46.621	2023-11-08 10:19:46.621	1	1
9	sua_chua.svg	\N	\N	120	120	\N	sua_chua_ed9989f4a5	.svg	image/svg+xml	6.60	/uploads/sua_chua_ed9989f4a5.svg	\N	local	\N	/	2023-11-08 10:19:46.664	2023-11-08 10:19:46.664	1	1
14	leu_oxy.png	\N	\N	270	567	{"small": {"ext": ".png", "url": "/uploads/small_leu_oxy_615f6dd501.png", "hash": "small_leu_oxy_615f6dd501", "mime": "image/png", "name": "small_leu_oxy.png", "path": null, "size": 94.83, "width": 238, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_leu_oxy_615f6dd501.png", "hash": "thumbnail_leu_oxy_615f6dd501", "mime": "image/png", "name": "thumbnail_leu_oxy.png", "path": null, "size": 14.7, "width": 74, "height": 156}}	leu_oxy_615f6dd501	.png	image/png	29.43	/uploads/leu_oxy_615f6dd501.png	\N	local	\N	/	2023-11-09 22:18:15.7	2023-11-09 22:18:15.7	1	1
15	giuong_so_sinh.png	\N	\N	270	377	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_giuong_so_sinh_61a56f0e61.png", "hash": "thumbnail_giuong_so_sinh_61a56f0e61", "mime": "image/png", "name": "thumbnail_giuong_so_sinh.png", "path": null, "size": 16.67, "width": 112, "height": 156}}	giuong_so_sinh_61a56f0e61	.png	image/png	15.92	/uploads/giuong_so_sinh_61a56f0e61.png	\N	local	\N	/	2023-11-09 22:18:15.681	2023-11-09 22:18:15.681	1	1
16	den_chieu_2_mat.png	\N	\N	270	280	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_den_chieu_2_mat_c9cd83b2a9.png", "hash": "thumbnail_den_chieu_2_mat_c9cd83b2a9", "mime": "image/png", "name": "thumbnail_den_chieu_2_mat.png", "path": null, "size": 19.52, "width": 150, "height": 156}}	den_chieu_2_mat_c9cd83b2a9	.png	image/png	11.46	/uploads/den_chieu_2_mat_c9cd83b2a9.png	\N	local	\N	/	2023-11-09 22:18:15.908	2023-11-09 22:18:15.908	1	1
17	giuong_hoi_suc.png	\N	\N	270	360	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_giuong_hoi_suc_d695b2adc1.png", "hash": "thumbnail_giuong_hoi_suc_d695b2adc1", "mime": "image/png", "name": "thumbnail_giuong_hoi_suc.png", "path": null, "size": 14.34, "width": 117, "height": 156}}	giuong_hoi_suc_d695b2adc1	.png	image/png	16.25	/uploads/giuong_hoi_suc_d695b2adc1.png	\N	local	\N	/	2023-11-09 22:18:15.992	2023-11-09 22:18:15.992	1	1
19	cpap.png	\N	\N	270	553	{"small": {"ext": ".png", "url": "/uploads/small_cpap_a1f9e5a8de.png", "hash": "small_cpap_a1f9e5a8de", "mime": "image/png", "name": "small_cpap.png", "path": null, "size": 99.5, "width": 244, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_cpap_a1f9e5a8de.png", "hash": "thumbnail_cpap_a1f9e5a8de", "mime": "image/png", "name": "thumbnail_cpap.png", "path": null, "size": 14.73, "width": 76, "height": 156}}	cpap_a1f9e5a8de	.png	image/png	32.10	/uploads/cpap_a1f9e5a8de.png	\N	local	\N	/	2023-11-09 22:18:16.138	2023-11-09 22:18:16.138	1	1
21	giuong_da_nang.png	\N	\N	270	562	{"small": {"ext": ".png", "url": "/uploads/small_giuong_da_nang_9c2af63192.png", "hash": "small_giuong_da_nang_9c2af63192", "mime": "image/png", "name": "small_giuong_da_nang.png", "path": null, "size": 104.18, "width": 240, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_giuong_da_nang_9c2af63192.png", "hash": "thumbnail_giuong_da_nang_9c2af63192", "mime": "image/png", "name": "thumbnail_giuong_da_nang.png", "path": null, "size": 15.81, "width": 75, "height": 156}}	giuong_da_nang_9c2af63192	.png	image/png	27.61	/uploads/giuong_da_nang_9c2af63192.png	\N	local	\N	/	2023-11-09 22:18:16.435	2023-11-09 22:18:16.435	1	1
22	may_suoi.png	\N	\N	270	433	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_may_suoi_01376b8528.png", "hash": "thumbnail_may_suoi_01376b8528", "mime": "image/png", "name": "thumbnail_may_suoi.png", "path": null, "size": 26.42, "width": 97, "height": 156}}	may_suoi_01376b8528	.png	image/png	38.08	/uploads/may_suoi_01376b8528.png	\N	local	\N	/	2023-11-09 22:18:16.516	2023-11-09 22:18:16.516	1	1
25	sinh.svg	\N	\N	81	80	\N	sinh_41b2b0d2b7	.svg	image/svg+xml	8.90	/uploads/sinh_41b2b0d2b7.svg	\N	local	\N	/	2023-11-12 14:34:18.75	2023-11-12 14:34:18.75	1	1
26	ho_hap.svg	\N	\N	81	80	\N	ho_hap_110b65cab2	.svg	image/svg+xml	4.27	/uploads/ho_hap_110b65cab2.svg	\N	local	\N	/	2023-11-12 14:34:18.759	2023-11-12 14:34:18.759	1	1
28	ghe.png	\N	\N	960	1080	{"large": {"ext": ".png", "url": "/uploads/large_ghe_c07930f469.png", "hash": "large_ghe_c07930f469", "mime": "image/png", "name": "large_ghe.png", "path": null, "size": 1065.73, "width": 889, "height": 1000}, "small": {"ext": ".png", "url": "/uploads/small_ghe_c07930f469.png", "hash": "small_ghe_c07930f469", "mime": "image/png", "name": "small_ghe.png", "path": null, "size": 274.4, "width": 444, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_ghe_c07930f469.png", "hash": "medium_ghe_c07930f469", "mime": "image/png", "name": "medium_ghe.png", "path": null, "size": 610, "width": 667, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_ghe_c07930f469.png", "hash": "thumbnail_ghe_c07930f469", "mime": "image/png", "name": "thumbnail_ghe.png", "path": null, "size": 35.01, "width": 139, "height": 156}}	ghe_c07930f469	.png	image/png	302.27	/uploads/ghe_c07930f469.png	\N	local	\N	/	2023-11-14 22:29:25.673	2023-11-14 22:29:25.673	1	1
18	den_chieu_cay.png	\N	\N	270	750	{"small": {"ext": ".png", "url": "/uploads/small_den_chieu_cay_c8a7b41010.png", "hash": "small_den_chieu_cay_c8a7b41010", "mime": "image/png", "name": "small_den_chieu_cay.png", "path": null, "size": 34.2, "width": 180, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_den_chieu_cay_c8a7b41010.png", "hash": "thumbnail_den_chieu_cay_c8a7b41010", "mime": "image/png", "name": "thumbnail_den_chieu_cay.png", "path": null, "size": 5.88, "width": 56, "height": 156}}	den_chieu_cay_c8a7b41010	.png	image/png	14.96	/uploads/den_chieu_cay_c8a7b41010.png	\N	local	\N	/	2023-11-09 22:18:16.024	2023-11-16 22:14:45.982	1	1
20	giuong_suoi.png	\N	\N	270	567	{"small": {"ext": ".png", "url": "/uploads/small_giuong_suoi_1e9a3ade46.png", "hash": "small_giuong_suoi_1e9a3ade46", "mime": "image/png", "name": "small_giuong_suoi.png", "path": null, "size": 94.83, "width": 238, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_giuong_suoi_1e9a3ade46.png", "hash": "thumbnail_giuong_suoi_1e9a3ade46", "mime": "image/png", "name": "thumbnail_giuong_suoi.png", "path": null, "size": 14.7, "width": 74, "height": 156}}	giuong_suoi_1e9a3ade46	.png	image/png	29.43	/uploads/giuong_suoi_1e9a3ade46.png	\N	local	\N	/	2023-11-09 22:18:16.326	2023-11-20 01:08:48.476	1	1
63	bg_1.png	\N	\N	570	560	{"small": {"ext": ".png", "url": "/uploads/small_bg_1_9e4124711d.png", "hash": "small_bg_1_9e4124711d", "mime": "image/png", "name": "small_bg_1.png", "path": null, "size": 469.87, "width": 500, "height": 491}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_1_9e4124711d.png", "hash": "thumbnail_bg_1_9e4124711d", "mime": "image/png", "name": "thumbnail_bg_1.png", "path": null, "size": 58.79, "width": 159, "height": 156}}	bg_1_9e4124711d	.png	image/png	149.18	/uploads/bg_1_9e4124711d.png	\N	local	\N	/	2023-12-02 09:52:31.907	2023-12-02 09:52:31.907	1	1
65	2_guamen.png	\N	\N	807	936	{"small": {"ext": ".png", "url": "/uploads/small_2_guamen_c7ea6b9579.png", "hash": "small_2_guamen_c7ea6b9579", "mime": "image/png", "name": "small_2_guamen.png", "path": null, "size": 485.25, "width": 431, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_2_guamen_c7ea6b9579.png", "hash": "medium_2_guamen_c7ea6b9579", "mime": "image/png", "name": "medium_2_guamen.png", "path": null, "size": 1039.2, "width": 647, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_2_guamen_c7ea6b9579.png", "hash": "thumbnail_2_guamen_c7ea6b9579", "mime": "image/png", "name": "thumbnail_2_guamen.png", "path": null, "size": 59.08, "width": 135, "height": 156}}	2_guamen_c7ea6b9579	.png	image/png	265.08	/uploads/2_guamen_c7ea6b9579.png	\N	local	\N	/	2023-12-02 09:52:32.694	2023-12-02 09:52:32.694	1	1
29	em_be.png	\N	\N	960	1080	{"large": {"ext": ".png", "url": "/uploads/large_em_be_5e656a6d5d.png", "hash": "large_em_be_5e656a6d5d", "mime": "image/png", "name": "large_em_be.png", "path": null, "size": 1523.54, "width": 889, "height": 1000}, "small": {"ext": ".png", "url": "/uploads/small_em_be_5e656a6d5d.png", "hash": "small_em_be_5e656a6d5d", "mime": "image/png", "name": "small_em_be.png", "path": null, "size": 422.8, "width": 444, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_em_be_5e656a6d5d.png", "hash": "medium_em_be_5e656a6d5d", "mime": "image/png", "name": "medium_em_be.png", "path": null, "size": 903.26, "width": 667, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_em_be_5e656a6d5d.png", "hash": "thumbnail_em_be_5e656a6d5d", "mime": "image/png", "name": "thumbnail_em_be.png", "path": null, "size": 53.27, "width": 139, "height": 156}}	em_be_5e656a6d5d	.png	image/png	334.36	/uploads/em_be_5e656a6d5d.png	\N	local	\N	/	2023-11-14 22:29:26.018	2023-11-14 22:29:26.018	1	1
30	me_be.png	\N	\N	960	1080	{"large": {"ext": ".png", "url": "/uploads/large_me_be_959b558789.png", "hash": "large_me_be_959b558789", "mime": "image/png", "name": "large_me_be.png", "path": null, "size": 1485.8, "width": 889, "height": 1000}, "small": {"ext": ".png", "url": "/uploads/small_me_be_959b558789.png", "hash": "small_me_be_959b558789", "mime": "image/png", "name": "small_me_be.png", "path": null, "size": 421.25, "width": 444, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_me_be_959b558789.png", "hash": "medium_me_be_959b558789", "mime": "image/png", "name": "medium_me_be.png", "path": null, "size": 892.82, "width": 667, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_me_be_959b558789.png", "hash": "thumbnail_me_be_959b558789", "mime": "image/png", "name": "thumbnail_me_be.png", "path": null, "size": 51.12, "width": 139, "height": 156}}	me_be_959b558789	.png	image/png	410.84	/uploads/me_be_959b558789.png	\N	local	\N	/	2023-11-14 22:29:26.278	2023-11-14 22:29:26.278	1	1
31	test.txt	\N	\N	\N	\N	\N	New_Text_Document_8495170051	.txt	text/plain	0.01	/uploads/New_Text_Document_8495170051.txt	\N	local	\N	/	2023-11-16 22:16:43.219	2023-11-21 21:45:55.859	1	1
32	clutch1.png	\N	\N	610	458	{"small": {"ext": ".png", "url": "/uploads/small_clutch1_cb6f09e7c0.png", "hash": "small_clutch1_cb6f09e7c0", "mime": "image/png", "name": "small_clutch1.png", "path": null, "size": 101.99, "width": 500, "height": 375}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_clutch1_cb6f09e7c0.png", "hash": "thumbnail_clutch1_cb6f09e7c0", "mime": "image/png", "name": "thumbnail_clutch1.png", "path": null, "size": 22.56, "width": 208, "height": 156}}	clutch1_cb6f09e7c0	.png	image/png	44.21	/uploads/clutch1_cb6f09e7c0.png	\N	local	\N	/	2023-11-21 21:46:05.582	2023-11-21 21:46:05.582	1	1
33	gear.png	\N	\N	799	450	{"small": {"ext": ".png", "url": "/uploads/small_gear_432b5d8406.png", "hash": "small_gear_432b5d8406", "mime": "image/png", "name": "small_gear.png", "path": null, "size": 247.3, "width": 500, "height": 282}, "medium": {"ext": ".png", "url": "/uploads/medium_gear_432b5d8406.png", "hash": "medium_gear_432b5d8406", "mime": "image/png", "name": "medium_gear.png", "path": null, "size": 542.71, "width": 750, "height": 422}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_gear_432b5d8406.png", "hash": "thumbnail_gear_432b5d8406", "mime": "image/png", "name": "thumbnail_gear.png", "path": null, "size": 63.16, "width": 245, "height": 138}}	gear_432b5d8406	.png	image/png	155.74	/uploads/gear_432b5d8406.png	\N	local	\N	/	2023-11-21 21:46:05.654	2023-11-21 21:46:05.654	1	1
34	engine.png	\N	\N	1000	1000	{"small": {"ext": ".png", "url": "/uploads/small_engine_01c9cb3f91.png", "hash": "small_engine_01c9cb3f91", "mime": "image/png", "name": "small_engine.png", "path": null, "size": 261.06, "width": 500, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_engine_01c9cb3f91.png", "hash": "medium_engine_01c9cb3f91", "mime": "image/png", "name": "medium_engine.png", "path": null, "size": 532.87, "width": 750, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_engine_01c9cb3f91.png", "hash": "thumbnail_engine_01c9cb3f91", "mime": "image/png", "name": "thumbnail_engine.png", "path": null, "size": 32.6, "width": 156, "height": 156}}	engine_01c9cb3f91	.png	image/png	238.40	/uploads/engine_01c9cb3f91.png	\N	local	\N	/	2023-11-21 21:46:05.928	2023-11-21 21:46:05.928	1	1
36	microscope.png	\N	\N	612	408	{"small": {"ext": ".png", "url": "/uploads/small_microscope_28454d90ba.png", "hash": "small_microscope_28454d90ba", "mime": "image/png", "name": "small_microscope.png", "path": null, "size": 287.95, "width": 500, "height": 333}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_microscope_28454d90ba.png", "hash": "thumbnail_microscope_28454d90ba", "mime": "image/png", "name": "thumbnail_microscope.png", "path": null, "size": 74.22, "width": 234, "height": 156}}	microscope_28454d90ba	.png	image/png	96.11	/uploads/microscope_28454d90ba.png	\N	local	\N	/	2023-11-22 09:41:33.791	2023-11-22 09:41:33.791	1	1
38	microscope2.png	\N	\N	612	409	{"small": {"ext": ".png", "url": "/uploads/small_microscope2_ea36c6480f.png", "hash": "small_microscope2_ea36c6480f", "mime": "image/png", "name": "small_microscope2.png", "path": null, "size": 313.11, "width": 500, "height": 334}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_microscope2_ea36c6480f.png", "hash": "thumbnail_microscope2_ea36c6480f", "mime": "image/png", "name": "thumbnail_microscope2.png", "path": null, "size": 76.12, "width": 233, "height": 156}}	microscope2_ea36c6480f	.png	image/png	90.81	/uploads/microscope2_ea36c6480f.png	\N	local	\N	/	2023-11-22 09:41:33.797	2023-11-22 09:41:33.797	1	1
37	doctor.png	\N	\N	626	417	{"small": {"ext": ".png", "url": "/uploads/small_doctor_5c0ab5fd9b.png", "hash": "small_doctor_5c0ab5fd9b", "mime": "image/png", "name": "small_doctor.png", "path": null, "size": 244.27, "width": 500, "height": 333}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_doctor_5c0ab5fd9b.png", "hash": "thumbnail_doctor_5c0ab5fd9b", "mime": "image/png", "name": "thumbnail_doctor.png", "path": null, "size": 62.08, "width": 234, "height": 156}}	doctor_5c0ab5fd9b	.png	image/png	118.58	/uploads/doctor_5c0ab5fd9b.png	\N	local	\N	/	2023-11-22 09:41:33.796	2023-11-22 09:41:33.796	1	1
64	bg.png	\N	\N	855	840	{"small": {"ext": ".png", "url": "/uploads/small_bg_776d2649e1.png", "hash": "small_bg_776d2649e1", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 487.78, "width": 500, "height": 491}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_776d2649e1.png", "hash": "medium_bg_776d2649e1", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 1035, "width": 750, "height": 737}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_776d2649e1.png", "hash": "thumbnail_bg_776d2649e1", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 59.28, "width": 159, "height": 156}}	bg_776d2649e1	.png	image/png	310.31	/uploads/bg_776d2649e1.png	\N	local	\N	/	2023-12-02 09:52:32.405	2023-12-02 09:52:32.405	1	1
66	2_men.png	\N	\N	807	936	{"small": {"ext": ".png", "url": "/uploads/small_2_men_78245a687e.png", "hash": "small_2_men_78245a687e", "mime": "image/png", "name": "small_2_men.png", "path": null, "size": 362.06, "width": 431, "height": 500}, "medium": {"ext": ".png", "url": "/uploads/medium_2_men_78245a687e.png", "hash": "medium_2_men_78245a687e", "mime": "image/png", "name": "medium_2_men.png", "path": null, "size": 758.5, "width": 647, "height": 750}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_2_men_78245a687e.png", "hash": "thumbnail_2_men_78245a687e", "mime": "image/png", "name": "thumbnail_2_men.png", "path": null, "size": 47.73, "width": 135, "height": 156}}	2_men_78245a687e	.png	image/png	232.09	/uploads/2_men_78245a687e.png	\N	local	\N	/	2023-12-02 09:52:32.728	2023-12-02 09:52:32.728	1	1
39	banner.png	\N	\N	1920	400	{"large": {"ext": ".png", "url": "/uploads/large_banner_71f3c976e4.png", "hash": "large_banner_71f3c976e4", "mime": "image/png", "name": "large_banner.png", "path": null, "size": 257.37, "width": 1000, "height": 208}, "small": {"ext": ".png", "url": "/uploads/small_banner_71f3c976e4.png", "hash": "small_banner_71f3c976e4", "mime": "image/png", "name": "small_banner.png", "path": null, "size": 69.38, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "/uploads/medium_banner_71f3c976e4.png", "hash": "medium_banner_71f3c976e4", "mime": "image/png", "name": "medium_banner.png", "path": null, "size": 146.71, "width": 750, "height": 156}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_banner_71f3c976e4.png", "hash": "thumbnail_banner_71f3c976e4", "mime": "image/png", "name": "thumbnail_banner.png", "path": null, "size": 20.65, "width": 245, "height": 51}}	banner_71f3c976e4	.png	image/png	153.34	/uploads/banner_71f3c976e4.png	\N	local	\N	/	2023-11-26 09:47:34.17	2023-11-26 09:47:34.17	1	1
40	nsw.png	\N	\N	158	45	\N	nsw_d676d185b7	.png	image/png	2.35	/uploads/nsw_d676d185b7.png	\N	local	\N	/	2023-11-26 09:55:59.005	2023-11-26 09:55:59.005	1	1
41	rmit.png	\N	\N	122	49	\N	rmit_7df3228daa	.png	image/png	1.23	/uploads/rmit_7df3228daa.png	\N	local	\N	/	2023-11-26 09:55:59.006	2023-11-26 09:55:59.006	1	1
42	reed_graduation.png	\N	\N	101	58	\N	reed_graduation_11f26fae02	.png	image/png	1.35	/uploads/reed_graduation_11f26fae02.png	\N	local	\N	/	2023-11-26 09:55:59.01	2023-11-26 09:55:59.01	1	1
43	echo.png	\N	\N	121	47	\N	echo_50b2ab5d7e	.png	image/png	1.14	/uploads/echo_50b2ab5d7e.png	\N	local	\N	/	2023-11-26 09:55:59.014	2023-11-26 09:55:59.014	1	1
44	rpdata.png	\N	\N	107	51	\N	rpdata_bbc82c8290	.png	image/png	1.39	/uploads/rpdata_bbc82c8290.png	\N	local	\N	/	2023-11-26 09:55:59.012	2023-11-26 09:55:59.012	1	1
45	avatar_1.png	\N	\N	91	91	\N	avatar_1_62f46f746f	.png	image/png	6.73	/uploads/avatar_1_62f46f746f.png	\N	local	\N	/	2023-11-26 09:55:59.046	2023-11-26 09:55:59.046	1	1
47	24h.svg	\N	\N	50	50	\N	24h_26b5bf39a3	.svg	image/svg+xml	8.86	/uploads/24h_26b5bf39a3.svg	\N	local	\N	/	2023-11-26 09:55:59.561	2023-11-26 09:55:59.561	1	1
48	shield.svg	\N	\N	50	50	\N	shield_179463d776	.svg	image/svg+xml	7.14	/uploads/shield_179463d776.svg	\N	local	\N	/	2023-11-26 09:55:59.562	2023-11-26 09:55:59.562	1	1
49	avatar.png	\N	\N	91	91	\N	avatar_889953c247	.png	image/png	5.57	/uploads/avatar_889953c247.png	\N	local	\N	/	2023-11-26 09:55:59.696	2023-11-26 09:55:59.696	1	1
50	sua_chua.svg	\N	\N	48	52	\N	sua_chua_2a62b591aa	.svg	image/svg+xml	5.83	/uploads/sua_chua_2a62b591aa.svg	\N	local	\N	/	2023-11-26 10:49:46.021	2023-11-26 10:49:46.021	1	1
51	linh_kien.svg	\N	\N	71	51	\N	linh_kien_c1833f0ec5	.svg	image/svg+xml	10.93	/uploads/linh_kien_c1833f0ec5.svg	\N	local	\N	/	2023-11-26 10:49:46.026	2023-11-26 10:49:46.026	1	1
52	bao_tri.svg	\N	\N	48	51	\N	bao_tri_8b3e1a4d0f	.svg	image/svg+xml	9.79	/uploads/bao_tri_8b3e1a4d0f.svg	\N	local	\N	/	2023-11-26 10:49:46.024	2023-11-26 10:49:46.024	1	1
46	huy_hieu.svg	\N	\N	37	50	\N	huy_hieu_8a2e2a8d56	.svg	image/svg+xml	7.33	/uploads/huy_hieu_8a2e2a8d56.svg	\N	local	\N	/	2023-11-26 09:55:59.559	2023-11-26 10:51:27.1	1	1
53	bg.png	\N	\N	2880	600	{"large": {"ext": ".png", "url": "/uploads/large_bg_87497de11c.png", "hash": "large_bg_87497de11c", "mime": "image/png", "name": "large_bg.png", "path": null, "size": 205.95, "width": 1000, "height": 208}, "small": {"ext": ".png", "url": "/uploads/small_bg_87497de11c.png", "hash": "small_bg_87497de11c", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 60.1, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_87497de11c.png", "hash": "medium_bg_87497de11c", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 122.14, "width": 750, "height": 156}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_87497de11c.png", "hash": "thumbnail_bg_87497de11c", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 18.31, "width": 245, "height": 51}}	bg_87497de11c	.png	image/png	315.95	/uploads/bg_87497de11c.png	\N	local	\N	/	2023-11-27 22:19:40.145	2023-11-27 22:19:40.145	1	1
54	bg_2.png	\N	\N	2880	603	{"large": {"ext": ".png", "url": "/uploads/large_bg_2_c9ee4762e9.png", "hash": "large_bg_2_c9ee4762e9", "mime": "image/png", "name": "large_bg_2.png", "path": null, "size": 303.68, "width": 1000, "height": 209}, "small": {"ext": ".png", "url": "/uploads/small_bg_2_c9ee4762e9.png", "hash": "small_bg_2_c9ee4762e9", "mime": "image/png", "name": "small_bg_2.png", "path": null, "size": 89.11, "width": 500, "height": 105}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_2_c9ee4762e9.png", "hash": "medium_bg_2_c9ee4762e9", "mime": "image/png", "name": "medium_bg_2.png", "path": null, "size": 181.65, "width": 750, "height": 157}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_2_c9ee4762e9.png", "hash": "thumbnail_bg_2_c9ee4762e9", "mime": "image/png", "name": "thumbnail_bg_2.png", "path": null, "size": 25.83, "width": 245, "height": 51}}	bg_2_c9ee4762e9	.png	image/png	409.59	/uploads/bg_2_c9ee4762e9.png	\N	local	\N	/	2023-11-27 22:21:05.574	2023-11-27 22:21:05.574	1	1
55	bg.png	\N	\N	2880	600	{"large": {"ext": ".png", "url": "/uploads/large_bg_39d7e3e9fe.png", "hash": "large_bg_39d7e3e9fe", "mime": "image/png", "name": "large_bg.png", "path": null, "size": 169.55, "width": 1000, "height": 208}, "small": {"ext": ".png", "url": "/uploads/small_bg_39d7e3e9fe.png", "hash": "small_bg_39d7e3e9fe", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 59.5, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_39d7e3e9fe.png", "hash": "medium_bg_39d7e3e9fe", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 116.16, "width": 750, "height": 156}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_39d7e3e9fe.png", "hash": "thumbnail_bg_39d7e3e9fe", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 17.59, "width": 245, "height": 51}}	bg_39d7e3e9fe	.png	image/png	172.82	/uploads/bg_39d7e3e9fe.png	\N	local	\N	/	2023-11-28 20:45:54.512	2023-11-28 20:45:54.512	1	1
57	hop.svg	\N	\N	53	56	\N	hop_2be5891faf	.svg	image/svg+xml	1.85	/uploads/hop_2be5891faf.svg	\N	local	\N	/	2023-12-01 17:17:41.621	2023-12-01 17:17:41.621	1	1
58	plane.svg	\N	\N	75	50	\N	plane_5670bf252e	.svg	image/svg+xml	1.63	/uploads/plane_5670bf252e.svg	\N	local	\N	/	2023-12-01 17:17:41.78	2023-12-01 17:17:41.78	1	1
59	nha_may.svg	\N	\N	57	46	\N	nha_may_73ca1eaf6d	.svg	image/svg+xml	1.68	/uploads/nha_may_73ca1eaf6d.svg	\N	local	\N	/	2023-12-01 17:17:41.8	2023-12-01 17:17:41.8	1	1
56	user.svg	\N	\N	56	40	\N	user_83d857f09c	.svg	image/svg+xml	1.67	/uploads/user_83d857f09c.svg	\N	local	\N	/	2023-12-01 17:17:41.62	2023-12-01 17:18:32.466	1	1
60	cpu.svg	\N	\N	130	130	\N	cpu_470f0074f1	.svg	image/svg+xml	3.40	/uploads/cpu_470f0074f1.svg	\N	local	\N	/	2023-12-02 09:27:57.194	2023-12-02 09:27:57.194	1	1
61	crown.svg	\N	\N	130	130	\N	crown_cdd929256c	.svg	image/svg+xml	1.01	/uploads/crown_cdd929256c.svg	\N	local	\N	/	2023-12-02 09:27:57.215	2023-12-02 09:27:57.215	1	1
62	rank.svg	\N	\N	130	130	\N	rank_49d0d59687	.svg	image/svg+xml	1.55	/uploads/rank_49d0d59687.svg	\N	local	\N	/	2023-12-02 09:27:57.268	2023-12-02 09:27:57.268	1	1
67	bg.png	\N	\N	2880	600	{"large": {"ext": ".png", "url": "/uploads/large_bg_381482f4c1.png", "hash": "large_bg_381482f4c1", "mime": "image/png", "name": "large_bg.png", "path": null, "size": 107.01, "width": 1000, "height": 208}, "small": {"ext": ".png", "url": "/uploads/small_bg_381482f4c1.png", "hash": "small_bg_381482f4c1", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 28.93, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_381482f4c1.png", "hash": "medium_bg_381482f4c1", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 59.58, "width": 750, "height": 156}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_381482f4c1.png", "hash": "thumbnail_bg_381482f4c1", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 8.17, "width": 245, "height": 51}}	bg_381482f4c1	.png	image/png	162.08	/uploads/bg_381482f4c1.png	\N	local	\N	/	2023-12-02 15:41:22.061	2023-12-02 15:41:22.061	1	1
68	bg.png	\N	\N	2880	1223	{"large": {"ext": ".png", "url": "/uploads/large_bg_9d77fbb4d6.png", "hash": "large_bg_9d77fbb4d6", "mime": "image/png", "name": "large_bg.png", "path": null, "size": 436.97, "width": 1000, "height": 425}, "small": {"ext": ".png", "url": "/uploads/small_bg_9d77fbb4d6.png", "hash": "small_bg_9d77fbb4d6", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 124.56, "width": 500, "height": 212}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_9d77fbb4d6.png", "hash": "medium_bg_9d77fbb4d6", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 257.62, "width": 750, "height": 318}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_9d77fbb4d6.png", "hash": "thumbnail_bg_9d77fbb4d6", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 36.11, "width": 245, "height": 104}}	bg_9d77fbb4d6	.png	image/png	693.60	/uploads/bg_9d77fbb4d6.png	\N	local	\N	/	2023-12-02 21:31:39.346	2023-12-02 21:31:39.346	1	1
69	bg.png	\N	\N	2880	600	{"large": {"ext": ".png", "url": "/uploads/large_bg_331cc96eaa.png", "hash": "large_bg_331cc96eaa", "mime": "image/png", "name": "large_bg.png", "path": null, "size": 181.68, "width": 1000, "height": 208}, "small": {"ext": ".png", "url": "/uploads/small_bg_331cc96eaa.png", "hash": "small_bg_331cc96eaa", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 52.36, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "/uploads/medium_bg_331cc96eaa.png", "hash": "medium_bg_331cc96eaa", "mime": "image/png", "name": "medium_bg.png", "path": null, "size": 107.75, "width": 750, "height": 156}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_331cc96eaa.png", "hash": "thumbnail_bg_331cc96eaa", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 15.81, "width": 245, "height": 51}}	bg_331cc96eaa	.png	image/png	283.37	/uploads/bg_331cc96eaa.png	\N	local	\N	/	2023-12-03 09:47:17.773	2023-12-03 09:47:17.773	1	1
71	crown_light.svg	\N	\N	130	130	\N	crown_light_5802392841	.svg	image/svg+xml	1.00	/uploads/crown_light_5802392841.svg	\N	local	\N	/	2023-12-05 22:06:34.391	2023-12-05 22:06:34.391	1	1
72	cpu_light.svg	\N	\N	130	130	\N	cpu_light_0e0e7c28a0	.svg	image/svg+xml	3.36	/uploads/cpu_light_0e0e7c28a0.svg	\N	local	\N	/	2023-12-05 22:06:34.395	2023-12-05 22:06:34.395	1	1
73	bg.png	\N	\N	750	750	{"small": {"ext": ".png", "url": "/uploads/small_bg_a01de909ef.png", "hash": "small_bg_a01de909ef", "mime": "image/png", "name": "small_bg.png", "path": null, "size": 378.52, "width": 500, "height": 500}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_bg_a01de909ef.png", "hash": "thumbnail_bg_a01de909ef", "mime": "image/png", "name": "thumbnail_bg.png", "path": null, "size": 46.49, "width": 156, "height": 156}}	bg_a01de909ef	.png	image/png	203.60	/uploads/bg_a01de909ef.png	\N	local	\N	/	2023-12-05 22:56:40.071	2023-12-05 22:56:40.071	1	1
74	rank_light.svg	\N	\N	130	130	\N	rank_light_630e9c6dc5	.svg	image/svg+xml	1.68	/uploads/rank_light_630e9c6dc5.svg	\N	local	\N	/	2023-12-07 20:18:40.859	2023-12-07 20:18:40.859	1	1
\.


--
-- TOC entry 4311 (class 0 OID 18410)
-- Dependencies: 254
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- TOC entry 4309 (class 0 OID 18398)
-- Dependencies: 252
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
1	3	1	api::category.category	icon	1
2	4	2	api::category.category	icon	1
566	31	10	product.document	attachment	1
569	20	4	product.gallery	thumb	1
574	20	4	product.gallery	file	1
579	34	38	product.gallery	thumb	1
582	34	38	product.gallery	file	1
590	55	1	api::post-page.post-page	banner	1
272	19	9	product.gallery	thumb	1
276	19	9	product.gallery	file	1
278	16	2	api::product.product	thumb	1
279	6	2	api::product.product	banner	1
998	38	5	api::post.post	thumb	1
999	55	5	api::post.post	banner	1
1002	37	2	api::post.post	thumb	1
1003	55	2	api::post.post	banner	1
1028	59	5	introduce.attribute	image	1
307	22	22	product.gallery	thumb	1
311	22	22	product.gallery	file	1
1031	37	3	introduce.history	image	1
31	6	2	api::home-page.home-page	banner	1
33	3	1	api::category.category	icon	1
34	4	2	api::category.category	icon	1
514	52	2	api::service.service	image	1
112	29	1	api::product.product	galleries	1
113	28	1	api::product.product	galleries	2
521	43	3	service.partner	image	1
549	22	35	product.gallery	thumb	1
553	21	35	product.gallery	file	1
750	59	4	introduce.attribute	image	1
136	31	2	product.document	attachment	1
137	19	5	product.gallery	thumb	1
79	25	4	api::category.category	icon	1
80	26	3	api::category.category	icon	1
138	20	5	product.gallery	file	1
139	20	8	product.gallery	thumb	1
140	22	6	product.gallery	thumb	1
141	21	7	product.gallery	thumb	1
142	20	8	product.gallery	file	1
143	22	6	product.gallery	file	1
144	22	7	product.gallery	file	1
145	18	3	api::product.product	thumb	1
146	6	3	api::product.product	banner	1
158	31	4	product.document	attachment	1
159	22	13	product.gallery	thumb	1
160	22	14	product.gallery	thumb	1
161	20	15	product.gallery	thumb	1
162	21	13	product.gallery	file	1
163	21	14	product.gallery	file	1
164	20	15	product.gallery	file	1
165	20	16	product.gallery	thumb	1
166	20	16	product.gallery	file	1
167	22	4	api::product.product	thumb	1
168	6	4	api::product.product	banner	1
169	31	5	product.document	attachment	1
170	20	17	product.gallery	thumb	1
171	22	18	product.gallery	thumb	1
172	20	17	product.gallery	file	1
173	22	18	product.gallery	file	1
174	22	19	product.gallery	thumb	1
175	16	20	product.gallery	thumb	1
176	21	19	product.gallery	file	1
177	16	20	product.gallery	file	1
178	21	6	api::product.product	thumb	1
179	6	6	api::product.product	banner	1
191	31	7	product.document	attachment	1
192	22	25	product.gallery	thumb	1
193	21	26	product.gallery	thumb	1
194	22	25	product.gallery	file	1
195	21	26	product.gallery	file	1
196	19	27	product.gallery	thumb	1
197	20	28	product.gallery	thumb	1
198	19	27	product.gallery	file	1
199	20	28	product.gallery	file	1
200	15	9	api::product.product	thumb	1
201	6	9	api::product.product	banner	1
567	31	1	product.document	attachment	1
572	20	1	product.gallery	thumb	1
577	20	1	product.gallery	file	1
580	32	37	product.gallery	thumb	1
583	32	37	product.gallery	file	1
588	7	1	api::product.product	thumb	1
589	54	1	api::product.product	banner	1
273	20	12	product.gallery	thumb	1
277	20	12	product.gallery	file	1
591	31	11	product.document	attachment	1
594	22	30	product.gallery	thumb	1
598	22	30	product.gallery	file	1
305	19	24	product.gallery	thumb	1
309	19	24	product.gallery	file	1
601	34	61	product.gallery	thumb	1
605	38	69	product.gallery	thumb	1
1000	38	4	api::post.post	thumb	1
1001	55	4	api::post.post	banner	1
751	58	1	introduce.attribute	image	1
515	51	3	api::service.service	image	1
522	44	2	service.partner	image	1
551	22	36	product.gallery	thumb	1
555	22	36	product.gallery	file	1
568	20	3	product.gallery	thumb	1
573	20	3	product.gallery	file	1
592	31	8	product.document	attachment	1
595	20	29	product.gallery	thumb	1
599	20	29	product.gallery	file	1
602	33	60	product.gallery	thumb	1
606	36	67	product.gallery	thumb	1
308	21	23	product.gallery	thumb	1
312	21	23	product.gallery	file	1
313	20	5	api::product.product	thumb	1
314	6	5	api::product.product	banner	1
812	9	2	home.domain	icon	1
815	29	1	home.advantage	image	1
516	47	3	service.commit	image	1
523	40	5	service.partner	image	1
527	53	1	api::product-page.product-page	banner	1
752	56	3	introduce.attribute	image	1
1030	57	8	introduce.attribute	image	1
1032	38	2	introduce.history	image	1
1036	71	2	introduce.mission	image	1
1039	61	2	introduce.mission	light_image	1
1041	66	1	introduce.ads	images	1
1042	63	1	introduce.ads	images	2
570	20	2	product.gallery	thumb	1
575	20	2	product.gallery	file	1
593	21	31	product.gallery	thumb	1
269	31	3	product.document	attachment	1
270	20	11	product.gallery	thumb	1
274	20	11	product.gallery	file	1
597	21	31	product.gallery	file	1
604	37	68	product.gallery	thumb	1
994	38	1	api::post.post	thumb	1
995	55	1	api::post.post	banner	1
304	31	6	product.document	attachment	1
306	20	21	product.gallery	thumb	1
310	20	21	product.gallery	file	1
1027	56	7	introduce.attribute	image	1
804	69	1	api::contact.contact	banner	1
813	8	1	home.domain	icon	1
816	28	4	home.advantage	image	1
817	6	1	api::home-page.home-page	banner	1
1034	36	5	introduce.history	image	1
517	48	1	service.commit	image	1
519	45	1	service.customer-reponse	avatar	1
524	42	1	service.partner	image	1
526	39	1	api::service-page.service-page	banner	1
1037	62	3	introduce.mission	image	1
547	31	12	product.document	attachment	1
550	20	34	product.gallery	thumb	1
554	20	34	product.gallery	file	1
558	34	51	product.gallery	thumb	1
1040	74	3	introduce.mission	light_image	1
1043	65	2	introduce.ads	images	1
1044	64	2	introduce.ads	images	2
1045	73	1	api::introduce.introduce	banners	1
1046	36	1	api::introduce.introduce	banners	2
1047	29	1	api::introduce.introduce	banners	3
1048	67	1	api::introduce.introduce	banner	1
1049	68	1	api::introduce.introduce	bg	1
571	21	48	product.gallery	thumb	1
576	17	48	product.gallery	file	1
578	33	39	product.gallery	thumb	1
581	33	39	product.gallery	file	1
596	22	32	product.gallery	thumb	1
600	22	32	product.gallery	file	1
271	22	10	product.gallery	thumb	1
275	21	10	product.gallery	file	1
603	34	59	product.gallery	thumb	1
607	36	66	product.gallery	thumb	1
608	17	7	api::product.product	thumb	1
609	54	7	api::product.product	banner	1
805	28	2	home.home-post	image	1
622	49	1	plugin::users-permissions.user	avatar	1
996	36	3	api::post.post	thumb	1
997	55	3	api::post.post	banner	1
513	50	1	api::service.service	image	1
518	46	2	service.commit	image	1
520	49	2	service.customer-reponse	avatar	1
525	41	4	service.partner	image	1
814	30	3	home.advantage	image	1
1029	58	6	introduce.attribute	image	1
1033	38	4	introduce.history	image	1
1035	72	1	introduce.mission	image	1
1038	60	1	introduce.mission	light_image	1
548	31	9	product.document	attachment	1
552	22	33	product.gallery	thumb	1
556	22	33	product.gallery	file	1
559	32	49	product.gallery	thumb	1
564	19	8	api::product.product	thumb	1
565	54	8	api::product.product	banner	1
749	57	2	introduce.attribute	image	1
\.


--
-- TOC entry 4347 (class 0 OID 19206)
-- Dependencies: 290
-- Data for Name: footers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footers (id, phone, email, address, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4349 (class 0 OID 19217)
-- Dependencies: 292
-- Data for Name: footers_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footers_localizations_links (id, footer_id, inv_footer_id, footer_order) FROM stdin;
\.


--
-- TOC entry 4331 (class 0 OID 19057)
-- Dependencies: 274
-- Data for Name: home_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_pages (id, title, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	Chăm sóc sức khoẻ cho bé	2023-11-08 23:12:50.614	2023-12-03 20:11:06.587	1	1	vi-VN
\.


--
-- TOC entry 4341 (class 0 OID 19105)
-- Dependencies: 284
-- Data for Name: home_pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_pages_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
1	1	2	home.home-post	home_posts	1
5	1	2	home.domain	categories	2
6	1	1	home.domain	categories	4
42	1	4	home.advantage	advantages	1
12	1	1	home.advantage	advantages	2
25	1	3	home.advantage	advantages	3
\.


--
-- TOC entry 4343 (class 0 OID 19119)
-- Dependencies: 286
-- Data for Name: home_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_pages_localizations_links (id, home_page_id, inv_home_page_id, home_page_order) FROM stdin;
\.


--
-- TOC entry 4293 (class 0 OID 18307)
-- Dependencies: 236
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2023-11-08 09:51:29.081	2023-11-08 09:51:29.081	\N	\N
2	Vietnamese (Vietnam) (vi-VN)	vi-VN	2023-11-08 09:59:52.606	2023-11-08 09:59:52.606	1	1
\.


--
-- TOC entry 4403 (class 0 OID 20477)
-- Dependencies: 346
-- Data for Name: introduces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.introduces (id, short_text, long_text, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	"Discover Our Passion for Creating Timeless and Innovative Designs"	Archy was founded in 1936 in Chicago, USA. The company was established by Louis Skidmore and Nathaniel Owings, and later joined by John O. Merrill.\nSOM has been responsible for the design of many notable buildings worldwide, including the Sears Tower (now known as Willis Tower) in Chicago, which was the world’s tallest building from 1973 to 1998. The company has also designed the John Hancock Center, One World Trade Center, and Burj Khalifa, which is currently the tallest building in the world.\nThroughout its history, SOM has been recognized for its innovative designs and commitment to sustainability.	2023-12-01 17:07:57.763	2023-12-07 21:19:46.153	1	1	vi-VN
\.


--
-- TOC entry 4409 (class 0 OID 20550)
-- Dependencies: 352
-- Data for Name: introduces_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.introduces_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
27	1	3	introduce.mission	missions	1
9	1	2	introduce.history	histories	2
66	1	5	introduce.attribute	attribute_list	4
10	1	4	introduce.history	histories	6
11	1	3	introduce.history	histories	8
97	1	5	introduce.history	histories	9
67	1	8	introduce.attribute	attribute_list	10
68	1	7	introduce.attribute	attribute_list	11
69	1	6	introduce.attribute	attribute_list	13
1	1	4	introduce.attribute	attributes	14
2	1	2	introduce.attribute	attributes	15
3	1	3	introduce.attribute	attributes	16
4	1	1	introduce.attribute	attributes	17
40	1	2	introduce.ads	ads	1
41	1	1	introduce.ads	ads	2
28	1	1	introduce.mission	missions	3
29	1	2	introduce.mission	missions	5
\.


--
-- TOC entry 4405 (class 0 OID 20488)
-- Dependencies: 348
-- Data for Name: introduces_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.introduces_localizations_links (id, introduce_id, inv_introduce_id, introduce_order) FROM stdin;
\.


--
-- TOC entry 4393 (class 0 OID 20177)
-- Dependencies: 336
-- Data for Name: post_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_categories (id, title, created_at, updated_at, created_by_id, updated_by_id, locale, slug) FROM stdin;
4	Cẩm nang mẹ & bé	2023-11-27 23:11:52.844	2023-11-29 21:45:26.736	1	1	vi-VN	cam-nang-me-and-bee
1	Tin tổng hợp	2023-11-27 23:11:29.301	2023-11-29 21:45:40.108	1	1	vi-VN	tin-tong-hopp
2	Tin tức chuyên ngành	2023-11-27 23:11:37.769	2023-11-29 21:45:46.263	1	1	vi-VN	tin-tuc-chuyen-nganhh
3	Tin tức sản phẩm	2023-11-27 23:11:46.716	2023-11-29 21:45:51.211	1	1	vi-VN	tin-tuc-san-phamm
5	Văn hoá doanh nghiệp	2023-11-27 23:12:01.272	2023-11-29 21:45:56.471	1	1	vi-VN	van-hoa-doanh-nghiepp
\.


--
-- TOC entry 4395 (class 0 OID 20188)
-- Dependencies: 338
-- Data for Name: post_categories_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_categories_localizations_links (id, post_category_id, inv_post_category_id, post_category_order) FROM stdin;
\.


--
-- TOC entry 4391 (class 0 OID 20138)
-- Dependencies: 334
-- Data for Name: post_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_pages (id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2023-11-28 20:45:57.41	2023-11-28 20:45:57.41	1	1
\.


--
-- TOC entry 4351 (class 0 OID 19541)
-- Dependencies: 294
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, content_html, slug) FROM stdin;
1	Những sai lầm mẹ thường hay mắc phải khi con bị sốt	Did you come here for something in particular or just general Riker-bashing	2023-11-22 09:42:35.669	2023-12-07 21:13:28.589	2023-11-22 09:42:38.301	1	1	vi-VN	<div class="raw-html-embed"><div style="width: 100%; height: 1400px; position: relative">\n    <div style="width: 1181px; height: 45px; left: 0px; top: 365px; position: absolute; background: #FDFDFD"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 275px; position: absolute; background: #DFF1F0; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="width: 1181px; height: 133px; left: 0px; top: 565px; position: absolute; background: #F2F8F7; border-radius: 8px"></div>\n    <div style="width: 72px; height: 168px; left: 0px; top: 502px; position: absolute; color: #DFF1F0; font-size: 180px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 270px; word-wrap: break-word">“</div>\n    <div style="width: 1181px; height: 93px; left: 0px; top: 0px; position: absolute; color: #666666; font-size: 15px; font-family: Segoe UI; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Could someone survive inside a transporter buffer for 75 years? Fate. It protects fools, little children, and ships.</div>\n    <div style="left: 0px; top: 1052px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum</div>\n    <div style="width: 1134px; left: 0px; top: 730px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1104px; left: 0px; top: 487px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1140px; left: 0px; top: 174px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt</div>\n    <div style="width: 1140px; height: 49px; left: 0px; top: 857px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="left: 0px; top: 927px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">1. Did you come here for something in particular or just general</div>\n    <div style="left: 0px; top: 966px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">2. Did you come here for something in particular or just general Riker-bashing</div>\n    <div style="left: 0px; top: 1005px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3. Did you come here for something in particula</div>\n    <div style="left: 0px; top: 125px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 808px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 1107px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video</div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 320px; position: absolute; background: #F2F8F7"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 410px; position: absolute; background: #F2F8F7; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="left: 123px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">First</div>\n    <div style="left: 99px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:1</div>\n    <div style="left: 99px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:1</div>\n    <div style="left: 99px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:1</div>\n    <div style="left: 384px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:2</div>\n    <div style="left: 384px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:2</div>\n    <div style="left: 384px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:2</div>\n    <div style="left: 409px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Last</div>\n    <div style="left: 667px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:3</div>\n    <div style="left: 667px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:3</div>\n    <div style="left: 667px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:3</div>\n    <div style="left: 680px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Handle</div>\n    <div style="width: 1108px; left: 32px; top: 597px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 22.50px; word-wrap: break-word">“Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf.”</div>\n    <div style="width: 1181px; height: 178px; left: 0px; top: 1211px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px"></div>\n    <div style="left: 32px; top: 1243px; position: absolute; color: #333333; font-size: 19px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 26.60px; word-wrap: break-word">Title goes here</div>\n    <div style="width: 786px; left: 32px; top: 1288px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 0px; top: 1168px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #333333; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 1</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 104px; top: 1168px; position: absolute; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 2</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 208px; top: 1168px; position: absolute; border-top-left-radius: 8px; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 3</div>\n    </div>\n    <div style="width: 180px; height: 0px; left: 285px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DFF1F0 solid"></div>\n    <div style="width: 180px; height: 0px; left: 570px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DDEDEC solid"></div>\n</div></div>	nhung-sai-lam-me-thuongg-hay-mac-phai-khi-con-bi-sot
3	Những sai lầm mẹ thường hay mắc phải khi con bị sốt	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 	2023-11-22 09:43:01.056	2023-12-07 21:14:07.522	2023-11-22 09:43:04.401	1	1	vi-VN	<div class="raw-html-embed"><div style="width: 100%; height: 1400px; position: relative">\n    <div style="width: 1181px; height: 45px; left: 0px; top: 365px; position: absolute; background: #FDFDFD"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 275px; position: absolute; background: #DFF1F0; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="width: 1181px; height: 133px; left: 0px; top: 565px; position: absolute; background: #F2F8F7; border-radius: 8px"></div>\n    <div style="width: 72px; height: 168px; left: 0px; top: 502px; position: absolute; color: #DFF1F0; font-size: 180px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 270px; word-wrap: break-word">“</div>\n    <div style="width: 1181px; height: 93px; left: 0px; top: 0px; position: absolute; color: #666666; font-size: 15px; font-family: Segoe UI; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Could someone survive inside a transporter buffer for 75 years? Fate. It protects fools, little children, and ships.</div>\n    <div style="left: 0px; top: 1052px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum</div>\n    <div style="width: 1134px; left: 0px; top: 730px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1104px; left: 0px; top: 487px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1140px; left: 0px; top: 174px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt</div>\n    <div style="width: 1140px; height: 49px; left: 0px; top: 857px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="left: 0px; top: 927px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">1. Did you come here for something in particular or just general</div>\n    <div style="left: 0px; top: 966px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">2. Did you come here for something in particular or just general Riker-bashing</div>\n    <div style="left: 0px; top: 1005px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3. Did you come here for something in particula</div>\n    <div style="left: 0px; top: 125px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 808px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 1107px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video</div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 320px; position: absolute; background: #F2F8F7"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 410px; position: absolute; background: #F2F8F7; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="left: 123px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">First</div>\n    <div style="left: 99px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:1</div>\n    <div style="left: 99px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:1</div>\n    <div style="left: 99px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:1</div>\n    <div style="left: 384px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:2</div>\n    <div style="left: 384px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:2</div>\n    <div style="left: 384px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:2</div>\n    <div style="left: 409px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Last</div>\n    <div style="left: 667px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:3</div>\n    <div style="left: 667px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:3</div>\n    <div style="left: 667px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:3</div>\n    <div style="left: 680px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Handle</div>\n    <div style="width: 1108px; left: 32px; top: 597px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 22.50px; word-wrap: break-word">“Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf.”</div>\n    <div style="width: 1181px; height: 178px; left: 0px; top: 1211px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px"></div>\n    <div style="left: 32px; top: 1243px; position: absolute; color: #333333; font-size: 19px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 26.60px; word-wrap: break-word">Title goes here</div>\n    <div style="width: 786px; left: 32px; top: 1288px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 0px; top: 1168px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #333333; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 1</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 104px; top: 1168px; position: absolute; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 2</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 208px; top: 1168px; position: absolute; border-top-left-radius: 8px; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 3</div>\n    </div>\n    <div style="width: 180px; height: 0px; left: 285px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DFF1F0 solid"></div>\n    <div style="width: 180px; height: 0px; left: 570px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DDEDEC solid"></div>\n</div></div>	nhung-sai-lam-me-thuoong-hay-mac-phai-khi-con-bi-sot
5	Yếu tố quan trọng trong chăm sóc sức khỏe trẻ em	Did you come here for something in particular or just general Riker-bashing	2023-11-28 21:03:34.738	2023-12-07 21:14:18.068	2023-11-28 21:03:39.701	1	1	vi-VN	<div class="raw-html-embed"><div style="width: 100%; height: 1400px; position: relative">\n    <div style="width: 1181px; height: 45px; left: 0px; top: 365px; position: absolute; background: #FDFDFD"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 275px; position: absolute; background: #DFF1F0; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="width: 1181px; height: 133px; left: 0px; top: 565px; position: absolute; background: #F2F8F7; border-radius: 8px"></div>\n    <div style="width: 72px; height: 168px; left: 0px; top: 502px; position: absolute; color: #DFF1F0; font-size: 180px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 270px; word-wrap: break-word">“</div>\n    <div style="width: 1181px; height: 93px; left: 0px; top: 0px; position: absolute; color: #666666; font-size: 15px; font-family: Segoe UI; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Could someone survive inside a transporter buffer for 75 years? Fate. It protects fools, little children, and ships.</div>\n    <div style="left: 0px; top: 1052px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum</div>\n    <div style="width: 1134px; left: 0px; top: 730px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1104px; left: 0px; top: 487px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1140px; left: 0px; top: 174px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt</div>\n    <div style="width: 1140px; height: 49px; left: 0px; top: 857px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="left: 0px; top: 927px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">1. Did you come here for something in particular or just general</div>\n    <div style="left: 0px; top: 966px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">2. Did you come here for something in particular or just general Riker-bashing</div>\n    <div style="left: 0px; top: 1005px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3. Did you come here for something in particula</div>\n    <div style="left: 0px; top: 125px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 808px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 1107px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video</div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 320px; position: absolute; background: #F2F8F7"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 410px; position: absolute; background: #F2F8F7; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="left: 123px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">First</div>\n    <div style="left: 99px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:1</div>\n    <div style="left: 99px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:1</div>\n    <div style="left: 99px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:1</div>\n    <div style="left: 384px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:2</div>\n    <div style="left: 384px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:2</div>\n    <div style="left: 384px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:2</div>\n    <div style="left: 409px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Last</div>\n    <div style="left: 667px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:3</div>\n    <div style="left: 667px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:3</div>\n    <div style="left: 667px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:3</div>\n    <div style="left: 680px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Handle</div>\n    <div style="width: 1108px; left: 32px; top: 597px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 22.50px; word-wrap: break-word">“Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf.”</div>\n    <div style="width: 1181px; height: 178px; left: 0px; top: 1211px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px"></div>\n    <div style="left: 32px; top: 1243px; position: absolute; color: #333333; font-size: 19px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 26.60px; word-wrap: break-word">Title goes here</div>\n    <div style="width: 786px; left: 32px; top: 1288px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 0px; top: 1168px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #333333; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 1</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 104px; top: 1168px; position: absolute; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 2</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 208px; top: 1168px; position: absolute; border-top-left-radius: 8px; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 3</div>\n    </div>\n    <div style="width: 180px; height: 0px; left: 285px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DFF1F0 solid"></div>\n    <div style="width: 180px; height: 0px; left: 570px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DDEDEC solid"></div>\n</div></div>	yeu-to-quan-trong-ttrong-cham-soc-suc-khoe-tre-em
4	Yếu tố quan trọng trong chăm sóc sức khỏe trẻ em	Did you come here for something in particular or just general Riker-bashing	2023-11-22 09:43:15.673	2023-12-07 21:14:26.525	2023-11-22 09:43:19.213	1	1	vi-VN	<div class="raw-html-embed"><div style="width: 100%; height: 1400px; position: relative">\n    <div style="width: 1181px; height: 45px; left: 0px; top: 365px; position: absolute; background: #FDFDFD"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 275px; position: absolute; background: #DFF1F0; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="width: 1181px; height: 133px; left: 0px; top: 565px; position: absolute; background: #F2F8F7; border-radius: 8px"></div>\n    <div style="width: 72px; height: 168px; left: 0px; top: 502px; position: absolute; color: #DFF1F0; font-size: 180px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 270px; word-wrap: break-word">“</div>\n    <div style="width: 1181px; height: 93px; left: 0px; top: 0px; position: absolute; color: #666666; font-size: 15px; font-family: Segoe UI; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Could someone survive inside a transporter buffer for 75 years? Fate. It protects fools, little children, and ships.</div>\n    <div style="left: 0px; top: 1052px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum</div>\n    <div style="width: 1134px; left: 0px; top: 730px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1104px; left: 0px; top: 487px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1140px; left: 0px; top: 174px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt</div>\n    <div style="width: 1140px; height: 49px; left: 0px; top: 857px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="left: 0px; top: 927px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">1. Did you come here for something in particular or just general</div>\n    <div style="left: 0px; top: 966px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">2. Did you come here for something in particular or just general Riker-bashing</div>\n    <div style="left: 0px; top: 1005px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3. Did you come here for something in particula</div>\n    <div style="left: 0px; top: 125px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 808px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 1107px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video</div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 320px; position: absolute; background: #F2F8F7"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 410px; position: absolute; background: #F2F8F7; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="left: 123px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">First</div>\n    <div style="left: 99px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:1</div>\n    <div style="left: 99px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:1</div>\n    <div style="left: 99px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:1</div>\n    <div style="left: 384px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:2</div>\n    <div style="left: 384px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:2</div>\n    <div style="left: 384px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:2</div>\n    <div style="left: 409px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Last</div>\n    <div style="left: 667px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:3</div>\n    <div style="left: 667px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:3</div>\n    <div style="left: 667px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:3</div>\n    <div style="left: 680px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Handle</div>\n    <div style="width: 1108px; left: 32px; top: 597px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 22.50px; word-wrap: break-word">“Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf.”</div>\n    <div style="width: 1181px; height: 178px; left: 0px; top: 1211px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px"></div>\n    <div style="left: 32px; top: 1243px; position: absolute; color: #333333; font-size: 19px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 26.60px; word-wrap: break-word">Title goes here</div>\n    <div style="width: 786px; left: 32px; top: 1288px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 0px; top: 1168px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #333333; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 1</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 104px; top: 1168px; position: absolute; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 2</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 208px; top: 1168px; position: absolute; border-top-left-radius: 8px; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 3</div>\n    </div>\n    <div style="width: 180px; height: 0px; left: 285px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DFF1F0 solid"></div>\n    <div style="width: 180px; height: 0px; left: 570px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DDEDEC solid"></div>\n</div></div>	yeu-to-quan-trongh-trong-cham-soc-suc-khoe-tre-em
2	Yếu tố quan trọng trong chăm sóc sức khỏe trẻ em	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 	2023-11-22 09:42:50.873	2023-12-07 21:14:34.352	2023-11-22 09:42:53.096	1	1	vi-VN	<div class="raw-html-embed"><div style="width: 100%; height: 1400px; position: relative">\n    <div style="width: 1181px; height: 45px; left: 0px; top: 365px; position: absolute; background: #FDFDFD"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 275px; position: absolute; background: #DFF1F0; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="width: 1181px; height: 133px; left: 0px; top: 565px; position: absolute; background: #F2F8F7; border-radius: 8px"></div>\n    <div style="width: 72px; height: 168px; left: 0px; top: 502px; position: absolute; color: #DFF1F0; font-size: 180px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 270px; word-wrap: break-word">“</div>\n    <div style="width: 1181px; height: 93px; left: 0px; top: 0px; position: absolute; color: #666666; font-size: 15px; font-family: Segoe UI; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Could someone survive inside a transporter buffer for 75 years? Fate. It protects fools, little children, and ships.</div>\n    <div style="left: 0px; top: 1052px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum</div>\n    <div style="width: 1134px; left: 0px; top: 730px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1104px; left: 0px; top: 487px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="width: 1140px; left: 0px; top: 174px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt</div>\n    <div style="width: 1140px; height: 49px; left: 0px; top: 857px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard.</div>\n    <div style="left: 0px; top: 927px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">1. Did you come here for something in particular or just general</div>\n    <div style="left: 0px; top: 966px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">2. Did you come here for something in particular or just general Riker-bashing</div>\n    <div style="left: 0px; top: 1005px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3. Did you come here for something in particula</div>\n    <div style="left: 0px; top: 125px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 808px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video - Here's What I Learned</div>\n    <div style="left: 0px; top: 1107px; position: absolute; color: #333333; font-size: 21px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 29.40px; word-wrap: break-word">I Created a Developer Rap Video</div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 320px; position: absolute; background: #F2F8F7"></div>\n    <div style="width: 1181px; height: 45px; left: 0px; top: 410px; position: absolute; background: #F2F8F7; border-top-left-radius: 5px; border-top-right-radius: 5px"></div>\n    <div style="left: 123px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">First</div>\n    <div style="left: 99px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:1</div>\n    <div style="left: 99px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:1</div>\n    <div style="left: 99px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:1</div>\n    <div style="left: 384px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:2</div>\n    <div style="left: 384px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:2</div>\n    <div style="left: 384px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:2</div>\n    <div style="left: 409px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Last</div>\n    <div style="left: 667px; top: 332px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:1 Cell:3</div>\n    <div style="left: 667px; top: 422px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:3 Cell:3</div>\n    <div style="left: 667px; top: 377px; position: absolute; text-align: center; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Row:2 Cell:3</div>\n    <div style="left: 680px; top: 286px; position: absolute; color: #00AAA1; font-size: 17px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 23.80px; word-wrap: break-word">Handle</div>\n    <div style="width: 1108px; left: 32px; top: 597px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-style: italic; font-weight: 400; line-height: 22.50px; word-wrap: break-word">“Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf.”</div>\n    <div style="width: 1181px; height: 178px; left: 0px; top: 1211px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px"></div>\n    <div style="left: 32px; top: 1243px; position: absolute; color: #333333; font-size: 19px; font-family: Noto Sans; font-weight: 600; text-transform: capitalize; line-height: 26.60px; word-wrap: break-word">Title goes here</div>\n    <div style="width: 786px; left: 32px; top: 1288px; position: absolute; color: #666666; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 22.50px; word-wrap: break-word">Did you come here for something in particular or just general Riker-bashing? And blowing into maximum warp speed, you appeared for an instant to be in two places at once. We have a saboteur aboard. We know you’re dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 0px; top: 1168px; position: absolute; background: #F2F8F7; border-top-left-radius: 8px; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #333333; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 1</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 104px; top: 1168px; position: absolute; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 2</div>\n    </div>\n    <div style="width: 104px; height: 43px; padding-left: 30px; padding-right: 30px; padding-top: 15px; padding-bottom: 15px; left: 208px; top: 1168px; position: absolute; border-top-left-radius: 8px; border: 1px #F2F8F7 solid; justify-content: center; align-items: center; gap: 10px; display: inline-flex">\n        <div style="color: #00AAA1; font-size: 15px; font-family: Noto Sans; font-weight: 400; line-height: 15px; word-wrap: break-word">Step 3</div>\n    </div>\n    <div style="width: 180px; height: 0px; left: 285px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DFF1F0 solid"></div>\n    <div style="width: 180px; height: 0px; left: 570px; top: 275px; position: absolute; transform: rotate(90deg); transform-origin: 0 0; border: 1px #DDEDEC solid"></div>\n</div></div>	yeu-to-quan-troong-trong-cham-soc-suc-khoe-tre-em
\.


--
-- TOC entry 4401 (class 0 OID 20406)
-- Dependencies: 344
-- Data for Name: posts_author_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_author_links (id, post_id, user_id) FROM stdin;
1	1	1
2	4	1
3	2	1
4	5	1
5	3	1
\.


--
-- TOC entry 4361 (class 0 OID 19602)
-- Dependencies: 304
-- Data for Name: posts_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_localizations_links (id, post_id, inv_post_id, post_order) FROM stdin;
\.


--
-- TOC entry 4399 (class 0 OID 20338)
-- Dependencies: 342
-- Data for Name: posts_post_category_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_post_category_links (id, post_id, post_category_id, post_order) FROM stdin;
1	1	4	1
2	4	1	1
3	5	3	1
\.


--
-- TOC entry 4417 (class 0 OID 20674)
-- Dependencies: 360
-- Data for Name: posts_posts_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_posts_links (id, post_id, inv_post_id, post_order) FROM stdin;
4	1	2	1
3	1	4	2
2	1	1	3
1	1	3	4
8	2	2	1
7	2	4	2
6	2	3	3
5	2	1	4
12	3	2	1
11	3	4	2
10	3	5	3
9	3	3	4
16	4	2	1
15	4	4	2
14	4	3	3
13	4	1	4
19	5	4	1
18	5	5	2
17	5	3	3
\.


--
-- TOC entry 4369 (class 0 OID 19865)
-- Dependencies: 312
-- Data for Name: posts_product_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_product_links (id, post_id, product_id, post_order) FROM stdin;
4	1	7	1
3	2	7	2
2	3	7	3
1	4	7	4
5	5	7	5
\.


--
-- TOC entry 4397 (class 0 OID 20305)
-- Dependencies: 340
-- Data for Name: posts_tags_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_tags_links (id, post_id, tag_id, tag_order, post_order) FROM stdin;
\.


--
-- TOC entry 4353 (class 0 OID 19552)
-- Dependencies: 296
-- Data for Name: product_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_pages (id, description, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do  	2023-11-15 17:00:27.228	2023-11-27 22:19:50.815	1	1	vi-VN
\.


--
-- TOC entry 4365 (class 0 OID 19628)
-- Dependencies: 308
-- Data for Name: product_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_pages_localizations_links (id, product_page_id, inv_product_page_id, product_page_order) FROM stdin;
\.


--
-- TOC entry 4325 (class 0 OID 18846)
-- Dependencies: 268
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, full_name, created_at, updated_at, created_by_id, updated_by_id, locale, short_name, model, manufacturer, origin, description, technical_feature, slug) FROM stdin;
3	Đèn chiếu cây	Đèn chiếu cây	2023-11-08 10:15:01.427	2023-11-20 01:09:13.767	1	1	vi-VN	Đèn chiếu cây	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	den-chieu-cay
4	Máy sưởi	Máy sưởi	2023-11-08 10:15:37.232	2023-11-20 01:11:31.015	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	may-suoi
5	Giường sưởi	Giường sưởi	2023-11-08 10:15:54.954	2023-11-21 21:01:30.443	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	giuong-suoi
6	Giường đa năng	Giường đa năng	2023-11-08 10:16:06.982	2023-11-20 01:12:40.488	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	giuong-da-nang
9	Giường sơ sinh	Giường sơ sinh	2023-11-09 21:19:34.057	2023-11-20 01:14:53.567	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	giuong-so-sinh
1	Đèn chiếu vàng da cho trẻ sơ sinh 2 mặt	Đèn chiếu vàng da cho trẻ sơ sinh 2 mặt	2023-11-08 10:12:12.808	2023-11-27 22:22:15.455	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	den-chieu-vang-da-cho-tre-so-sinh-2-mat
2	Đèn chiếu 2 mặt	Đèn chiếu 2 mặt	2023-11-08 10:14:37.003	2023-11-21 07:53:04.946	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	den-chieu-2-mat
7	Giường hồi sức	Giường hồi sức	2023-11-08 10:16:24.139	2023-11-28 21:00:21.848	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	giuong-hoi-suc
8	CPAP	CPAP	2023-11-09 21:19:06.056	2023-11-27 22:21:29.471	1	1	vi-VN	BB.PHOTOTHERAPY	BB.PT01	BB.TIME CO., LTD	Viet Nam	Đèn chiếu vàng da hai mặt xách tay  BB.TIME là loại đèn sử dụng nguồn sáng LED màu xanh của bóng LED ROYAL BLUE có bước sóng nằm trong dải từ 410 nm - 500 nm khoảng chuyên dụng dùng để điều trị vàng da cho trẻ sơ sinh. Ánh sáng LED màu xanh sử dụng công nghệ bóng LED ROYAL BLUE giúp tăng hiệu quả điều trị qua việc tia chiếu tập trung, giảm tác động phụ do lóa bóng đối với ý tá, bác sỹ điều trị. Đèn được thiết kế để có thể chiếu 2 chiều từ trên xuống và từ dưới lên dưới giúp tăng hiệu quả và giảm thời gian điều trị. Đèn cũng đươc thiết kế với một nôi sơ sinh tách biệt dễ dàng tháo, lắp tiện cho việc vệ sinh. Thiết kế đèn nhẹ, nhỏ gọn, dễ dàng thao tác và vận chuyển khiến việc điều trị vàng da cho trẻ ở tận giường không còn là khó khăn.	<p>• Sử dụng công nghệ bóng LED ROYAL BLUE giúp đèn tăng tuổi thọ sử dụng và hiệu quả điều trị;<br>• Cường độ sáng có thể điều chỉnh ở 3 bước: Cơ bản - Trung bình - Cao;<br>• Đồng hồ đo thời gian chiếu đèn;<br>• Màn hình điều khiển cảm ứng;<br>• Nôi sơ sinh kèm theo;<br>• Chiếu đồng thời 2 mặt trên và dưới;<br>• Sử dụng điện áp thấp;<br>• Hoạt động đơn giản và dễ sử dụng ngay cả với lần đầu sử dụng<br>• Nhà cung cấp chịu trách nhiệm đào tạo sử dụng và bảo trì, bảo dưỡng thiết bị tại nơi sử dụng;<br>• Nhà sản xuất chịu trách nhiệm bảo hành trong vòng 01 năm;<br>Đảm bảo khả năng cung cấp các vật tư linh kiện thay thế ≥ 5 năm. Tài liệu hướng dẫn sử dụng, bảo trì, bảo dưỡng bằng tiếng Việt.</p>	cpap
\.


--
-- TOC entry 4345 (class 0 OID 19131)
-- Dependencies: 288
-- Data for Name: products_category_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category_links (id, product_id, category_id, product_order) FROM stdin;
5	2	2	1
6	1	2	2
7	3	2	3
1	7	1	1
2	5	1	2
3	6	1	3
4	4	1	4
9	8	3	1
12	9	4	1
\.


--
-- TOC entry 4363 (class 0 OID 19614)
-- Dependencies: 306
-- Data for Name: products_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
47	9	7	product.specification	product_specifications	1
48	9	7	product.document	product_documents	2
49	9	25	product.gallery	galleries	1
50	9	26	product.gallery	galleries	2
51	9	27	product.gallery	galleries	3
52	9	28	product.gallery	galleries	4
254	1	48	product.gallery	galleries	16
183	1	41	product.gallery	guides	8
118	1	12	product.specification	product_specifications	20
2	1	1	product.document	product_documents	11
97	1	10	product.document	product_documents	15
7	1	1	product.gallery	galleries	6
8	1	4	product.gallery	galleries	10
9	1	2	product.gallery	galleries	13
181	1	42	product.gallery	guides	4
182	1	40	product.gallery	guides	5
41	5	6	product.specification	product_specifications	1
42	5	6	product.document	product_documents	3
43	5	21	product.gallery	galleries	2
44	5	22	product.gallery	galleries	4
45	5	23	product.gallery	galleries	5
17	3	2	product.specification	product_specifications	1
18	3	2	product.document	product_documents	2
19	3	5	product.gallery	galleries	1
20	3	6	product.gallery	galleries	2
21	3	7	product.gallery	galleries	3
22	3	8	product.gallery	galleries	4
46	5	24	product.gallery	galleries	6
146	5	14	product.video-guide	video_guides	1
147	5	13	product.video-guide	video_guides	2
148	5	15	product.video-guide	video_guides	3
29	4	4	product.specification	product_specifications	1
30	4	4	product.document	product_documents	2
31	4	13	product.gallery	galleries	1
32	4	14	product.gallery	galleries	2
33	4	15	product.gallery	galleries	3
34	4	16	product.gallery	galleries	4
23	2	3	product.specification	product_specifications	1
35	6	5	product.specification	product_specifications	1
36	6	5	product.document	product_documents	2
37	6	17	product.gallery	galleries	1
38	6	18	product.gallery	galleries	2
39	6	19	product.gallery	galleries	3
40	6	20	product.gallery	galleries	4
24	2	3	product.document	product_documents	3
201	1	44	product.gallery	videos	1
220	1	45	product.gallery	videos	2
25	2	9	product.gallery	galleries	2
26	2	10	product.gallery	galleries	4
27	2	11	product.gallery	galleries	5
28	2	12	product.gallery	galleries	6
112	2	7	product.video-guide	video_guides	1
113	2	6	product.video-guide	video_guides	2
114	2	5	product.video-guide	video_guides	3
221	1	46	product.gallery	videos	3
222	1	47	product.gallery	videos	4
60	8	9	product.document	product_documents	10
270	8	12	product.document	product_documents	12
61	8	33	product.gallery	galleries	1
149	5	12	product.video-guide	video_guides	4
136	7	11	product.video-guide	video_guides	23
1	1	1	product.specification	product_specifications	12
66	1	10	product.specification	product_specifications	17
117	1	11	product.specification	product_specifications	18
137	7	9	product.video-guide	video_guides	24
138	7	10	product.video-guide	video_guides	25
139	7	8	product.video-guide	video_guides	26
55	7	29	product.gallery	galleries	2
79	1	4	product.video-guide	video_guides	23
80	1	2	product.video-guide	video_guides	24
81	1	1	product.video-guide	video_guides	25
82	1	3	product.video-guide	video_guides	26
10	1	3	product.gallery	galleries	14
164	1	37	product.gallery	galleries2	3
165	1	38	product.gallery	galleries2	7
166	1	39	product.gallery	galleries2	9
180	1	43	product.gallery	guides	2
53	7	8	product.specification	product_specifications	14
286	7	15	product.specification	product_specifications	16
287	7	16	product.specification	product_specifications	18
288	7	17	product.specification	product_specifications	20
289	7	18	product.specification	product_specifications	21
54	7	8	product.document	product_documents	5
131	7	11	product.document	product_documents	12
56	7	30	product.gallery	galleries	11
57	7	31	product.gallery	galleries	13
58	7	32	product.gallery	galleries	15
296	7	59	product.gallery	galleries2	4
297	7	60	product.gallery	galleries2	8
298	7	61	product.gallery	galleries2	10
299	7	62	product.gallery	guides	1
300	7	63	product.gallery	guides	3
301	7	64	product.gallery	guides	6
302	7	65	product.gallery	guides	7
303	7	66	product.gallery	videos	1
304	7	67	product.gallery	videos	2
305	7	68	product.gallery	videos	3
306	7	69	product.gallery	videos	4
59	8	9	product.specification	product_specifications	6
267	8	13	product.specification	product_specifications	15
268	8	14	product.specification	product_specifications	16
62	8	34	product.gallery	galleries	8
63	8	35	product.gallery	galleries	11
64	8	36	product.gallery	galleries	14
275	8	49	product.gallery	galleries2	3
276	8	50	product.gallery	galleries2	7
277	8	51	product.gallery	galleries2	9
278	8	52	product.gallery	guides	2
279	8	53	product.gallery	guides	4
280	8	54	product.gallery	guides	5
281	8	55	product.gallery	videos	1
282	8	56	product.gallery	videos	2
283	8	57	product.gallery	videos	3
284	8	58	product.gallery	videos	4
\.


--
-- TOC entry 4327 (class 0 OID 18857)
-- Dependencies: 270
-- Data for Name: products_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_localizations_links (id, product_id, inv_product_id, product_order) FROM stdin;
\.


--
-- TOC entry 4371 (class 0 OID 19901)
-- Dependencies: 314
-- Data for Name: service_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pages (id, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	2023-11-26 10:54:30.333	2023-11-26 10:54:30.333	1	1	vi-VN
\.


--
-- TOC entry 4383 (class 0 OID 20049)
-- Dependencies: 326
-- Data for Name: service_pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pages_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
1	1	2	service.commit	commits	1
2	1	1	service.commit	commits	2
3	1	3	service.commit	commits	3
4	1	2	service.customer-reponse	customer_responses	1
5	1	1	service.customer-reponse	customer_responses	2
6	1	4	service.partner	partners	1
7	1	1	service.partner	partners	2
8	1	5	service.partner	partners	3
9	1	2	service.partner	partners	4
10	1	3	service.partner	partners	5
11	1	4	service.question	questions	1
12	1	2	service.question	questions	2
13	1	5	service.question	questions	3
14	1	1	service.question	questions	4
15	1	3	service.question	questions	5
16	1	6	service.question	questions	6
17	1	7	service.question	questions	7
\.


--
-- TOC entry 4373 (class 0 OID 19910)
-- Dependencies: 316
-- Data for Name: service_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pages_localizations_links (id, service_page_id, inv_service_page_id, service_page_order) FROM stdin;
\.


--
-- TOC entry 4379 (class 0 OID 20002)
-- Dependencies: 322
-- Data for Name: service_pages_services_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pages_services_links (id, service_page_id, service_id, service_order) FROM stdin;
1	1	2	2
2	1	3	1
3	1	1	0
\.


--
-- TOC entry 4375 (class 0 OID 19950)
-- Dependencies: 318
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, description, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	Bảo trì, bảo dưỡng	Following the quality of our service thus having gained trust of our many clients.	2023-11-26 10:50:02.508	2023-11-26 10:50:02.508	1	1	vi-VN
2	Kiểm tra, sửa chữa	Following the quality of our service thus having gained trust of our many clients.	2023-11-26 10:50:32.183	2023-11-26 10:50:32.183	1	1	vi-VN
3	Linh kiện thay thế	Following the quality of our service thus having gained trust of our many clients.	2023-11-26 10:50:49.175	2023-11-26 10:50:49.175	1	1	vi-VN
\.


--
-- TOC entry 4377 (class 0 OID 19961)
-- Dependencies: 320
-- Data for Name: services_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_localizations_links (id, service_id, inv_service_id, service_order) FROM stdin;
\.


--
-- TOC entry 4283 (class 0 OID 18246)
-- Dependencies: 226
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4305 (class 0 OID 18374)
-- Dependencies: 248
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- TOC entry 4281 (class 0 OID 18235)
-- Dependencies: 224
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4271 (class 0 OID 18184)
-- Dependencies: 214
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::admin::transfer-token	{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}	object	\N	\N
57	plugin_content_manager_configuration_components::service.customer-reponse	{"uid":"service.customer-reponse","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"avatar":{"edit":{"label":"avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"avatar","searchable":false,"sortable":false}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"company":{"edit":{"label":"company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"company","searchable":true,"sortable":true}},"comment":{"edit":{"label":"comment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"comment","searchable":true,"sortable":true}}},"layouts":{"list":["id","avatar","name","company"],"edit":[[{"name":"avatar","size":6},{"name":"name","size":6}],[{"name":"company","size":6},{"name":"comment","size":6}]]},"isComponent":true}	object	\N	\N
66	plugin_content_manager_configuration_components::introduce.ads	{"uid":"introduce.ads","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"images":{"edit":{"label":"images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"images","searchable":false,"sortable":false}},"button":{"edit":{"label":"button","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"button","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"items","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","images"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"images","size":6},{"name":"button","size":6}],[{"name":"items","size":6}]]},"isComponent":true}	object	\N	\N
15	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
16	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
19	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}	object	\N	\N
20	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
21	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
18	plugin_i18n_default_locale	"vi-VN"	string	\N	\N
58	plugin_content_manager_configuration_components::service.partner	{"uid":"service.partner","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","image"],"edit":[[{"name":"image","size":6}]]},"isComponent":true}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"avatar":{"edit":{"label":"avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"avatar","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}],[{"name":"avatar","size":6}]]}}	object	\N	\N
49	plugin_content_manager_configuration_content_types::api::tag.tag	{"uid":"api::tag.tag","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"posts":{"edit":{"label":"posts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"posts","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","createdAt","updatedAt"],"edit":[[{"name":"title","size":6},{"name":"posts","size":6}]]}}	object	\N	\N
17	plugin_upload_metrics	{"weeklySchedule":"3 58 4 * * 4","lastWeeklyUpdate":1704344283060}	object	\N	\N
48	plugin_content_manager_configuration_content_types::api::post.post	{"uid":"api::post.post","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"thumb":{"edit":{"label":"thumb","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"thumb","searchable":false,"sortable":false}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"product":{"edit":{"label":"product","description":"","placeholder":"","visible":true,"editable":true,"mainField":"short_name"},"list":{"label":"product","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"author","searchable":true,"sortable":true}},"tags":{"edit":{"label":"tags","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"tags","searchable":false,"sortable":false}},"post_category":{"edit":{"label":"post_category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"post_category","searchable":true,"sortable":true}},"content_html":{"edit":{"label":"content_html","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content_html","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"posts":{"edit":{"label":"posts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"posts","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"thumb","size":6},{"name":"product","size":6}],[{"name":"description","size":6},{"name":"tags","size":6}],[{"name":"banner","size":6},{"name":"post_category","size":6}],[{"name":"author","size":6}],[{"name":"content_html","size":12}],[{"name":"posts","size":6}]],"list":["title","slug"]}}	object	\N	\N
22	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
59	plugin_content_manager_configuration_components::service.question	{"uid":"service.question","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"question","defaultSortBy":"question","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"question":{"edit":{"label":"question","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"question","searchable":true,"sortable":true}},"answer":{"edit":{"label":"answer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"answer","searchable":true,"sortable":true}}},"layouts":{"list":["id","question","answer"],"edit":[[{"name":"question","size":6},{"name":"answer","size":6}]]},"isComponent":true}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"avatar":{"allowedTypes":["images"],"type":"media","multiple":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"avatar":{"allowedTypes":["images"],"type":"media","multiple":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"icon":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"category"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::category.category"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"icon":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"category"}},"kind":"collectionType"},"modelType":"contentType","modelName":"category","connection":"default","uid":"api::category.category","apiName":"category","globalId":"Category","actions":{},"lifecycles":{}},"api::contact.contact":{"kind":"singleType","collectionName":"contacts","info":{"singularName":"contact","pluralName":"contacts","displayName":"ContactPage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"email":{"pluginOptions":{"i18n":{"localized":true}},"type":"email"},"phone_number":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":false}},"type":"text","required":true},"twiter_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"fb_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"insta_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"pinterest_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::contact.contact"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"contacts","info":{"singularName":"contact","pluralName":"contacts","displayName":"ContactPage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"email":{"pluginOptions":{"i18n":{"localized":true}},"type":"email"},"phone_number":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":false}},"type":"text","required":true},"twiter_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"fb_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"insta_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"pinterest_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"contact","connection":"default","uid":"api::contact.contact","apiName":"contact","globalId":"Contact","actions":{},"lifecycles":{}},"api::footer.footer":{"kind":"singleType","collectionName":"footers","info":{"singularName":"footer","pluralName":"footers","displayName":"Footer"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"phone":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"email":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":false}},"type":"text","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::footer.footer"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"footers","info":{"singularName":"footer","pluralName":"footers","displayName":"Footer"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"phone":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"email":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":false}},"type":"text","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"footer","connection":"default","uid":"api::footer.footer","apiName":"footer","globalId":"Footer","actions":{},"lifecycles":{}},"api::home-page.home-page":{"kind":"singleType","collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"HomePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"categories":{"displayName":"Domain","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"home.domain"},"advantages":{"displayName":"Advantage","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"home.advantage"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::home-page.home-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"HomePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"categories":{"displayName":"Domain","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"home.domain"},"advantages":{"displayName":"Advantage","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"home.advantage"}},"kind":"singleType"},"modelType":"contentType","modelName":"home-page","connection":"default","uid":"api::home-page.home-page","apiName":"home-page","globalId":"HomePage","actions":{},"lifecycles":{}},"api::introduce.introduce":{"kind":"singleType","collectionName":"introduces","info":{"singularName":"introduce","pluralName":"introduces","displayName":"IntroducePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"banners":{"type":"media","multiple":true,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"short_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"long_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"attribute_list":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"introduce.attribute","required":true},"histories":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.history","required":true},"missions":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.mission","required":true},"ads":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.ads","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"bg":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::introduce.introduce"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"introduces","info":{"singularName":"introduce","pluralName":"introduces","displayName":"IntroducePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"banners":{"type":"media","multiple":true,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"short_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"long_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"attribute_list":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"introduce.attribute","required":true},"histories":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.history","required":true},"missions":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.mission","required":true},"ads":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"introduce.ads","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"bg":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"introduce","connection":"default","uid":"api::introduce.introduce","apiName":"introduce","globalId":"Introduce","actions":{},"lifecycles":{}},"api::post.post":{"kind":"collectionType","collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"thumb":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"product":{"type":"relation","relation":"manyToOne","target":"api::product.product","inversedBy":"posts"},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"author":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"tags":{"type":"relation","relation":"manyToMany","target":"api::tag.tag","inversedBy":"posts"},"post_category":{"type":"relation","relation":"manyToOne","target":"api::post-category.post-category","inversedBy":"posts"},"content_html":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"rich"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"title","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::post.post"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"thumb":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"product":{"type":"relation","relation":"manyToOne","target":"api::product.product","inversedBy":"posts"},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"author":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"tags":{"type":"relation","relation":"manyToMany","target":"api::tag.tag","inversedBy":"posts"},"post_category":{"type":"relation","relation":"manyToOne","target":"api::post-category.post-category","inversedBy":"posts"},"content_html":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"rich"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"title","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post"}},"kind":"collectionType"},"modelType":"contentType","modelName":"post","connection":"default","uid":"api::post.post","apiName":"post","globalId":"Post","actions":{},"lifecycles":{}},"api::post-category.post-category":{"kind":"collectionType","collectionName":"post_categories","info":{"singularName":"post-category","pluralName":"post-categories","displayName":"PostCategory","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"post_category"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"title","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::post-category.post-category"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"post_categories","info":{"singularName":"post-category","pluralName":"post-categories","displayName":"PostCategory","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"post_category"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"title","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"post-category","connection":"default","uid":"api::post-category.post-category","apiName":"post-category","globalId":"PostCategory","actions":{},"lifecycles":{}},"api::post-page.post-page":{"kind":"singleType","collectionName":"post_pages","info":{"singularName":"post-page","pluralName":"post-pages","displayName":"PostPage"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"post_pages","info":{"singularName":"post-page","pluralName":"post-pages","displayName":"PostPage"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"post-page","connection":"default","uid":"api::post-page.post-page","apiName":"post-page","globalId":"PostPage","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"short_name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"full_name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"thumb":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"products"},"model":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"manufacturer":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"origin":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"technical_feature":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"standard"},"required":true,"customField":"plugin::ckeditor.CKEditor"},"product_specifications":{"displayName":"Specification","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.specification","required":true},"product_documents":{"displayName":"Document","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.document","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"name","required":true},"galleries":{"displayName":"Gallery","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.gallery"},"galleries2":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.gallery","required":true},"guides":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"product.gallery","required":true},"videos":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"product.gallery","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"product"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::product.product"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"short_name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"full_name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"thumb":{"type":"media","multiple":false,"required":true,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"products"},"model":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"manufacturer":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"origin":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"technical_feature":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"standard"},"required":true,"customField":"plugin::ckeditor.CKEditor"},"product_specifications":{"displayName":"Specification","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.specification","required":true},"product_documents":{"displayName":"Document","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.document","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"uid","targetField":"name","required":true},"galleries":{"displayName":"Gallery","type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.gallery"},"galleries2":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"product.gallery","required":true},"guides":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"product.gallery","required":true},"videos":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"product.gallery","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"product"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"api::product.product","apiName":"product","globalId":"Product","actions":{},"lifecycles":{}},"api::product-page.product-page":{"kind":"singleType","collectionName":"product_pages","info":{"singularName":"product-page","pluralName":"product-pages","displayName":"ProductPage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::product-page.product-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"product_pages","info":{"singularName":"product-page","pluralName":"product-pages","displayName":"ProductPage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"product-page","connection":"default","uid":"api::product-page.product-page","apiName":"product-page","globalId":"ProductPage","actions":{},"lifecycles":{}},"api::service.service":{"kind":"collectionType","collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::service.service"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}},"required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"service","connection":"default","uid":"api::service.service","apiName":"service","globalId":"Service","actions":{},"lifecycles":{}},"api::service-page.service-page":{"kind":"singleType","collectionName":"service_pages","info":{"singularName":"service-page","pluralName":"service-pages","displayName":"ServicePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"services":{"type":"relation","relation":"oneToMany","target":"api::service.service"},"commits":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.commit","required":true},"customer_responses":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.customer-reponse","required":true},"partners":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"service.partner","required":true},"questions":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.question","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::service-page.service-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"service_pages","info":{"singularName":"service-page","pluralName":"service-pages","displayName":"ServicePage","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"services":{"type":"relation","relation":"oneToMany","target":"api::service.service"},"commits":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.commit","required":true},"customer_responses":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.customer-reponse","required":true},"partners":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":false}},"component":"service.partner","required":true},"questions":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"service.question","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"service-page","connection":"default","uid":"api::service-page.service-page","apiName":"service-page","globalId":"ServicePage","actions":{},"lifecycles":{}},"api::tag.tag":{"kind":"collectionType","collectionName":"tags","info":{"singularName":"tag","pluralName":"tags","displayName":"Tag"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"posts":{"type":"relation","relation":"manyToMany","target":"api::post.post","mappedBy":"tags"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"tags","info":{"singularName":"tag","pluralName":"tags","displayName":"Tag"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"posts":{"type":"relation","relation":"manyToMany","target":"api::post.post","mappedBy":"tags"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tag","connection":"default","uid":"api::tag.tag","apiName":"tag","globalId":"Tag","actions":{},"lifecycles":{}}}	object	\N	\N
26	plugin_content_manager_configuration_components::shared.seo	{"uid":"shared.seo","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"metaSocial":{"edit":{"label":"metaSocial","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaSocial","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}},"metaViewport":{"edit":{"label":"metaViewport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaViewport","searchable":true,"sortable":true}},"canonicalURL":{"edit":{"label":"canonicalURL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalURL","searchable":true,"sortable":true}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6}],[{"name":"metaSocial","size":12}],[{"name":"keywords","size":6},{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}],[{"name":"metaViewport","size":6},{"name":"canonicalURL","size":6}]]},"isComponent":true}	object	\N	\N
67	plugin_content_manager_configuration_content_types::api::contact.contact	{"uid":"api::contact.contact","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"phone_number","defaultSortBy":"phone_number","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"phone_number":{"edit":{"label":"phone_number","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone_number","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"twiter_link":{"edit":{"label":"twiter_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"twiter_link","searchable":true,"sortable":true}},"fb_link":{"edit":{"label":"fb_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fb_link","searchable":true,"sortable":true}},"insta_link":{"edit":{"label":"insta_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"insta_link","searchable":true,"sortable":true}},"pinterest_link":{"edit":{"label":"pinterest_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pinterest_link","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","email","phone_number"],"edit":[[{"name":"title","size":6},{"name":"email","size":6}],[{"name":"phone_number","size":6},{"name":"address","size":6}],[{"name":"twiter_link","size":6},{"name":"fb_link","size":6}],[{"name":"insta_link","size":6},{"name":"pinterest_link","size":6}],[{"name":"banner","size":6}]]}}	object	\N	\N
25	plugin_content_manager_configuration_components::shared.meta-social	{"uid":"shared.meta-social","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"isComponent":true}	object	\N	\N
61	plugin_content_manager_configuration_content_types::api::post-category.post-category	{"uid":"api::post-category.post-category","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"posts":{"edit":{"label":"posts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"posts","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","createdAt","updatedAt"],"edit":[[{"name":"title","size":6},{"name":"posts","size":6}],[{"name":"slug","size":6}]]}}	object	\N	\N
55	plugin_content_manager_configuration_content_types::api::service.service	{"uid":"api::service.service","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","image","description"],"edit":[[{"name":"title","size":6},{"name":"image","size":6}],[{"name":"description","size":6}]]}}	object	\N	\N
45	plugin_content_manager_configuration_components::product.specification	{"uid":"product.specification","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}]]},"isComponent":true}	object	\N	\N
56	plugin_content_manager_configuration_components::service.commit	{"uid":"service.commit","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","image"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"image","size":6}]]},"isComponent":true}	object	\N	\N
34	plugin_content_manager_configuration_components::home.domain	{"uid":"home.domain","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","icon"],"edit":[[{"name":"title","size":6},{"name":"icon","size":6}]]},"isComponent":true}	object	\N	\N
60	plugin_content_manager_configuration_content_types::api::post-page.post-page	{"uid":"api::post-page.post-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","banner","createdAt","updatedAt"],"edit":[[{"name":"banner","size":6}]]}}	object	\N	\N
36	plugin_content_manager_configuration_content_types::api::home-page.home-page	{"uid":"api::home-page.home-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"categories":{"edit":{"label":"categories","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"categories","searchable":false,"sortable":false}},"advantages":{"edit":{"label":"advantages","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"advantages","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","banner"],"edit":[[{"name":"title","size":6},{"name":"banner","size":6}],[{"name":"categories","size":12}],[{"name":"advantages","size":12}]]}}	object	\N	\N
35	plugin_content_manager_configuration_components::home.home-post	{"uid":"home.home-post","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"subject","defaultSortBy":"subject","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","subject","title","description"],"edit":[[{"name":"subject","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"isComponent":true}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::category.category	{"uid":"api::category.category","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"short_name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icon","products"],"edit":[[{"name":"title","size":6},{"name":"icon","size":6}],[{"name":"products","size":6}]]}}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::footer.footer	{"uid":"api::footer.footer","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"phone","defaultSortBy":"phone","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","phone","email","address"],"edit":[[{"name":"phone","size":6},{"name":"email","size":6}],[{"name":"address","size":6}]]}}	object	\N	\N
46	plugin_content_manager_configuration_components::product.document	{"uid":"product.document","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"attachment":{"edit":{"label":"attachment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"attachment","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","attachment"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"attachment","size":6}]]},"isComponent":true}	object	\N	\N
28	plugin_content_manager_configuration_content_types::api::product.product	{"uid":"api::product.product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"short_name":{"edit":{"label":"short_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"short_name","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"full_name":{"edit":{"label":"full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"full_name","searchable":true,"sortable":true}},"thumb":{"edit":{"label":"thumb","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"thumb","searchable":false,"sortable":false}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"category","searchable":true,"sortable":true}},"model":{"edit":{"label":"model","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"model","searchable":true,"sortable":true}},"manufacturer":{"edit":{"label":"manufacturer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"manufacturer","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"technical_feature":{"edit":{"label":"technical_feature","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"technical_feature","searchable":false,"sortable":false}},"product_specifications":{"edit":{"label":"product_specifications","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"product_specifications","searchable":false,"sortable":false}},"product_documents":{"edit":{"label":"product_documents","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"product_documents","searchable":false,"sortable":false}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"galleries":{"edit":{"label":"galleries","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"galleries","searchable":false,"sortable":false}},"galleries2":{"edit":{"label":"galleries2","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"galleries2","searchable":false,"sortable":false}},"guides":{"edit":{"label":"guides","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"guides","searchable":false,"sortable":false}},"videos":{"edit":{"label":"videos","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"videos","searchable":false,"sortable":false}},"posts":{"edit":{"label":"posts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"posts","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","full_name","short_name"],"edit":[[{"name":"banner","size":6},{"name":"category","size":6}],[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"full_name","size":6},{"name":"short_name","size":6}],[{"name":"thumb","size":6},{"name":"model","size":6}],[{"name":"manufacturer","size":6},{"name":"origin","size":6}],[{"name":"galleries","size":12}],[{"name":"description","size":12}],[{"name":"technical_feature","size":12}],[{"name":"product_specifications","size":12}],[{"name":"product_documents","size":12}],[{"name":"guides","size":12}],[{"name":"galleries2","size":12}],[{"name":"videos","size":12}],[{"name":"posts","size":6}]]}}	object	\N	\N
47	plugin_content_manager_configuration_content_types::api::product-page.product-page	{"uid":"api::product-page.product-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","description","banner","createdAt"],"edit":[[{"name":"description","size":6},{"name":"banner","size":6}]]}}	object	\N	\N
54	plugin_content_manager_configuration_content_types::api::service-page.service-page	{"uid":"api::service-page.service-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"services":{"edit":{"label":"services","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"services","searchable":false,"sortable":false}},"commits":{"edit":{"label":"commits","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"commits","searchable":false,"sortable":false}},"customer_responses":{"edit":{"label":"customer_responses","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_responses","searchable":false,"sortable":false}},"partners":{"edit":{"label":"partners","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"partners","searchable":false,"sortable":false}},"questions":{"edit":{"label":"questions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"questions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","banner","createdAt","updatedAt"],"edit":[[{"name":"banner","size":6},{"name":"services","size":6}],[{"name":"commits","size":12}],[{"name":"customer_responses","size":12}],[{"name":"partners","size":12}],[{"name":"questions","size":12}]]}}	object	\N	\N
52	plugin_content_manager_configuration_components::product.gallery	{"uid":"product.gallery","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"thumb":{"edit":{"label":"thumb","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"thumb","searchable":false,"sortable":false}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}}},"layouts":{"list":["id","thumb","file","title"],"edit":[[{"name":"thumb","size":6},{"name":"file","size":6}],[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"link","size":6}]]},"isComponent":true}	object	\N	\N
64	plugin_content_manager_configuration_components::introduce.history	{"uid":"introduce.history","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","image","description"],"edit":[[{"name":"title","size":6},{"name":"image","size":6}],[{"name":"description","size":6},{"name":"year","size":6}]]},"isComponent":true}	object	\N	\N
33	plugin_content_manager_configuration_components::home.advantage	{"uid":"home.advantage","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","image"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"image","size":6},{"name":"subject","size":6}]]},"isComponent":true}	object	\N	\N
62	plugin_content_manager_configuration_content_types::api::introduce.introduce	{"uid":"api::introduce.introduce","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"banners":{"edit":{"label":"banners","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banners","searchable":false,"sortable":false}},"short_text":{"edit":{"label":"short_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"short_text","searchable":true,"sortable":true}},"long_text":{"edit":{"label":"long_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"long_text","searchable":true,"sortable":true}},"attribute_list":{"edit":{"label":"attribute_list","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"attribute_list","searchable":false,"sortable":false}},"histories":{"edit":{"label":"histories","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"histories","searchable":false,"sortable":false}},"missions":{"edit":{"label":"missions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"missions","searchable":false,"sortable":false}},"ads":{"edit":{"label":"ads","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ads","searchable":false,"sortable":false}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"bg":{"edit":{"label":"bg","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bg","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","banners","short_text","long_text"],"edit":[[{"name":"banners","size":6},{"name":"short_text","size":6}],[{"name":"long_text","size":6}],[{"name":"histories","size":12}],[{"name":"missions","size":12}],[{"name":"ads","size":12}],[{"name":"banner","size":6}],[{"name":"attribute_list","size":12}],[{"name":"bg","size":6}]]}}	object	\N	\N
65	plugin_content_manager_configuration_components::introduce.mission	{"uid":"introduce.mission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"light_image":{"edit":{"label":"light_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"light_image","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","image"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"image","size":6},{"name":"light_image","size":6}]]},"isComponent":true}	object	\N	\N
63	plugin_content_manager_configuration_components::introduce.attribute	{"uid":"introduce.attribute","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"count":{"edit":{"label":"count","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"count","searchable":true,"sortable":true}},"unit":{"edit":{"label":"unit","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"unit","searchable":true,"sortable":true}},"character":{"edit":{"label":"character","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"character","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","image","count"],"edit":[[{"name":"title","size":6},{"name":"image","size":6}],[{"name":"count","size":4},{"name":"unit","size":6}],[{"name":"character","size":6}]]},"isComponent":true}	object	\N	\N
\.


--
-- TOC entry 4269 (class 0 OID 18175)
-- Dependencies: 212
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
70	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories","indexes":[{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"contacts","indexes":[{"name":"contacts_created_by_id_fk","columns":["created_by_id"]},{"name":"contacts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"contacts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"contacts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone_number","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"twiter_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"fb_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"insta_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"pinterest_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"footers","indexes":[{"name":"footers_created_by_id_fk","columns":["created_by_id"]},{"name":"footers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"footers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"footers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"home_pages","indexes":[{"name":"home_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"home_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"introduces","indexes":[{"name":"introduces_created_by_id_fk","columns":["created_by_id"]},{"name":"introduces_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"introduces_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"introduces_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"short_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"long_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"posts","indexes":[{"type":"unique","name":"posts_slug_unique","columns":["slug"]},{"name":"posts_created_by_id_fk","columns":["created_by_id"]},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"posts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_html","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"post_categories","indexes":[{"type":"unique","name":"post_categories_slug_unique","columns":["slug"]},{"name":"post_categories_created_by_id_fk","columns":["created_by_id"]},{"name":"post_categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"post_categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"post_categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"post_pages","indexes":[{"name":"post_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"post_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"post_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"post_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products","indexes":[{"type":"unique","name":"products_slug_unique","columns":["slug"]},{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"short_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"model","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"manufacturer","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"technical_feature","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"product_pages","indexes":[{"name":"product_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"product_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"product_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"product_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"services","indexes":[{"name":"services_created_by_id_fk","columns":["created_by_id"]},{"name":"services_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"services_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"services_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"service_pages","indexes":[{"name":"service_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"service_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"service_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"service_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"tags","indexes":[{"name":"tags_created_by_id_fk","columns":["created_by_id"]},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tags_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_home_advantages","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_home_domains","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_home_home_posts","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_introduce_ads","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"button","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"items","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_introduce_attributes","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"unit","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"character","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_introduce_histories","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_introduce_missions","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_product_documents","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_product_galleries","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_product_specifications","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_service_commits","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_service_customer_reponses","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"comment","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_service_partners","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_service_questions","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"question","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"answer","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_viewport","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories_localizations_links","indexes":[{"name":"categories_localizations_links_fk","columns":["category_id"]},{"name":"categories_localizations_links_inv_fk","columns":["inv_category_id"]},{"name":"categories_localizations_links_unique","columns":["category_id","inv_category_id"],"type":"unique"},{"name":"categories_localizations_links_order_fk","columns":["category_order"]}],"foreignKeys":[{"name":"categories_localizations_links_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"},{"name":"categories_localizations_links_inv_fk","columns":["inv_category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"contacts_localizations_links","indexes":[{"name":"contacts_localizations_links_fk","columns":["contact_id"]},{"name":"contacts_localizations_links_inv_fk","columns":["inv_contact_id"]},{"name":"contacts_localizations_links_unique","columns":["contact_id","inv_contact_id"],"type":"unique"},{"name":"contacts_localizations_links_order_fk","columns":["contact_order"]}],"foreignKeys":[{"name":"contacts_localizations_links_fk","columns":["contact_id"],"referencedColumns":["id"],"referencedTable":"contacts","onDelete":"CASCADE"},{"name":"contacts_localizations_links_inv_fk","columns":["inv_contact_id"],"referencedColumns":["id"],"referencedTable":"contacts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"contact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_contact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"contact_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"footers_localizations_links","indexes":[{"name":"footers_localizations_links_fk","columns":["footer_id"]},{"name":"footers_localizations_links_inv_fk","columns":["inv_footer_id"]},{"name":"footers_localizations_links_unique","columns":["footer_id","inv_footer_id"],"type":"unique"},{"name":"footers_localizations_links_order_fk","columns":["footer_order"]}],"foreignKeys":[{"name":"footers_localizations_links_fk","columns":["footer_id"],"referencedColumns":["id"],"referencedTable":"footers","onDelete":"CASCADE"},{"name":"footers_localizations_links_inv_fk","columns":["inv_footer_id"],"referencedColumns":["id"],"referencedTable":"footers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"footer_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_footer_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"footer_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_pages_components","indexes":[{"name":"home_pages_field_index","columns":["field"]},{"name":"home_pages_component_type_index","columns":["component_type"]},{"name":"home_pages_entity_fk","columns":["entity_id"]},{"name":"home_pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"home_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"home_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_pages_localizations_links","indexes":[{"name":"home_pages_localizations_links_fk","columns":["home_page_id"]},{"name":"home_pages_localizations_links_inv_fk","columns":["inv_home_page_id"]},{"name":"home_pages_localizations_links_unique","columns":["home_page_id","inv_home_page_id"],"type":"unique"},{"name":"home_pages_localizations_links_order_fk","columns":["home_page_order"]}],"foreignKeys":[{"name":"home_pages_localizations_links_fk","columns":["home_page_id"],"referencedColumns":["id"],"referencedTable":"home_pages","onDelete":"CASCADE"},{"name":"home_pages_localizations_links_inv_fk","columns":["inv_home_page_id"],"referencedColumns":["id"],"referencedTable":"home_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"home_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_home_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"home_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"introduces_components","indexes":[{"name":"introduces_field_index","columns":["field"]},{"name":"introduces_component_type_index","columns":["component_type"]},{"name":"introduces_entity_fk","columns":["entity_id"]},{"name":"introduces_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"introduces_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"introduces","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"introduces_localizations_links","indexes":[{"name":"introduces_localizations_links_fk","columns":["introduce_id"]},{"name":"introduces_localizations_links_inv_fk","columns":["inv_introduce_id"]},{"name":"introduces_localizations_links_unique","columns":["introduce_id","inv_introduce_id"],"type":"unique"},{"name":"introduces_localizations_links_order_fk","columns":["introduce_order"]}],"foreignKeys":[{"name":"introduces_localizations_links_fk","columns":["introduce_id"],"referencedColumns":["id"],"referencedTable":"introduces","onDelete":"CASCADE"},{"name":"introduces_localizations_links_inv_fk","columns":["inv_introduce_id"],"referencedColumns":["id"],"referencedTable":"introduces","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"introduce_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_introduce_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"introduce_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_product_links","indexes":[{"name":"posts_product_links_fk","columns":["post_id"]},{"name":"posts_product_links_inv_fk","columns":["product_id"]},{"name":"posts_product_links_unique","columns":["post_id","product_id"],"type":"unique"},{"name":"posts_product_links_order_inv_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_product_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_product_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_author_links","indexes":[{"name":"posts_author_links_fk","columns":["post_id"]},{"name":"posts_author_links_inv_fk","columns":["user_id"]},{"name":"posts_author_links_unique","columns":["post_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"posts_author_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_author_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_tags_links","indexes":[{"name":"posts_tags_links_fk","columns":["post_id"]},{"name":"posts_tags_links_inv_fk","columns":["tag_id"]},{"name":"posts_tags_links_unique","columns":["post_id","tag_id"],"type":"unique"},{"name":"posts_tags_links_order_fk","columns":["tag_order"]},{"name":"posts_tags_links_order_inv_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_tags_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_tags_links_inv_fk","columns":["tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_post_category_links","indexes":[{"name":"posts_post_category_links_fk","columns":["post_id"]},{"name":"posts_post_category_links_inv_fk","columns":["post_category_id"]},{"name":"posts_post_category_links_unique","columns":["post_id","post_category_id"],"type":"unique"},{"name":"posts_post_category_links_order_inv_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_post_category_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_post_category_links_inv_fk","columns":["post_category_id"],"referencedColumns":["id"],"referencedTable":"post_categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_posts_links","indexes":[{"name":"posts_posts_links_fk","columns":["post_id"]},{"name":"posts_posts_links_inv_fk","columns":["inv_post_id"]},{"name":"posts_posts_links_unique","columns":["post_id","inv_post_id"],"type":"unique"},{"name":"posts_posts_links_order_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_posts_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_posts_links_inv_fk","columns":["inv_post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_localizations_links","indexes":[{"name":"posts_localizations_links_fk","columns":["post_id"]},{"name":"posts_localizations_links_inv_fk","columns":["inv_post_id"]},{"name":"posts_localizations_links_unique","columns":["post_id","inv_post_id"],"type":"unique"},{"name":"posts_localizations_links_order_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_localizations_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_localizations_links_inv_fk","columns":["inv_post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"post_categories_localizations_links","indexes":[{"name":"post_categories_localizations_links_fk","columns":["post_category_id"]},{"name":"post_categories_localizations_links_inv_fk","columns":["inv_post_category_id"]},{"name":"post_categories_localizations_links_unique","columns":["post_category_id","inv_post_category_id"],"type":"unique"},{"name":"post_categories_localizations_links_order_fk","columns":["post_category_order"]}],"foreignKeys":[{"name":"post_categories_localizations_links_fk","columns":["post_category_id"],"referencedColumns":["id"],"referencedTable":"post_categories","onDelete":"CASCADE"},{"name":"post_categories_localizations_links_inv_fk","columns":["inv_post_category_id"],"referencedColumns":["id"],"referencedTable":"post_categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_post_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_components","indexes":[{"name":"products_field_index","columns":["field"]},{"name":"products_component_type_index","columns":["component_type"]},{"name":"products_entity_fk","columns":["entity_id"]},{"name":"products_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"products_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_category_links","indexes":[{"name":"products_category_links_fk","columns":["product_id"]},{"name":"products_category_links_inv_fk","columns":["category_id"]},{"name":"products_category_links_unique","columns":["product_id","category_id"],"type":"unique"},{"name":"products_category_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_category_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_category_links_inv_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_localizations_links","indexes":[{"name":"products_localizations_links_fk","columns":["product_id"]},{"name":"products_localizations_links_inv_fk","columns":["inv_product_id"]},{"name":"products_localizations_links_unique","columns":["product_id","inv_product_id"],"type":"unique"},{"name":"products_localizations_links_order_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_localizations_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_localizations_links_inv_fk","columns":["inv_product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"product_pages_localizations_links","indexes":[{"name":"product_pages_localizations_links_fk","columns":["product_page_id"]},{"name":"product_pages_localizations_links_inv_fk","columns":["inv_product_page_id"]},{"name":"product_pages_localizations_links_unique","columns":["product_page_id","inv_product_page_id"],"type":"unique"},{"name":"product_pages_localizations_links_order_fk","columns":["product_page_order"]}],"foreignKeys":[{"name":"product_pages_localizations_links_fk","columns":["product_page_id"],"referencedColumns":["id"],"referencedTable":"product_pages","onDelete":"CASCADE"},{"name":"product_pages_localizations_links_inv_fk","columns":["inv_product_page_id"],"referencedColumns":["id"],"referencedTable":"product_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_product_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"services_localizations_links","indexes":[{"name":"services_localizations_links_fk","columns":["service_id"]},{"name":"services_localizations_links_inv_fk","columns":["inv_service_id"]},{"name":"services_localizations_links_unique","columns":["service_id","inv_service_id"],"type":"unique"},{"name":"services_localizations_links_order_fk","columns":["service_order"]}],"foreignKeys":[{"name":"services_localizations_links_fk","columns":["service_id"],"referencedColumns":["id"],"referencedTable":"services","onDelete":"CASCADE"},{"name":"services_localizations_links_inv_fk","columns":["inv_service_id"],"referencedColumns":["id"],"referencedTable":"services","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"service_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_service_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"service_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"service_pages_components","indexes":[{"name":"service_pages_field_index","columns":["field"]},{"name":"service_pages_component_type_index","columns":["component_type"]},{"name":"service_pages_entity_fk","columns":["entity_id"]},{"name":"service_pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"service_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"service_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"service_pages_services_links","indexes":[{"name":"service_pages_services_links_fk","columns":["service_page_id"]},{"name":"service_pages_services_links_inv_fk","columns":["service_id"]},{"name":"service_pages_services_links_unique","columns":["service_page_id","service_id"],"type":"unique"},{"name":"service_pages_services_links_order_fk","columns":["service_order"]}],"foreignKeys":[{"name":"service_pages_services_links_fk","columns":["service_page_id"],"referencedColumns":["id"],"referencedTable":"service_pages","onDelete":"CASCADE"},{"name":"service_pages_services_links_inv_fk","columns":["service_id"],"referencedColumns":["id"],"referencedTable":"services","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"service_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"service_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"service_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"service_pages_localizations_links","indexes":[{"name":"service_pages_localizations_links_fk","columns":["service_page_id"]},{"name":"service_pages_localizations_links_inv_fk","columns":["inv_service_page_id"]},{"name":"service_pages_localizations_links_unique","columns":["service_page_id","inv_service_page_id"],"type":"unique"},{"name":"service_pages_localizations_links_order_fk","columns":["service_page_order"]}],"foreignKeys":[{"name":"service_pages_localizations_links_fk","columns":["service_page_id"],"referencedColumns":["id"],"referencedTable":"service_pages","onDelete":"CASCADE"},{"name":"service_pages_localizations_links_inv_fk","columns":["inv_service_page_id"],"referencedColumns":["id"],"referencedTable":"service_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"service_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_service_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"service_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_seos_components","indexes":[{"name":"components_shared_seos_field_index","columns":["field"]},{"name":"components_shared_seos_component_type_index","columns":["component_type"]},{"name":"components_shared_seos_entity_fk","columns":["entity_id"]},{"name":"components_shared_seos_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_shared_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_shared_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2023-12-07 21:18:50.399	79b9a286474e84f84ac322f35bfd66a9
\.


--
-- TOC entry 4267 (class 0 OID 18168)
-- Dependencies: 210
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- TOC entry 4287 (class 0 OID 18266)
-- Dependencies: 230
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4307 (class 0 OID 18386)
-- Dependencies: 250
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- TOC entry 4285 (class 0 OID 18255)
-- Dependencies: 228
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4273 (class 0 OID 18193)
-- Dependencies: 216
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- TOC entry 4355 (class 0 OID 19563)
-- Dependencies: 298
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, title, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	sưởi	2023-11-27 23:18:38.61	2023-11-27 23:18:38.61	1	1
2	đèn vàng	2023-11-27 23:18:46.195	2023-11-27 23:18:46.195	1	1
3	Trẻ sơ sinh	2023-11-27 23:18:58.015	2023-11-27 23:18:58.015	1	1
4	Máy trợ thở	2023-11-27 23:19:06.76	2023-11-27 23:19:06.76	1	1
5	business	2023-11-27 23:19:18.623	2023-11-27 23:19:18.623	1	1
6	design	2023-11-27 23:19:25.911	2023-11-27 23:19:25.911	1	1
7	health	2023-11-27 23:19:37.752	2023-11-27 23:19:37.752	1	1
\.


--
-- TOC entry 4295 (class 0 OID 18318)
-- Dependencies: 238
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.changePassword	2023-11-08 09:51:31.469	2023-11-08 09:51:31.469	\N	\N
2	plugin::users-permissions.user.me	2023-11-08 09:51:31.469	2023-11-08 09:51:31.469	\N	\N
3	plugin::users-permissions.auth.forgotPassword	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
4	plugin::users-permissions.auth.sendEmailConfirmation	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
5	plugin::users-permissions.auth.register	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
6	plugin::users-permissions.auth.connect	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
7	plugin::users-permissions.auth.callback	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
8	plugin::users-permissions.auth.resetPassword	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
9	plugin::users-permissions.auth.emailConfirmation	2023-11-08 09:51:31.934	2023-11-08 09:51:31.934	\N	\N
92	plugin::users-permissions.user.find	2023-11-28 23:27:04.678	2023-11-28 23:27:04.678	\N	\N
93	plugin::users-permissions.user.findOne	2023-11-28 23:27:04.679	2023-11-28 23:27:04.679	\N	\N
94	api::post-category.post-category.countPost	2023-11-29 21:37:15.337	2023-11-29 21:37:15.337	\N	\N
95	api::introduce.introduce.find	2023-12-02 08:33:51.636	2023-12-02 08:33:51.636	\N	\N
96	api::contact.contact.find	2023-12-03 09:43:39.758	2023-12-03 09:43:39.758	\N	\N
19	api::product.product.find	2023-11-08 10:12:43.798	2023-11-08 10:12:43.798	\N	\N
21	api::product.product.findOne	2023-11-08 10:12:43.798	2023-11-08 10:12:43.798	\N	\N
26	api::category.category.find	2023-11-08 23:11:21.268	2023-11-08 23:11:21.268	\N	\N
32	api::home-page.home-page.find	2023-11-09 22:30:12.342	2023-11-09 22:30:12.342	\N	\N
36	api::footer.footer.find	2023-11-13 15:11:20.584	2023-11-13 15:11:20.584	\N	\N
55	api::product-page.product-page.find	2023-11-15 21:07:14.725	2023-11-15 21:07:14.725	\N	\N
66	api::post.post.find	2023-11-16 22:55:49.962	2023-11-16 22:55:49.962	\N	\N
72	api::tag.tag.find	2023-11-21 21:05:26.119	2023-11-21 21:05:26.119	\N	\N
73	api::tag.tag.findOne	2023-11-21 21:05:26.119	2023-11-21 21:05:26.119	\N	\N
77	api::service.service.findOne	2023-11-26 10:54:57.849	2023-11-26 10:54:57.849	\N	\N
79	api::service.service.find	2023-11-26 10:54:57.849	2023-11-26 10:54:57.849	\N	\N
81	api::service-page.service-page.find	2023-11-26 10:54:57.849	2023-11-26 10:54:57.849	\N	\N
87	api::post-page.post-page.find	2023-11-28 20:46:14.687	2023-11-28 20:46:14.687	\N	\N
88	api::category.category.findOne	2023-11-28 20:47:24.944	2023-11-28 20:47:24.944	\N	\N
89	api::post.post.findOne	2023-11-28 20:47:24.944	2023-11-28 20:47:24.944	\N	\N
90	api::post-category.post-category.find	2023-11-28 20:47:24.944	2023-11-28 20:47:24.944	\N	\N
91	api::post-category.post-category.findOne	2023-11-28 20:47:24.944	2023-11-28 20:47:24.944	\N	\N
\.


--
-- TOC entry 4315 (class 0 OID 18434)
-- Dependencies: 258
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	1
2	2	1	2
3	6	2	1
4	5	2	1
5	4	2	1
6	3	2	1
7	7	2	1
8	8	2	1
9	9	2	2
92	92	2	20
93	93	2	20
94	94	2	21
95	95	2	22
96	96	2	23
20	19	2	4
21	21	2	4
26	26	2	5
33	32	2	7
41	36	2	9
56	55	2	10
68	66	2	12
72	73	2	14
73	72	2	14
77	79	2	16
79	81	2	16
81	77	2	16
87	87	2	18
88	89	2	19
89	88	2	19
90	90	2	19
91	91	2	19
\.


--
-- TOC entry 4297 (class 0 OID 18327)
-- Dependencies: 240
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2023-11-08 09:51:30.832	2023-11-08 09:51:30.832	\N	\N
2	Public	Default role given to unauthenticated user.	public	2023-11-08 09:51:31.088	2023-12-03 09:43:39.543	\N	\N
\.


--
-- TOC entry 4299 (class 0 OID 18338)
-- Dependencies: 242
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	truong5x	truongnguyen5x@gmail.com	local	$2a$10$qTQTLyTGW5KeCAWA0X4uh.56cTC8RTThsqkHJzioVN4GXFEKO1Gpy	\N	\N	t	f	2023-11-27 23:15:46.611	2023-11-28 23:25:52.251	1	1
\.


--
-- TOC entry 4317 (class 0 OID 18446)
-- Dependencies: 260
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
1	1	2	1
\.


--
-- TOC entry 4291 (class 0 OID 18292)
-- Dependencies: 234
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4313 (class 0 OID 18422)
-- Dependencies: 256
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 358, true);


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 243
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 362, true);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 245
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 271
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 281
-- Name: categories_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_localizations_links_id_seq', 1, false);


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 275
-- Name: components_home_advantages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_home_advantages_id_seq', 4, true);


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 277
-- Name: components_home_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_home_domains_id_seq', 2, true);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 279
-- Name: components_home_home_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_home_home_posts_id_seq', 2, true);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 357
-- Name: components_introduce_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_introduce_ads_id_seq', 2, true);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 349
-- Name: components_introduce_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_introduce_attributes_id_seq', 8, true);


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 353
-- Name: components_introduce_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_introduce_histories_id_seq', 5, true);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 355
-- Name: components_introduce_missions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_introduce_missions_id_seq', 3, true);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 299
-- Name: components_product_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_product_documents_id_seq', 12, true);


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 309
-- Name: components_product_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_product_galleries_id_seq', 69, true);


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 301
-- Name: components_product_specifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_product_specifications_id_seq', 18, true);


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 323
-- Name: components_service_commits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_service_commits_id_seq', 3, true);


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 327
-- Name: components_service_customer_reponses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_service_customer_reponses_id_seq', 2, true);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 329
-- Name: components_service_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_service_partners_id_seq', 5, true);


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 331
-- Name: components_service_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_service_questions_id_seq', 7, true);


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 261
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_meta_socials_id_seq', 1, false);


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 265
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_seos_components_id_seq', 1, false);


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 263
-- Name: components_shared_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_seos_id_seq', 1, false);


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 361
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, true);


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 363
-- Name: contacts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_localizations_links_id_seq', 1, false);


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 253
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 231
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 74, true);


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 251
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1049, true);


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 289
-- Name: footers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footers_id_seq', 1, false);


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 291
-- Name: footers_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footers_localizations_links_id_seq', 1, false);


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 283
-- Name: home_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_pages_components_id_seq', 47, true);


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 273
-- Name: home_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_pages_id_seq', 1, true);


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 285
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_pages_localizations_links_id_seq', 1, false);


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 235
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 2, true);


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 351
-- Name: introduces_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.introduces_components_id_seq', 206, true);


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 345
-- Name: introduces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.introduces_id_seq', 1, true);


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 347
-- Name: introduces_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.introduces_localizations_links_id_seq', 1, false);


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 335
-- Name: post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_categories_id_seq', 5, true);


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 337
-- Name: post_categories_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_categories_localizations_links_id_seq', 1, false);


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 333
-- Name: post_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_pages_id_seq', 1, true);


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 343
-- Name: posts_author_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_author_links_id_seq', 5, true);


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 293
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 303
-- Name: posts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_localizations_links_id_seq', 1, false);


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 341
-- Name: posts_post_category_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_post_category_links_id_seq', 3, true);


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 359
-- Name: posts_posts_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_posts_links_id_seq', 19, true);


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 311
-- Name: posts_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_product_links_id_seq', 5, true);


--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 339
-- Name: posts_tags_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_tags_links_id_seq', 1, false);


--
-- TOC entry 4555 (class 0 OID 0)
-- Dependencies: 295
-- Name: product_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_pages_id_seq', 1, true);


--
-- TOC entry 4556 (class 0 OID 0)
-- Dependencies: 307
-- Name: product_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_pages_localizations_links_id_seq', 1, false);


--
-- TOC entry 4557 (class 0 OID 0)
-- Dependencies: 287
-- Name: products_category_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_links_id_seq', 12, true);


--
-- TOC entry 4558 (class 0 OID 0)
-- Dependencies: 305
-- Name: products_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_components_id_seq', 432, true);


--
-- TOC entry 4559 (class 0 OID 0)
-- Dependencies: 267
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 9, true);


--
-- TOC entry 4560 (class 0 OID 0)
-- Dependencies: 269
-- Name: products_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_localizations_links_id_seq', 1, false);


--
-- TOC entry 4561 (class 0 OID 0)
-- Dependencies: 325
-- Name: service_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pages_components_id_seq', 17, true);


--
-- TOC entry 4562 (class 0 OID 0)
-- Dependencies: 313
-- Name: service_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pages_id_seq', 1, true);


--
-- TOC entry 4563 (class 0 OID 0)
-- Dependencies: 315
-- Name: service_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pages_localizations_links_id_seq', 1, false);


--
-- TOC entry 4564 (class 0 OID 0)
-- Dependencies: 321
-- Name: service_pages_services_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pages_services_links_id_seq', 3, true);


--
-- TOC entry 4565 (class 0 OID 0)
-- Dependencies: 317
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 3, true);


--
-- TOC entry 4566 (class 0 OID 0)
-- Dependencies: 319
-- Name: services_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_localizations_links_id_seq', 1, false);


--
-- TOC entry 4567 (class 0 OID 0)
-- Dependencies: 225
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- TOC entry 4568 (class 0 OID 0)
-- Dependencies: 247
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- TOC entry 4569 (class 0 OID 0)
-- Dependencies: 223
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- TOC entry 4570 (class 0 OID 0)
-- Dependencies: 213
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 67, true);


--
-- TOC entry 4571 (class 0 OID 0)
-- Dependencies: 211
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 70, true);


--
-- TOC entry 4572 (class 0 OID 0)
-- Dependencies: 209
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 4573 (class 0 OID 0)
-- Dependencies: 229
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- TOC entry 4574 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- TOC entry 4575 (class 0 OID 0)
-- Dependencies: 227
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- TOC entry 4576 (class 0 OID 0)
-- Dependencies: 215
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 4577 (class 0 OID 0)
-- Dependencies: 297
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 7, true);


--
-- TOC entry 4578 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 96, true);


--
-- TOC entry 4579 (class 0 OID 0)
-- Dependencies: 257
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 96, true);


--
-- TOC entry 4580 (class 0 OID 0)
-- Dependencies: 239
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- TOC entry 4581 (class 0 OID 0)
-- Dependencies: 241
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, true);


--
-- TOC entry 4582 (class 0 OID 0)
-- Dependencies: 259
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, true);


--
-- TOC entry 4583 (class 0 OID 0)
-- Dependencies: 233
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- TOC entry 4584 (class 0 OID 0)
-- Dependencies: 255
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- TOC entry 3644 (class 2606 OID 18209)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 18354)
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3710 (class 2606 OID 18358)
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- TOC entry 3652 (class 2606 OID 18231)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3648 (class 2606 OID 18220)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3716 (class 2606 OID 18366)
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3718 (class 2606 OID 18370)
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- TOC entry 3808 (class 2606 OID 19098)
-- Name: categories_localizations_links categories_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_localizations_links
    ADD CONSTRAINT categories_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 19102)
-- Name: categories_localizations_links categories_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_localizations_links
    ADD CONSTRAINT categories_localizations_links_unique UNIQUE (category_id, inv_category_id);


--
-- TOC entry 3792 (class 2606 OID 19053)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 19075)
-- Name: components_home_advantages components_home_advantages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_advantages
    ADD CONSTRAINT components_home_advantages_pkey PRIMARY KEY (id);


--
-- TOC entry 3801 (class 2606 OID 19082)
-- Name: components_home_domains components_home_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_domains
    ADD CONSTRAINT components_home_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 19091)
-- Name: components_home_home_posts components_home_home_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_home_home_posts
    ADD CONSTRAINT components_home_home_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3998 (class 2606 OID 20633)
-- Name: components_introduce_ads components_introduce_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_ads
    ADD CONSTRAINT components_introduce_ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3985 (class 2606 OID 20538)
-- Name: components_introduce_attributes components_introduce_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_attributes
    ADD CONSTRAINT components_introduce_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3994 (class 2606 OID 20586)
-- Name: components_introduce_histories components_introduce_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_histories
    ADD CONSTRAINT components_introduce_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3996 (class 2606 OID 20611)
-- Name: components_introduce_missions components_introduce_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_introduce_missions
    ADD CONSTRAINT components_introduce_missions_pkey PRIMARY KEY (id);


--
-- TOC entry 3858 (class 2606 OID 19579)
-- Name: components_product_documents components_product_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_documents
    ADD CONSTRAINT components_product_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3883 (class 2606 OID 19795)
-- Name: components_product_galleries components_product_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_galleries
    ADD CONSTRAINT components_product_galleries_pkey PRIMARY KEY (id);


--
-- TOC entry 3860 (class 2606 OID 19588)
-- Name: components_product_specifications components_product_specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_product_specifications
    ADD CONSTRAINT components_product_specifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3921 (class 2606 OID 20039)
-- Name: components_service_commits components_service_commits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_commits
    ADD CONSTRAINT components_service_commits_pkey PRIMARY KEY (id);


--
-- TOC entry 3930 (class 2606 OID 20083)
-- Name: components_service_customer_reponses components_service_customer_reponses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_customer_reponses
    ADD CONSTRAINT components_service_customer_reponses_pkey PRIMARY KEY (id);


--
-- TOC entry 3932 (class 2606 OID 20102)
-- Name: components_service_partners components_service_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_partners
    ADD CONSTRAINT components_service_partners_pkey PRIMARY KEY (id);


--
-- TOC entry 3934 (class 2606 OID 20121)
-- Name: components_service_questions components_service_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_service_questions
    ADD CONSTRAINT components_service_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 18776)
-- Name: components_shared_meta_socials components_shared_meta_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_meta_socials
    ADD CONSTRAINT components_shared_meta_socials_pkey PRIMARY KEY (id);


--
-- TOC entry 3772 (class 2606 OID 18794)
-- Name: components_shared_seos_components components_shared_seos_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 18785)
-- Name: components_shared_seos components_shared_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos
    ADD CONSTRAINT components_shared_seos_pkey PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 20829)
-- Name: components_shared_seos_components components_shared_seos_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- TOC entry 4014 (class 2606 OID 20736)
-- Name: contacts_localizations_links contacts_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_localizations_links
    ADD CONSTRAINT contacts_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 4016 (class 2606 OID 20740)
-- Name: contacts_localizations_links contacts_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_localizations_links
    ADD CONSTRAINT contacts_localizations_links_unique UNIQUE (contact_id, inv_contact_id);


--
-- TOC entry 4008 (class 2606 OID 20727)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 18415)
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 18419)
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- TOC entry 3672 (class 2606 OID 18282)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 18405)
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- TOC entry 3840 (class 2606 OID 19222)
-- Name: footers_localizations_links footers_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_localizations_links
    ADD CONSTRAINT footers_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3842 (class 2606 OID 19226)
-- Name: footers_localizations_links footers_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_localizations_links
    ADD CONSTRAINT footers_localizations_links_unique UNIQUE (footer_id, inv_footer_id);


--
-- TOC entry 3834 (class 2606 OID 19213)
-- Name: footers footers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_pkey PRIMARY KEY (id);


--
-- TOC entry 3813 (class 2606 OID 19112)
-- Name: home_pages_components home_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_components
    ADD CONSTRAINT home_pages_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 19124)
-- Name: home_pages_localizations_links home_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3824 (class 2606 OID 19128)
-- Name: home_pages_localizations_links home_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_unique UNIQUE (home_page_id, inv_home_page_id);


--
-- TOC entry 3796 (class 2606 OID 19064)
-- Name: home_pages home_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 20821)
-- Name: home_pages_components home_pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_components
    ADD CONSTRAINT home_pages_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- TOC entry 3690 (class 2606 OID 18314)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 3988 (class 2606 OID 20557)
-- Name: introduces_components introduces_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_components
    ADD CONSTRAINT introduces_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3981 (class 2606 OID 20493)
-- Name: introduces_localizations_links introduces_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_localizations_links
    ADD CONSTRAINT introduces_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3983 (class 2606 OID 20497)
-- Name: introduces_localizations_links introduces_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_localizations_links
    ADD CONSTRAINT introduces_localizations_links_unique UNIQUE (introduce_id, inv_introduce_id);


--
-- TOC entry 3975 (class 2606 OID 20484)
-- Name: introduces introduces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces
    ADD CONSTRAINT introduces_pkey PRIMARY KEY (id);


--
-- TOC entry 3992 (class 2606 OID 20823)
-- Name: introduces_components introduces_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_components
    ADD CONSTRAINT introduces_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- TOC entry 3949 (class 2606 OID 20193)
-- Name: post_categories_localizations_links post_categories_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories_localizations_links
    ADD CONSTRAINT post_categories_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3951 (class 2606 OID 20197)
-- Name: post_categories_localizations_links post_categories_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories_localizations_links
    ADD CONSTRAINT post_categories_localizations_links_unique UNIQUE (post_category_id, inv_post_category_id);


--
-- TOC entry 3941 (class 2606 OID 20184)
-- Name: post_categories post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3943 (class 2606 OID 20443)
-- Name: post_categories post_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_slug_unique UNIQUE (slug);


--
-- TOC entry 3937 (class 2606 OID 20143)
-- Name: post_pages post_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_pages
    ADD CONSTRAINT post_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 3970 (class 2606 OID 20411)
-- Name: posts_author_links posts_author_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3972 (class 2606 OID 20415)
-- Name: posts_author_links posts_author_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_unique UNIQUE (post_id, user_id);


--
-- TOC entry 3865 (class 2606 OID 19607)
-- Name: posts_localizations_links posts_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_localizations_links
    ADD CONSTRAINT posts_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3867 (class 2606 OID 19611)
-- Name: posts_localizations_links posts_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_localizations_links
    ADD CONSTRAINT posts_localizations_links_unique UNIQUE (post_id, inv_post_id);


--
-- TOC entry 3845 (class 2606 OID 19548)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3964 (class 2606 OID 20343)
-- Name: posts_post_category_links posts_post_category_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_category_links
    ADD CONSTRAINT posts_post_category_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3966 (class 2606 OID 20347)
-- Name: posts_post_category_links posts_post_category_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_category_links
    ADD CONSTRAINT posts_post_category_links_unique UNIQUE (post_id, post_category_id);


--
-- TOC entry 4003 (class 2606 OID 20679)
-- Name: posts_posts_links posts_posts_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_posts_links
    ADD CONSTRAINT posts_posts_links_pkey PRIMARY KEY (id);


--
-- TOC entry 4005 (class 2606 OID 20683)
-- Name: posts_posts_links posts_posts_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_posts_links
    ADD CONSTRAINT posts_posts_links_unique UNIQUE (post_id, inv_post_id);


--
-- TOC entry 3888 (class 2606 OID 19870)
-- Name: posts_product_links posts_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_product_links
    ADD CONSTRAINT posts_product_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3890 (class 2606 OID 19874)
-- Name: posts_product_links posts_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_product_links
    ADD CONSTRAINT posts_product_links_unique UNIQUE (post_id, product_id);


--
-- TOC entry 3847 (class 2606 OID 20458)
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- TOC entry 3957 (class 2606 OID 20310)
-- Name: posts_tags_links posts_tags_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tags_links
    ADD CONSTRAINT posts_tags_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3959 (class 2606 OID 20314)
-- Name: posts_tags_links posts_tags_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tags_links
    ADD CONSTRAINT posts_tags_links_unique UNIQUE (post_id, tag_id);


--
-- TOC entry 3879 (class 2606 OID 19633)
-- Name: product_pages_localizations_links product_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages_localizations_links
    ADD CONSTRAINT product_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3881 (class 2606 OID 19637)
-- Name: product_pages_localizations_links product_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages_localizations_links
    ADD CONSTRAINT product_pages_localizations_links_unique UNIQUE (product_page_id, inv_product_page_id);


--
-- TOC entry 3851 (class 2606 OID 19559)
-- Name: product_pages product_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages
    ADD CONSTRAINT product_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 3829 (class 2606 OID 19136)
-- Name: products_category_links products_category_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 19140)
-- Name: products_category_links products_category_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_unique UNIQUE (product_id, category_id);


--
-- TOC entry 3870 (class 2606 OID 19621)
-- Name: products_components products_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_components
    ADD CONSTRAINT products_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 18862)
-- Name: products_localizations_links products_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 18866)
-- Name: products_localizations_links products_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_unique UNIQUE (product_id, inv_product_id);


--
-- TOC entry 3779 (class 2606 OID 18853)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 19775)
-- Name: products products_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_unique UNIQUE (slug);


--
-- TOC entry 3874 (class 2606 OID 20825)
-- Name: products_components products_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_components
    ADD CONSTRAINT products_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- TOC entry 3924 (class 2606 OID 20056)
-- Name: service_pages_components service_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_components
    ADD CONSTRAINT service_pages_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3899 (class 2606 OID 19915)
-- Name: service_pages_localizations_links service_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_localizations_links
    ADD CONSTRAINT service_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 19919)
-- Name: service_pages_localizations_links service_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_localizations_links
    ADD CONSTRAINT service_pages_localizations_links_unique UNIQUE (service_page_id, inv_service_page_id);


--
-- TOC entry 3893 (class 2606 OID 19906)
-- Name: service_pages service_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages
    ADD CONSTRAINT service_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 3917 (class 2606 OID 20007)
-- Name: service_pages_services_links service_pages_services_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_services_links
    ADD CONSTRAINT service_pages_services_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3919 (class 2606 OID 20011)
-- Name: service_pages_services_links service_pages_services_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_services_links
    ADD CONSTRAINT service_pages_services_links_unique UNIQUE (service_page_id, service_id);


--
-- TOC entry 3928 (class 2606 OID 20827)
-- Name: service_pages_components service_pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_components
    ADD CONSTRAINT service_pages_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- TOC entry 3910 (class 2606 OID 19966)
-- Name: services_localizations_links services_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_localizations_links
    ADD CONSTRAINT services_localizations_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3912 (class 2606 OID 19970)
-- Name: services_localizations_links services_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_localizations_links
    ADD CONSTRAINT services_localizations_links_unique UNIQUE (service_id, inv_service_id);


--
-- TOC entry 3904 (class 2606 OID 19957)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 3660 (class 2606 OID 18251)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 18379)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3725 (class 2606 OID 18383)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- TOC entry 3656 (class 2606 OID 18242)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 18191)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 18182)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 18173)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3668 (class 2606 OID 18271)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 18391)
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 18395)
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- TOC entry 3664 (class 2606 OID 18262)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3641 (class 2606 OID 18200)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 19568)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3694 (class 2606 OID 18323)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 18439)
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 18443)
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- TOC entry 3698 (class 2606 OID 18334)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3702 (class 2606 OID 18345)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3763 (class 2606 OID 18451)
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3765 (class 2606 OID 18455)
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- TOC entry 3749 (class 2606 OID 18427)
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3751 (class 2606 OID 18431)
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- TOC entry 3682 (class 2606 OID 18301)
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- TOC entry 3684 (class 2606 OID 18303)
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- TOC entry 3686 (class 2606 OID 18299)
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3642 (class 1259 OID 18210)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 3704 (class 1259 OID 18355)
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3705 (class 1259 OID 18356)
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- TOC entry 3706 (class 1259 OID 18359)
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- TOC entry 3645 (class 1259 OID 18211)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 3650 (class 1259 OID 18232)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 3653 (class 1259 OID 18233)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 3646 (class 1259 OID 18221)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 3711 (class 1259 OID 18367)
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- TOC entry 3712 (class 1259 OID 18368)
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- TOC entry 3713 (class 1259 OID 18371)
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- TOC entry 3714 (class 1259 OID 18372)
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- TOC entry 3649 (class 1259 OID 18222)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 3790 (class 1259 OID 19054)
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- TOC entry 3804 (class 1259 OID 19099)
-- Name: categories_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_localizations_links_fk ON public.categories_localizations_links USING btree (category_id);


--
-- TOC entry 3805 (class 1259 OID 19100)
-- Name: categories_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_localizations_links_inv_fk ON public.categories_localizations_links USING btree (inv_category_id);


--
-- TOC entry 3806 (class 1259 OID 19103)
-- Name: categories_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_localizations_links_order_fk ON public.categories_localizations_links USING btree (category_order);


--
-- TOC entry 3793 (class 1259 OID 19055)
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- TOC entry 3770 (class 1259 OID 18796)
-- Name: components_shared_seos_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_component_type_index ON public.components_shared_seos_components USING btree (component_type);


--
-- TOC entry 3773 (class 1259 OID 18797)
-- Name: components_shared_seos_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_entity_fk ON public.components_shared_seos_components USING btree (entity_id);


--
-- TOC entry 3774 (class 1259 OID 18795)
-- Name: components_shared_seos_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_field_index ON public.components_shared_seos_components USING btree (field);


--
-- TOC entry 4006 (class 1259 OID 20728)
-- Name: contacts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_created_by_id_fk ON public.contacts USING btree (created_by_id);


--
-- TOC entry 4010 (class 1259 OID 20737)
-- Name: contacts_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_localizations_links_fk ON public.contacts_localizations_links USING btree (contact_id);


--
-- TOC entry 4011 (class 1259 OID 20738)
-- Name: contacts_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_localizations_links_inv_fk ON public.contacts_localizations_links USING btree (inv_contact_id);


--
-- TOC entry 4012 (class 1259 OID 20741)
-- Name: contacts_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_localizations_links_order_fk ON public.contacts_localizations_links USING btree (contact_order);


--
-- TOC entry 4009 (class 1259 OID 20729)
-- Name: contacts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_updated_by_id_fk ON public.contacts USING btree (updated_by_id);


--
-- TOC entry 3670 (class 1259 OID 18289)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 3738 (class 1259 OID 18416)
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- TOC entry 3739 (class 1259 OID 18417)
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- TOC entry 3740 (class 1259 OID 18420)
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- TOC entry 3733 (class 1259 OID 18406)
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- TOC entry 3734 (class 1259 OID 18408)
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- TOC entry 3735 (class 1259 OID 18407)
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- TOC entry 3673 (class 1259 OID 18290)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 3832 (class 1259 OID 19214)
-- Name: footers_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footers_created_by_id_fk ON public.footers USING btree (created_by_id);


--
-- TOC entry 3836 (class 1259 OID 19223)
-- Name: footers_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footers_localizations_links_fk ON public.footers_localizations_links USING btree (footer_id);


--
-- TOC entry 3837 (class 1259 OID 19224)
-- Name: footers_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footers_localizations_links_inv_fk ON public.footers_localizations_links USING btree (inv_footer_id);


--
-- TOC entry 3838 (class 1259 OID 19227)
-- Name: footers_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footers_localizations_links_order_fk ON public.footers_localizations_links USING btree (footer_order);


--
-- TOC entry 3835 (class 1259 OID 19215)
-- Name: footers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footers_updated_by_id_fk ON public.footers USING btree (updated_by_id);


--
-- TOC entry 3811 (class 1259 OID 19114)
-- Name: home_pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_component_type_index ON public.home_pages_components USING btree (component_type);


--
-- TOC entry 3794 (class 1259 OID 19065)
-- Name: home_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_created_by_id_fk ON public.home_pages USING btree (created_by_id);


--
-- TOC entry 3814 (class 1259 OID 19115)
-- Name: home_pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_entity_fk ON public.home_pages_components USING btree (entity_id);


--
-- TOC entry 3815 (class 1259 OID 19113)
-- Name: home_pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_field_index ON public.home_pages_components USING btree (field);


--
-- TOC entry 3818 (class 1259 OID 19125)
-- Name: home_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_fk ON public.home_pages_localizations_links USING btree (home_page_id);


--
-- TOC entry 3819 (class 1259 OID 19126)
-- Name: home_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_inv_fk ON public.home_pages_localizations_links USING btree (inv_home_page_id);


--
-- TOC entry 3820 (class 1259 OID 19129)
-- Name: home_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_order_fk ON public.home_pages_localizations_links USING btree (home_page_order);


--
-- TOC entry 3797 (class 1259 OID 19066)
-- Name: home_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_updated_by_id_fk ON public.home_pages USING btree (updated_by_id);


--
-- TOC entry 3688 (class 1259 OID 18315)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 3691 (class 1259 OID 18316)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 3986 (class 1259 OID 20559)
-- Name: introduces_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_component_type_index ON public.introduces_components USING btree (component_type);


--
-- TOC entry 3973 (class 1259 OID 20485)
-- Name: introduces_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_created_by_id_fk ON public.introduces USING btree (created_by_id);


--
-- TOC entry 3989 (class 1259 OID 20560)
-- Name: introduces_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_entity_fk ON public.introduces_components USING btree (entity_id);


--
-- TOC entry 3990 (class 1259 OID 20558)
-- Name: introduces_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_field_index ON public.introduces_components USING btree (field);


--
-- TOC entry 3977 (class 1259 OID 20494)
-- Name: introduces_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_localizations_links_fk ON public.introduces_localizations_links USING btree (introduce_id);


--
-- TOC entry 3978 (class 1259 OID 20495)
-- Name: introduces_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_localizations_links_inv_fk ON public.introduces_localizations_links USING btree (inv_introduce_id);


--
-- TOC entry 3979 (class 1259 OID 20498)
-- Name: introduces_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_localizations_links_order_fk ON public.introduces_localizations_links USING btree (introduce_order);


--
-- TOC entry 3976 (class 1259 OID 20486)
-- Name: introduces_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX introduces_updated_by_id_fk ON public.introduces USING btree (updated_by_id);


--
-- TOC entry 3939 (class 1259 OID 20185)
-- Name: post_categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_categories_created_by_id_fk ON public.post_categories USING btree (created_by_id);


--
-- TOC entry 3945 (class 1259 OID 20194)
-- Name: post_categories_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_categories_localizations_links_fk ON public.post_categories_localizations_links USING btree (post_category_id);


--
-- TOC entry 3946 (class 1259 OID 20195)
-- Name: post_categories_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_categories_localizations_links_inv_fk ON public.post_categories_localizations_links USING btree (inv_post_category_id);


--
-- TOC entry 3947 (class 1259 OID 20198)
-- Name: post_categories_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_categories_localizations_links_order_fk ON public.post_categories_localizations_links USING btree (post_category_order);


--
-- TOC entry 3944 (class 1259 OID 20186)
-- Name: post_categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_categories_updated_by_id_fk ON public.post_categories USING btree (updated_by_id);


--
-- TOC entry 3935 (class 1259 OID 20144)
-- Name: post_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_pages_created_by_id_fk ON public.post_pages USING btree (created_by_id);


--
-- TOC entry 3938 (class 1259 OID 20145)
-- Name: post_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_pages_updated_by_id_fk ON public.post_pages USING btree (updated_by_id);


--
-- TOC entry 3967 (class 1259 OID 20412)
-- Name: posts_author_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_author_links_fk ON public.posts_author_links USING btree (post_id);


--
-- TOC entry 3968 (class 1259 OID 20413)
-- Name: posts_author_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_author_links_inv_fk ON public.posts_author_links USING btree (user_id);


--
-- TOC entry 3843 (class 1259 OID 19549)
-- Name: posts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_created_by_id_fk ON public.posts USING btree (created_by_id);


--
-- TOC entry 3861 (class 1259 OID 19608)
-- Name: posts_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_localizations_links_fk ON public.posts_localizations_links USING btree (post_id);


--
-- TOC entry 3862 (class 1259 OID 19609)
-- Name: posts_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_localizations_links_inv_fk ON public.posts_localizations_links USING btree (inv_post_id);


--
-- TOC entry 3863 (class 1259 OID 19612)
-- Name: posts_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_localizations_links_order_fk ON public.posts_localizations_links USING btree (post_order);


--
-- TOC entry 3960 (class 1259 OID 20344)
-- Name: posts_post_category_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_category_links_fk ON public.posts_post_category_links USING btree (post_id);


--
-- TOC entry 3961 (class 1259 OID 20345)
-- Name: posts_post_category_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_category_links_inv_fk ON public.posts_post_category_links USING btree (post_category_id);


--
-- TOC entry 3962 (class 1259 OID 20348)
-- Name: posts_post_category_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_category_links_order_inv_fk ON public.posts_post_category_links USING btree (post_order);


--
-- TOC entry 3999 (class 1259 OID 20680)
-- Name: posts_posts_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_posts_links_fk ON public.posts_posts_links USING btree (post_id);


--
-- TOC entry 4000 (class 1259 OID 20681)
-- Name: posts_posts_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_posts_links_inv_fk ON public.posts_posts_links USING btree (inv_post_id);


--
-- TOC entry 4001 (class 1259 OID 20684)
-- Name: posts_posts_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_posts_links_order_fk ON public.posts_posts_links USING btree (post_order);


--
-- TOC entry 3884 (class 1259 OID 19871)
-- Name: posts_product_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_product_links_fk ON public.posts_product_links USING btree (post_id);


--
-- TOC entry 3885 (class 1259 OID 19872)
-- Name: posts_product_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_product_links_inv_fk ON public.posts_product_links USING btree (product_id);


--
-- TOC entry 3886 (class 1259 OID 19875)
-- Name: posts_product_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_product_links_order_inv_fk ON public.posts_product_links USING btree (post_order);


--
-- TOC entry 3952 (class 1259 OID 20311)
-- Name: posts_tags_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tags_links_fk ON public.posts_tags_links USING btree (post_id);


--
-- TOC entry 3953 (class 1259 OID 20312)
-- Name: posts_tags_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tags_links_inv_fk ON public.posts_tags_links USING btree (tag_id);


--
-- TOC entry 3954 (class 1259 OID 20315)
-- Name: posts_tags_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tags_links_order_fk ON public.posts_tags_links USING btree (tag_order);


--
-- TOC entry 3955 (class 1259 OID 20316)
-- Name: posts_tags_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tags_links_order_inv_fk ON public.posts_tags_links USING btree (post_order);


--
-- TOC entry 3848 (class 1259 OID 19550)
-- Name: posts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_updated_by_id_fk ON public.posts USING btree (updated_by_id);


--
-- TOC entry 3849 (class 1259 OID 19560)
-- Name: product_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_pages_created_by_id_fk ON public.product_pages USING btree (created_by_id);


--
-- TOC entry 3875 (class 1259 OID 19634)
-- Name: product_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_pages_localizations_links_fk ON public.product_pages_localizations_links USING btree (product_page_id);


--
-- TOC entry 3876 (class 1259 OID 19635)
-- Name: product_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_pages_localizations_links_inv_fk ON public.product_pages_localizations_links USING btree (inv_product_page_id);


--
-- TOC entry 3877 (class 1259 OID 19638)
-- Name: product_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_pages_localizations_links_order_fk ON public.product_pages_localizations_links USING btree (product_page_order);


--
-- TOC entry 3852 (class 1259 OID 19561)
-- Name: product_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_pages_updated_by_id_fk ON public.product_pages USING btree (updated_by_id);


--
-- TOC entry 3825 (class 1259 OID 19137)
-- Name: products_category_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_fk ON public.products_category_links USING btree (product_id);


--
-- TOC entry 3826 (class 1259 OID 19138)
-- Name: products_category_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_inv_fk ON public.products_category_links USING btree (category_id);


--
-- TOC entry 3827 (class 1259 OID 19141)
-- Name: products_category_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_order_inv_fk ON public.products_category_links USING btree (product_order);


--
-- TOC entry 3868 (class 1259 OID 19623)
-- Name: products_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_component_type_index ON public.products_components USING btree (component_type);


--
-- TOC entry 3777 (class 1259 OID 18854)
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- TOC entry 3871 (class 1259 OID 19624)
-- Name: products_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_entity_fk ON public.products_components USING btree (entity_id);


--
-- TOC entry 3872 (class 1259 OID 19622)
-- Name: products_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_field_index ON public.products_components USING btree (field);


--
-- TOC entry 3783 (class 1259 OID 18863)
-- Name: products_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_fk ON public.products_localizations_links USING btree (product_id);


--
-- TOC entry 3784 (class 1259 OID 18864)
-- Name: products_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_inv_fk ON public.products_localizations_links USING btree (inv_product_id);


--
-- TOC entry 3785 (class 1259 OID 18867)
-- Name: products_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_order_fk ON public.products_localizations_links USING btree (product_order);


--
-- TOC entry 3782 (class 1259 OID 18855)
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- TOC entry 3922 (class 1259 OID 20058)
-- Name: service_pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_component_type_index ON public.service_pages_components USING btree (component_type);


--
-- TOC entry 3891 (class 1259 OID 19907)
-- Name: service_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_created_by_id_fk ON public.service_pages USING btree (created_by_id);


--
-- TOC entry 3925 (class 1259 OID 20059)
-- Name: service_pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_entity_fk ON public.service_pages_components USING btree (entity_id);


--
-- TOC entry 3926 (class 1259 OID 20057)
-- Name: service_pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_field_index ON public.service_pages_components USING btree (field);


--
-- TOC entry 3895 (class 1259 OID 19916)
-- Name: service_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_localizations_links_fk ON public.service_pages_localizations_links USING btree (service_page_id);


--
-- TOC entry 3896 (class 1259 OID 19917)
-- Name: service_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_localizations_links_inv_fk ON public.service_pages_localizations_links USING btree (inv_service_page_id);


--
-- TOC entry 3897 (class 1259 OID 19920)
-- Name: service_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_localizations_links_order_fk ON public.service_pages_localizations_links USING btree (service_page_order);


--
-- TOC entry 3913 (class 1259 OID 20008)
-- Name: service_pages_services_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_services_links_fk ON public.service_pages_services_links USING btree (service_page_id);


--
-- TOC entry 3914 (class 1259 OID 20009)
-- Name: service_pages_services_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_services_links_inv_fk ON public.service_pages_services_links USING btree (service_id);


--
-- TOC entry 3915 (class 1259 OID 20012)
-- Name: service_pages_services_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_services_links_order_fk ON public.service_pages_services_links USING btree (service_order);


--
-- TOC entry 3894 (class 1259 OID 19908)
-- Name: service_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_pages_updated_by_id_fk ON public.service_pages USING btree (updated_by_id);


--
-- TOC entry 3902 (class 1259 OID 19958)
-- Name: services_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_created_by_id_fk ON public.services USING btree (created_by_id);


--
-- TOC entry 3906 (class 1259 OID 19967)
-- Name: services_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_localizations_links_fk ON public.services_localizations_links USING btree (service_id);


--
-- TOC entry 3907 (class 1259 OID 19968)
-- Name: services_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_localizations_links_inv_fk ON public.services_localizations_links USING btree (inv_service_id);


--
-- TOC entry 3908 (class 1259 OID 19971)
-- Name: services_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_localizations_links_order_fk ON public.services_localizations_links USING btree (service_order);


--
-- TOC entry 3905 (class 1259 OID 19959)
-- Name: services_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_updated_by_id_fk ON public.services USING btree (updated_by_id);


--
-- TOC entry 3658 (class 1259 OID 18252)
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- TOC entry 3719 (class 1259 OID 18380)
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- TOC entry 3720 (class 1259 OID 18381)
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- TOC entry 3721 (class 1259 OID 18384)
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- TOC entry 3661 (class 1259 OID 18253)
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- TOC entry 3654 (class 1259 OID 18243)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 3657 (class 1259 OID 18244)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 3666 (class 1259 OID 18272)
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- TOC entry 3726 (class 1259 OID 18392)
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- TOC entry 3727 (class 1259 OID 18393)
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- TOC entry 3728 (class 1259 OID 18396)
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- TOC entry 3669 (class 1259 OID 18273)
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- TOC entry 3662 (class 1259 OID 18263)
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- TOC entry 3665 (class 1259 OID 18264)
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- TOC entry 3853 (class 1259 OID 19569)
-- Name: tags_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_created_by_id_fk ON public.tags USING btree (created_by_id);


--
-- TOC entry 3856 (class 1259 OID 19570)
-- Name: tags_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_updated_by_id_fk ON public.tags USING btree (updated_by_id);


--
-- TOC entry 3692 (class 1259 OID 18324)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 3752 (class 1259 OID 18440)
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3753 (class 1259 OID 18441)
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- TOC entry 3754 (class 1259 OID 18444)
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- TOC entry 3695 (class 1259 OID 18325)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 3696 (class 1259 OID 18335)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 3699 (class 1259 OID 18336)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 3700 (class 1259 OID 18346)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 3759 (class 1259 OID 18452)
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- TOC entry 3760 (class 1259 OID 18453)
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- TOC entry 3761 (class 1259 OID 18456)
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- TOC entry 3703 (class 1259 OID 18347)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 3674 (class 1259 OID 18284)
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- TOC entry 3675 (class 1259 OID 18288)
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- TOC entry 3676 (class 1259 OID 18283)
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- TOC entry 3677 (class 1259 OID 18286)
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- TOC entry 3678 (class 1259 OID 18287)
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- TOC entry 3679 (class 1259 OID 18285)
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- TOC entry 3680 (class 1259 OID 18304)
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- TOC entry 3745 (class 1259 OID 18428)
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- TOC entry 3746 (class 1259 OID 18429)
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- TOC entry 3747 (class 1259 OID 18432)
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- TOC entry 3687 (class 1259 OID 18305)
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- TOC entry 4017 (class 2606 OID 18457)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4043 (class 2606 OID 18587)
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4044 (class 2606 OID 18592)
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4018 (class 2606 OID 18462)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4021 (class 2606 OID 18477)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4022 (class 2606 OID 18482)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4019 (class 2606 OID 18467)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4045 (class 2606 OID 18597)
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 4046 (class 2606 OID 18602)
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4020 (class 2606 OID 18472)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4065 (class 2606 OID 19142)
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4069 (class 2606 OID 19162)
-- Name: categories_localizations_links categories_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_localizations_links
    ADD CONSTRAINT categories_localizations_links_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4070 (class 2606 OID 19167)
-- Name: categories_localizations_links categories_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_localizations_links
    ADD CONSTRAINT categories_localizations_links_inv_fk FOREIGN KEY (inv_category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4066 (class 2606 OID 19147)
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4060 (class 2606 OID 18800)
-- Name: components_shared_seos_components components_shared_seos_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_shared_seos(id) ON DELETE CASCADE;


--
-- TOC entry 4123 (class 2606 OID 20742)
-- Name: contacts contacts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4125 (class 2606 OID 20752)
-- Name: contacts_localizations_links contacts_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_localizations_links
    ADD CONSTRAINT contacts_localizations_links_fk FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- TOC entry 4126 (class 2606 OID 20757)
-- Name: contacts_localizations_links contacts_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_localizations_links
    ADD CONSTRAINT contacts_localizations_links_inv_fk FOREIGN KEY (inv_contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- TOC entry 4124 (class 2606 OID 20747)
-- Name: contacts contacts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4031 (class 2606 OID 18527)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4052 (class 2606 OID 18632)
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 4053 (class 2606 OID 18637)
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4051 (class 2606 OID 18627)
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 4032 (class 2606 OID 18532)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4076 (class 2606 OID 19228)
-- Name: footers footers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4078 (class 2606 OID 19238)
-- Name: footers_localizations_links footers_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_localizations_links
    ADD CONSTRAINT footers_localizations_links_fk FOREIGN KEY (footer_id) REFERENCES public.footers(id) ON DELETE CASCADE;


--
-- TOC entry 4079 (class 2606 OID 19243)
-- Name: footers_localizations_links footers_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_localizations_links
    ADD CONSTRAINT footers_localizations_links_inv_fk FOREIGN KEY (inv_footer_id) REFERENCES public.footers(id) ON DELETE CASCADE;


--
-- TOC entry 4077 (class 2606 OID 19233)
-- Name: footers footers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4067 (class 2606 OID 19152)
-- Name: home_pages home_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4071 (class 2606 OID 19172)
-- Name: home_pages_components home_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_components
    ADD CONSTRAINT home_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4072 (class 2606 OID 19177)
-- Name: home_pages_localizations_links home_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_fk FOREIGN KEY (home_page_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4073 (class 2606 OID 19182)
-- Name: home_pages_localizations_links home_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_inv_fk FOREIGN KEY (inv_home_page_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4068 (class 2606 OID 19157)
-- Name: home_pages home_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4035 (class 2606 OID 18547)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4036 (class 2606 OID 18552)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4116 (class 2606 OID 20499)
-- Name: introduces introduces_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces
    ADD CONSTRAINT introduces_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4120 (class 2606 OID 20563)
-- Name: introduces_components introduces_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_components
    ADD CONSTRAINT introduces_entity_fk FOREIGN KEY (entity_id) REFERENCES public.introduces(id) ON DELETE CASCADE;


--
-- TOC entry 4118 (class 2606 OID 20509)
-- Name: introduces_localizations_links introduces_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_localizations_links
    ADD CONSTRAINT introduces_localizations_links_fk FOREIGN KEY (introduce_id) REFERENCES public.introduces(id) ON DELETE CASCADE;


--
-- TOC entry 4119 (class 2606 OID 20514)
-- Name: introduces_localizations_links introduces_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces_localizations_links
    ADD CONSTRAINT introduces_localizations_links_inv_fk FOREIGN KEY (inv_introduce_id) REFERENCES public.introduces(id) ON DELETE CASCADE;


--
-- TOC entry 4117 (class 2606 OID 20504)
-- Name: introduces introduces_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.introduces
    ADD CONSTRAINT introduces_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4106 (class 2606 OID 20199)
-- Name: post_categories post_categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4108 (class 2606 OID 20209)
-- Name: post_categories_localizations_links post_categories_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories_localizations_links
    ADD CONSTRAINT post_categories_localizations_links_fk FOREIGN KEY (post_category_id) REFERENCES public.post_categories(id) ON DELETE CASCADE;


--
-- TOC entry 4109 (class 2606 OID 20214)
-- Name: post_categories_localizations_links post_categories_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories_localizations_links
    ADD CONSTRAINT post_categories_localizations_links_inv_fk FOREIGN KEY (inv_post_category_id) REFERENCES public.post_categories(id) ON DELETE CASCADE;


--
-- TOC entry 4107 (class 2606 OID 20204)
-- Name: post_categories post_categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4104 (class 2606 OID 20146)
-- Name: post_pages post_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_pages
    ADD CONSTRAINT post_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4105 (class 2606 OID 20151)
-- Name: post_pages post_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_pages
    ADD CONSTRAINT post_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4114 (class 2606 OID 20416)
-- Name: posts_author_links posts_author_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4115 (class 2606 OID 20421)
-- Name: posts_author_links posts_author_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 4080 (class 2606 OID 19649)
-- Name: posts posts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4086 (class 2606 OID 19689)
-- Name: posts_localizations_links posts_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_localizations_links
    ADD CONSTRAINT posts_localizations_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4087 (class 2606 OID 19694)
-- Name: posts_localizations_links posts_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_localizations_links
    ADD CONSTRAINT posts_localizations_links_inv_fk FOREIGN KEY (inv_post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4112 (class 2606 OID 20349)
-- Name: posts_post_category_links posts_post_category_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_category_links
    ADD CONSTRAINT posts_post_category_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4113 (class 2606 OID 20354)
-- Name: posts_post_category_links posts_post_category_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_category_links
    ADD CONSTRAINT posts_post_category_links_inv_fk FOREIGN KEY (post_category_id) REFERENCES public.post_categories(id) ON DELETE CASCADE;


--
-- TOC entry 4121 (class 2606 OID 20685)
-- Name: posts_posts_links posts_posts_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_posts_links
    ADD CONSTRAINT posts_posts_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4122 (class 2606 OID 20690)
-- Name: posts_posts_links posts_posts_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_posts_links
    ADD CONSTRAINT posts_posts_links_inv_fk FOREIGN KEY (inv_post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4091 (class 2606 OID 19876)
-- Name: posts_product_links posts_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_product_links
    ADD CONSTRAINT posts_product_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4092 (class 2606 OID 19881)
-- Name: posts_product_links posts_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_product_links
    ADD CONSTRAINT posts_product_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4110 (class 2606 OID 20317)
-- Name: posts_tags_links posts_tags_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tags_links
    ADD CONSTRAINT posts_tags_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4111 (class 2606 OID 20322)
-- Name: posts_tags_links posts_tags_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tags_links
    ADD CONSTRAINT posts_tags_links_inv_fk FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- TOC entry 4081 (class 2606 OID 19654)
-- Name: posts posts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4082 (class 2606 OID 19659)
-- Name: product_pages product_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages
    ADD CONSTRAINT product_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4089 (class 2606 OID 19704)
-- Name: product_pages_localizations_links product_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages_localizations_links
    ADD CONSTRAINT product_pages_localizations_links_fk FOREIGN KEY (product_page_id) REFERENCES public.product_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4090 (class 2606 OID 19709)
-- Name: product_pages_localizations_links product_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages_localizations_links
    ADD CONSTRAINT product_pages_localizations_links_inv_fk FOREIGN KEY (inv_product_page_id) REFERENCES public.product_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4083 (class 2606 OID 19664)
-- Name: product_pages product_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pages
    ADD CONSTRAINT product_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4074 (class 2606 OID 19187)
-- Name: products_category_links products_category_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4075 (class 2606 OID 19192)
-- Name: products_category_links products_category_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_inv_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4061 (class 2606 OID 18868)
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4088 (class 2606 OID 19699)
-- Name: products_components products_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_components
    ADD CONSTRAINT products_entity_fk FOREIGN KEY (entity_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4063 (class 2606 OID 18878)
-- Name: products_localizations_links products_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4064 (class 2606 OID 18883)
-- Name: products_localizations_links products_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_inv_fk FOREIGN KEY (inv_product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4062 (class 2606 OID 18873)
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4093 (class 2606 OID 19921)
-- Name: service_pages service_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages
    ADD CONSTRAINT service_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4103 (class 2606 OID 20062)
-- Name: service_pages_components service_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_components
    ADD CONSTRAINT service_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.service_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4095 (class 2606 OID 19931)
-- Name: service_pages_localizations_links service_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_localizations_links
    ADD CONSTRAINT service_pages_localizations_links_fk FOREIGN KEY (service_page_id) REFERENCES public.service_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4096 (class 2606 OID 19936)
-- Name: service_pages_localizations_links service_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_localizations_links
    ADD CONSTRAINT service_pages_localizations_links_inv_fk FOREIGN KEY (inv_service_page_id) REFERENCES public.service_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4101 (class 2606 OID 20013)
-- Name: service_pages_services_links service_pages_services_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_services_links
    ADD CONSTRAINT service_pages_services_links_fk FOREIGN KEY (service_page_id) REFERENCES public.service_pages(id) ON DELETE CASCADE;


--
-- TOC entry 4102 (class 2606 OID 20018)
-- Name: service_pages_services_links service_pages_services_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages_services_links
    ADD CONSTRAINT service_pages_services_links_inv_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4094 (class 2606 OID 19926)
-- Name: service_pages service_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pages
    ADD CONSTRAINT service_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4097 (class 2606 OID 19972)
-- Name: services services_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4099 (class 2606 OID 19982)
-- Name: services_localizations_links services_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_localizations_links
    ADD CONSTRAINT services_localizations_links_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4100 (class 2606 OID 19987)
-- Name: services_localizations_links services_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_localizations_links
    ADD CONSTRAINT services_localizations_links_inv_fk FOREIGN KEY (inv_service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4098 (class 2606 OID 19977)
-- Name: services services_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4025 (class 2606 OID 18497)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4047 (class 2606 OID 18607)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4048 (class 2606 OID 18612)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 4026 (class 2606 OID 18502)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4023 (class 2606 OID 18487)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4024 (class 2606 OID 18492)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4029 (class 2606 OID 18517)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4049 (class 2606 OID 18617)
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4050 (class 2606 OID 18622)
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 4030 (class 2606 OID 18522)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4027 (class 2606 OID 18507)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4028 (class 2606 OID 18512)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4084 (class 2606 OID 19669)
-- Name: tags tags_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4085 (class 2606 OID 19674)
-- Name: tags tags_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4037 (class 2606 OID 18557)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4056 (class 2606 OID 18652)
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4057 (class 2606 OID 18657)
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4038 (class 2606 OID 18562)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4039 (class 2606 OID 18567)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4040 (class 2606 OID 18572)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4041 (class 2606 OID 18577)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4058 (class 2606 OID 18662)
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 4059 (class 2606 OID 18667)
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4042 (class 2606 OID 18582)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4033 (class 2606 OID 18537)
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4054 (class 2606 OID 18642)
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4055 (class 2606 OID 18647)
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4034 (class 2606 OID 18542)
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-01-04 20:31:22

--
-- PostgreSQL database dump complete
--

