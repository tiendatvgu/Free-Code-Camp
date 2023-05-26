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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_year integer,
    galaxy_type text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: other_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_info (
    other_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    additional_info text NOT NULL,
    is_verified boolean NOT NULL,
    name character varying(30)
);


ALTER TABLE public.other_info OWNER TO freecodecamp;

--
-- Name: other_info_other_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_info_other_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_info_other_info_id_seq OWNER TO freecodecamp;

--
-- Name: other_info_other_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_info_other_info_id_seq OWNED BY public.other_info.other_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    distance_from_earth numeric,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_year integer,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: other_info other_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_info ALTER COLUMN other_info_id SET DEFAULT nextval('public.other_info_other_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 12000, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (5, 'Sombero', 9000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 6000, 'Elliptical', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 1, 'The Earth''s only natural satellite', true);
INSERT INTO public.moon VALUES (2, 'Moon 2', 1, 'A celestial object that orbits a planet', true);
INSERT INTO public.moon VALUES (3, 'Moon 3', 2, 'A rocky body in space', true);
INSERT INTO public.moon VALUES (4, 'Moon 4', 2, 'Visible from Earth with the naked eye', true);
INSERT INTO public.moon VALUES (5, 'Moon 5', 3, 'Contains various impact craters', true);
INSERT INTO public.moon VALUES (6, 'Moon 6', 3, 'Regarded as the brightest object in the night sky', true);
INSERT INTO public.moon VALUES (7, 'Moon 7', 4, 'Known for its volcanic activity', true);
INSERT INTO public.moon VALUES (8, 'Moon 8', 4, 'Has a complex system of rings', false);
INSERT INTO public.moon VALUES (9, 'Moon 9', 5, 'Possesses a thick atmosphere', true);
INSERT INTO public.moon VALUES (10, 'Moon 10', 5, 'Covered in layers of ice', true);
INSERT INTO public.moon VALUES (11, 'Moon 11', 6, 'Contains the largest volcano in the solar system', true);
INSERT INTO public.moon VALUES (12, 'Moon 12', 6, 'Characterized by its reddish appearance', true);
INSERT INTO public.moon VALUES (13, 'Moon 13', 7, 'Composed of highly reflective material', true);
INSERT INTO public.moon VALUES (14, 'Moon 14', 7, 'Exhibits synchronous rotation with its planet', true);
INSERT INTO public.moon VALUES (15, 'Moon 15', 8, 'Known for its extreme axial tilt', true);
INSERT INTO public.moon VALUES (16, 'Moon 16', 8, 'Possibly harboring subsurface oceans', true);
INSERT INTO public.moon VALUES (17, 'Moon 17', 9, 'Discovered by the Kepler spacecraft', true);
INSERT INTO public.moon VALUES (18, 'Moon 18', 9, 'Located within the habitable zone', true);
INSERT INTO public.moon VALUES (19, 'Moon 19', 10, 'Receives less sunlight due to its orbit', true);
INSERT INTO public.moon VALUES (20, 'Moon 20', 10, 'Subject to intense gravitational forces', true);


--
-- Data for Name: other_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_info VALUES (1, 1, 1, 'Additional information about Earth in Milky Way', true, NULL);
INSERT INTO public.other_info VALUES (2, 2, 1, 'Additional information about Mars in Milky Way', true, NULL);
INSERT INTO public.other_info VALUES (3, 3, 2, 'Additional information about Venus in Andromeda', false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 0, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 78.3, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 67.2, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 425.6, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 838.7, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 2790.2, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 57.9, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 2871.0, false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 3, 500.0, true);
INSERT INTO public.planet VALUES (10, 'Gliese 581d', 2, 20.4, false);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 5, 1400.0, false);
INSERT INTO public.planet VALUES (12, 'Proxima b', 6, 4.2, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 6500, true);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 4000, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8000, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 5000, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4000, false);


--
-- Name: other_info_other_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_info_other_info_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_info other_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_info
    ADD CONSTRAINT other_info_pkey PRIMARY KEY (other_info_id);


--
-- Name: other_info other_info_planet_id_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_info
    ADD CONSTRAINT other_info_planet_id_galaxy_id_key UNIQUE (planet_id, galaxy_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

