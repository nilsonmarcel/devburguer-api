--
-- PostgreSQL database dump
--

\restrict 3d92BotQiqmHdOjRgJYXeoCY6ZzBWCQwyuu8BxESQm4U8s5KH5CUNTYgKp8eDft

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg13+1)
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    path character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    price integer NOT NULL,
    path character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    offer boolean DEFAULT false NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    admin boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20260506163510-create-users-table.cjs
20260507144937-create-products-table.cjs
20260513122246-create-categories-table.cjs
20260513135546-remove-category-column-from-product.cjs
20260513141927-add-column-category-id-to-product.cjs
20260513171648-include-offer-in-products.cjs
20260515122910-include-path-to-categories.cjs
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at, path) FROM stdin;
1	Entradas	2026-06-22 14:42:48.394+00	2026-06-22 14:42:48.394+00	84671085-60a7-4afa-8833-5d33484df1eecategory_1.png
2	Hambúrgueres	2026-06-22 14:42:49.191+00	2026-06-22 14:42:49.191+00	38439dff-3349-42ec-bbee-321258e9930acategory_2.png
3	Bebidas	2026-06-22 14:42:49.394+00	2026-06-22 14:42:49.394+00	7136d85c-da5a-46d1-b376-c7c027d23ad3category_3.png
4	Sobremesas	2026-06-22 14:42:49.816+00	2026-06-22 14:42:49.816+00	b89d17db-a058-4f2e-97a9-a71af45a0ae6category_4.png
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, path, created_at, updated_at, category_id, offer) FROM stdin;
1	Saladas	2590	e748410a-dc38-49ff-b599-e333cc342e3dappe_1.png	2026-06-22 14:42:50.209+00	2026-06-22 14:42:50.209+00	3	t
2	Bruschettas	3590	a24a863c-5da1-4264-88e6-7df12c4b7812appe_2.png	2026-06-22 14:42:50.485+00	2026-06-22 14:42:50.485+00	3	f
3	Carpaccios	3990	1b0a55dc-d43f-47f2-8732-f781b3705eeaappe_3.png	2026-06-22 14:42:50.897+00	2026-06-22 14:42:50.897+00	3	t
4	Ceviches	4500	b1b346fa-3ec3-4e85-8adc-7baa4e3d2af7appe_4.png	2026-06-22 14:42:51.077+00	2026-06-22 14:42:51.077+00	3	f
5	Tábua de Queijos e Frios	6990	8fea95ec-7c05-4fd8-ae9f-d0e76a885cf8appe_5.png	2026-06-22 14:42:51.154+00	2026-06-22 14:42:51.154+00	3	t
6	Croquetes	2390	09e81b85-381c-4a79-826c-b51c73160fafappe_6.png	2026-06-22 14:42:51.264+00	2026-06-22 14:42:51.264+00	3	f
7	Pastéis	3590	925ce805-f85e-49d4-9675-f9e8cda1351aappe_7.png	2026-06-22 14:42:51.355+00	2026-06-22 14:42:51.355+00	3	t
8	Tartines	2590	239887ac-9ca2-47c2-9a8f-b393f01ccfcfappe_8.png	2026-06-22 14:42:51.649+00	2026-06-22 14:42:51.649+00	3	f
9	Bolinhos de Bacalhau	4590	61905c4c-06d2-496b-b772-6c610c8b889dappe_9.png	2026-06-22 14:42:51.835+00	2026-06-22 14:42:51.835+00	3	f
10	X-Tudo Duplo Frango	2990	81eb9eae-7c15-43d9-96c2-af8788091915burger_1.png	2026-06-22 14:42:51.939+00	2026-06-22 14:42:51.939+00	4	t
11	X-Bacon com Ovo	3590	0c1e188a-509f-41aa-a721-f4739dd7fe17burger_2.png	2026-06-22 14:42:52.207+00	2026-06-22 14:42:52.207+00	4	f
12	Duplo X-Salada Picante	3490	1fc61d4d-7213-428e-9e74-4f25a3955ec2burger_3.png	2026-06-22 14:42:52.368+00	2026-06-22 14:42:52.368+00	4	t
13	X-Salada	3190	c4622c78-4e82-42ab-8405-f55e8c758f56burger_4.png	2026-06-22 14:42:52.486+00	2026-06-22 14:42:52.486+00	4	f
14	X-Especial da casa com Nuggets	3690	207d7e2e-0579-409b-b587-e360768f4c5dburger_5.png	2026-06-22 14:42:53.236+00	2026-06-22 14:42:53.236+00	4	t
15	Duplo X-salada com molho especial	3890	fb22fe0d-1c62-417f-807a-167178d58f1eburger_6.png	2026-06-22 14:42:53.378+00	2026-06-22 14:42:53.378+00	4	f
16	X-Tudo Duplo Frango	3490	d10e98e2-3335-47ac-8bfe-307b3266f7f5burger_7.png	2026-06-22 14:42:53.569+00	2026-06-22 14:42:53.569+00	4	t
17	X- Bacon com molho da casa	3690	2e8a6cd3-6fa1-49ea-909a-7b79be46d446burger_8.png	2026-06-22 14:42:53.732+00	2026-06-22 14:42:53.732+00	4	f
18	Duplo X-Salada Picante	3690	0ec1245f-cf74-4ff5-96d8-941b843723d7burger_9.png	2026-06-22 14:42:53.932+00	2026-06-22 14:42:53.932+00	4	f
19	Refrigerantes	590	c03b6587-c447-4acc-bca2-3d82fbbdf6fedrink_1.png	2026-06-22 14:42:54.127+00	2026-06-22 14:42:54.127+00	4	t
20	Água com Gás	490	7af6e4ee-bbab-4a53-9110-0669dabd1c87drink_2.png	2026-06-22 14:42:55.148+00	2026-06-22 14:42:55.148+00	4	f
21	Sucos Naturais	1190	0f2a18a7-ec21-4b24-9b4b-7b5b1e82b186drink_3.png	2026-06-22 14:42:55.732+00	2026-06-22 14:42:55.732+00	4	t
22	Café Espresso	790	d83fc093-f976-4946-91b8-ab8f013494a6drink_4.png	2026-06-22 14:42:56.061+00	2026-06-22 14:42:56.061+00	4	f
23	Chás	590	3f68c388-9ded-418c-b0fe-21f8835bc4cfdrink_5.png	2026-06-22 14:42:56.417+00	2026-06-22 14:42:56.417+00	4	t
24	Bebidas Lácteas	1590	1dbd14d2-7c08-40e1-9c6d-e770c67dc1c1drink_6.png	2026-06-22 14:42:57.098+00	2026-06-22 14:42:57.098+00	4	f
25	Coquetéis	2390	d67c019b-1ed8-4079-9fd8-67d43f9b2e84drink_7.png	2026-06-22 14:42:57.188+00	2026-06-22 14:42:57.188+00	4	t
26	Bebidas Alcoólicas	2690	a68f7239-60da-4fdb-94f2-3bc176760814drink_8.png	2026-06-22 14:42:57.508+00	2026-06-22 14:42:57.508+00	4	f
27	Energéticos	1390	4a60b0f8-d4dd-4123-a710-342d081ff9c1drink_9.png	2026-06-22 14:42:58.521+00	2026-06-22 14:42:58.521+00	4	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password_hash, admin, created_at, updated_at) FROM stdin;
03405087-09cf-4a06-a58e-066e81fb14ad	Charlene	charlene@gmail.com	$2b$10$QiqStkbSeweGP4Cy8NpT..UStbn3CnkK54d6L7i.M1sGsiQYpZv4C	t	2026-06-19 18:50:47.954+00	2026-06-19 18:50:47.954+00
aa595b78-a3a3-4054-9941-0ba2804e0bda	Márcia	marcia@gmail.com	$2b$10$4oG60vEqMs78hE0axm1pvOEBUivRWypAzqQvLfwV.bjpWVKhUXGae	f	2026-06-22 14:50:06.666+00	2026-06-22 14:50:06.666+00
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 28, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 3d92BotQiqmHdOjRgJYXeoCY6ZzBWCQwyuu8BxESQm4U8s5KH5CUNTYgKp8eDft

