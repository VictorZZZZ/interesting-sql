--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-26 18:44:37

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
-- TOC entry 204 (class 1259 OID 16636)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    sender_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- TOC entry 2816 (class 0 OID 16636)
-- Dependencies: 204
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (sender_id, receiver_id) FROM stdin;
1	2
1	3
1	3
2	3
2	4
3	8
3	1
8	3
4	2
1	4
4	1
\.


-- Completed on 2020-09-26 18:44:37

--
-- PostgreSQL database dump complete
--

