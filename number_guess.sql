--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE gamedb;
--
-- Name: gamedb; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE gamedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE gamedb OWNER TO freecodecamp;

\connect gamedb

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (22, 'user_1727022386372', 2, 354);
INSERT INTO public.users VALUES (32, 'user_1727022771798', 2, 44);
INSERT INTO public.users VALUES (21, 'user_1727022386373', 5, 230);
INSERT INTO public.users VALUES (42, 'user_1727022967907', 2, 861);
INSERT INTO public.users VALUES (31, 'user_1727022771799', 5, 519);
INSERT INTO public.users VALUES (24, 'user_1727022434372', 2, 167);
INSERT INTO public.users VALUES (41, 'user_1727022967908', 5, 142);
INSERT INTO public.users VALUES (23, 'user_1727022434373', 5, 212);
INSERT INTO public.users VALUES (34, 'user_1727022787792', 2, 140);
INSERT INTO public.users VALUES (33, 'user_1727022787793', 5, 33);
INSERT INTO public.users VALUES (26, 'user_1727022529881', 2, 583);
INSERT INTO public.users VALUES (25, 'user_1727022529882', 5, 329);
INSERT INTO public.users VALUES (20, 'Ole', 3, 5);
INSERT INTO public.users VALUES (44, 'user_1727023031831', 2, 598);
INSERT INTO public.users VALUES (36, 'user_1727022807508', 2, 191);
INSERT INTO public.users VALUES (28, 'user_1727022574456', 2, 295);
INSERT INTO public.users VALUES (43, 'user_1727023031832', 5, 108);
INSERT INTO public.users VALUES (35, 'user_1727022807509', 5, 391);
INSERT INTO public.users VALUES (27, 'user_1727022574457', 5, 273);
INSERT INTO public.users VALUES (30, 'user_1727022600638', 2, 489);
INSERT INTO public.users VALUES (38, 'user_1727022854617', 2, 786);
INSERT INTO public.users VALUES (29, 'user_1727022600639', 5, 137);
INSERT INTO public.users VALUES (46, 'user_1727023109463', 2, 312);
INSERT INTO public.users VALUES (37, 'user_1727022854618', 5, 467);
INSERT INTO public.users VALUES (45, 'user_1727023109464', 5, 189);
INSERT INTO public.users VALUES (40, 'user_1727022926561', 2, 475);
INSERT INTO public.users VALUES (39, 'user_1727022926562', 5, 132);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 46, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

