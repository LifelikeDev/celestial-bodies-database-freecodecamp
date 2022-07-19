--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: creation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creation (
    creation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_complete boolean NOT NULL,
    estimated_age_in_billions_of_years integer
);


ALTER TABLE public.creation OWNER TO freecodecamp;

--
-- Name: creation_creation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creation_creation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creation_creation_id_seq OWNER TO freecodecamp;

--
-- Name: creation_creation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creation_creation_id_seq OWNED BY public.creation.creation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_millions_of_kilometers integer,
    estimated_number_of_stars numeric,
    description text,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    diameter_in_kilometers integer,
    moon_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    diameter_in_kilometers integer,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    number_of_planets_associated_with integer,
    belongs_to_earth boolean NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: creation creation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creation ALTER COLUMN creation_id SET DEFAULT nextval('public.creation_creation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creation VALUES (1, 'Creation Alpha', true, 23);
INSERT INTO public.creation VALUES (2, 'Creation Beta', true, 1);
INSERT INTO public.creation VALUES (3, 'Creation Omega', true, 1000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 10293, NULL, 3535211, 'The coolest Milky Way Galaxy', false, 1);
INSERT INTO public.galaxy VALUES ('Thorious', 234, NULL, 12445, 'The other galaxy', false, 3);
INSERT INTO public.galaxy VALUES ('Soronto Goode', 45235, NULL, 35235234, 'named by Soronto G.', true, 4);
INSERT INTO public.galaxy VALUES ('LL-BNM', 12345, NULL, 35236467, 'what no one thinks exists', false, 5);
INSERT INTO public.galaxy VALUES ('Heroes-G', 5575, 12353, 67457432, 'For the Avenger heroes', true, 6);
INSERT INTO public.galaxy VALUES ('Flexed-01', 3523, 5313, 124145, 'the flexed galaxy', true, 7);
INSERT INTO public.galaxy VALUES ('Odesense', 823, 11243, 1121, 'The least known Spiral Galaxy', true, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon One', 232423, 352352, 'moon one', false, NULL, 1, 1);
INSERT INTO public.moon VALUES ('Moon Two', 12121, 12313, 'moon two', false, NULL, 2, 2);
INSERT INTO public.moon VALUES ('Moon Three', 45645, 2356366, 'moon three', false, NULL, 3, 3);
INSERT INTO public.moon VALUES ('Moon 04', 786, 99343, 'moon four', false, NULL, 4, 4);
INSERT INTO public.moon VALUES ('XG-45', 1223, 3435453, 'xg forty-five', false, NULL, 5, 5);
INSERT INTO public.moon VALUES ('Fire Duo', 1342, 353456, 'fire duo', false, NULL, 6, 6);
INSERT INTO public.moon VALUES ('Fire Trio', 342, 2421451, 'fire trio', false, NULL, 7, 7);
INSERT INTO public.moon VALUES ('Quad 2.0', 2423, 72352, 'quad two', false, NULL, 8, 8);
INSERT INTO public.moon VALUES ('Moon DL', 1221, 22313, 'unknown moon', false, NULL, 9, 9);
INSERT INTO public.moon VALUES ('SLG4J', 45245, 56366, 'slf4j', false, NULL, 10, 1);
INSERT INTO public.moon VALUES ('Log4j', 86, 19343, 'log4j', false, NULL, 11, 2);
INSERT INTO public.moon VALUES ('365', 12223, 435453, 'three sixty five', false, NULL, 12, 3);
INSERT INTO public.moon VALUES ('Xander M', 5642, 8456, 'xander m', false, NULL, 13, 21);
INSERT INTO public.moon VALUES ('FredGhun', 123, 21451, 'Fred Ghunner', false, NULL, 14, 22);
INSERT INTO public.moon VALUES ('Texas Alpha', 12323, 99352, 'texas alpha', false, NULL, 15, 4);
INSERT INTO public.moon VALUES ('Phantom C', 4788, 8233, 'phantom c', false, NULL, 16, 5);
INSERT INTO public.moon VALUES ('UIOP', 5535, 6366, 'uiop 2', false, NULL, 17, 6);
INSERT INTO public.moon VALUES ('Hanson Dolls', 2436, 1956343, 'hanson d', false, NULL, 18, 23);
INSERT INTO public.moon VALUES ('Kyanni', 423, 35453, 'kyanni s', false, NULL, 19, 7);
INSERT INTO public.moon VALUES ('Xander B', 2142, 1856, 'xander b', false, NULL, 20, 8);
INSERT INTO public.moon VALUES ('USA23', 23234, 214531, 'USA twenty  three', false, NULL, 21, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Sub-Earth', 214123, NULL, 'the small earth', false, NULL, 1, 2);
INSERT INTO public.planet VALUES ('Pluto-Res', 22131, NULL, 'pluto resurrected', false, NULL, 2, 1);
INSERT INTO public.planet VALUES ('Jupit-100', 4, NULL, 'that which looks like Jupiter', false, NULL, 3, 3);
INSERT INTO public.planet VALUES ('Als-Dein', 24242, NULL, 'some weird one there', false, NULL, 4, 4);
INSERT INTO public.planet VALUES ('Earthling', 122328, 56363632, 'looks like Earth', false, 35252352, 5, 2);
INSERT INTO public.planet VALUES ('Core-i9', 4454, 5653463, 'core i9', false, 234, 6, 3);
INSERT INTO public.planet VALUES ('Factor-E', 3535, 124124, 'factor e planet', false, 9786, 7, 4);
INSERT INTO public.planet VALUES ('Lifeless-P', 12243, 4352354, 'lifeless P', false, 8934, 8, 5);
INSERT INTO public.planet VALUES ('Alt-O', 334, 4562352, 'alt-o', false, 2123, 9, 6);
INSERT INTO public.planet VALUES ('Gooding', 52328, 63632, 'Goodin', false, 32352, 20, 7);
INSERT INTO public.planet VALUES ('Posper Alpha', 1454, 853463, 'alpha posper', false, 134, 21, 5);
INSERT INTO public.planet VALUES ('Elemento', 125, 4124, 'the elemented planet', false, 786, 22, 1);
INSERT INTO public.planet VALUES ('LifelessBP', 2243, 6354, 'lifelessBP', false, 934, 23, 6);
INSERT INTO public.planet VALUES ('Basic Lupre', 11334, 46352, 'basc lupre', false, 2123, 24, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Coolest', 12132, 4557099882, 'the coolest star', NULL, false, 1, 1);
INSERT INTO public.star VALUES ('SmallT2', 1218, 8731123, 'the smallest of earth', NULL, true, 3, 3);
INSERT INTO public.star VALUES ('BigSt', 3241, 23421141, 'biggest star of earth', 2, true, 2, 2);
INSERT INTO public.star VALUES ('AB-124', 4521, 45562, 'another cool star', NULL, true, 4, 2);
INSERT INTO public.star VALUES ('D-421', 711, 421141, 'dwarf star', NULL, false, 5, 1);
INSERT INTO public.star VALUES ('Unknown-S2', 24243, 32532535, 'the one the moon doesnt know', 1, false, 6, 4);
INSERT INTO public.star VALUES ('Odense Sub-01', 12, 1242414, 'Odense popular star', 2, false, 7, 3);


--
-- Name: creation_creation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creation_creation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: creation creation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creation
    ADD CONSTRAINT creation_name_key UNIQUE (name);


--
-- Name: creation creation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creation
    ADD CONSTRAINT creation_pkey PRIMARY KEY (creation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

