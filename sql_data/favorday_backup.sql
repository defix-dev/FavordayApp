--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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
-- Name: favordayDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "favordayDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "favordayDB" OWNER TO postgres;

\connect "favordayDB"

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    username character varying(30),
    name character varying(15),
    surname character varying(15),
    password character varying(255),
    register_date date DEFAULT '1978-01-01'
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_role (
    account_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.account_role OWNER TO postgres;

--
-- Name: post_account_limit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_account_limit (
    account_id bigint NOT NULL,
    post_limit integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.post_account_limit OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, username, name, surname, password, register_date) FROM stdin;
2	defix	kostya	malik	$2a$10$qRCClR2U1mShm27ELis6reJWaq8xLeO87jeilY9wK9WlR5cQVq1gG	2024-08-05
3	test	test	test	$2a$10$FKYrO2FGufHGTLgoJY02p.QZYGKDPXqBHvKOqEXGCBpMOvSl4KSlO	2024-08-05
\.


--
-- Data for Name: account_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_role (account_id, role_id) FROM stdin;
2	1
3	1
\.


--
-- Data for Name: post_account_limit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_account_limit (account_id, post_limit) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
1	USER
2	MODERATOR
3	ADMIN
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 3, true);


--
-- Name: account_role account_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_pkey PRIMARY KEY (account_id, role_id);


--
-- Name: post_account_limit post_account_limit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_account_limit
    ADD CONSTRAINT post_account_limit_pkey PRIMARY KEY (account_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: account table_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT table_name_pkey PRIMARY KEY (id);


--
-- Name: account_role account_role_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_role account_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: post_account_limit post_account_limit_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_account_limit
    ADD CONSTRAINT post_account_limit_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- PostgreSQL database dump complete
--

