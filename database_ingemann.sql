--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-18 11:53:01

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
-- TOC entry 215 (class 1259 OID 16400)
-- Name: articulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulo (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(10,2) NOT NULL,
    costo numeric(10,2) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.articulo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: articulo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articulo_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 214
-- Name: articulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articulo_id_seq OWNED BY public.articulo.id;


--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre_cliente text NOT NULL,
    "contraseña" text NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16410)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 216
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 221 (class 1259 OID 16436)
-- Name: detalle_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_factura (
    id integer NOT NULL,
    id_factura integer NOT NULL,
    id_articulo integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.detalle_factura OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16435)
-- Name: detalle_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_factura_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 220
-- Name: detalle_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_factura_id_seq OWNED BY public.detalle_factura.id;


--
-- TOC entry 219 (class 1259 OID 16422)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16421)
-- Name: factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 218
-- Name: factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;


--
-- TOC entry 223 (class 1259 OID 16476)
-- Name: vw_detalle_factura; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_detalle_factura AS
 SELECT a.codigo,
    a.descripcion,
    a.costo,
    df.cantidad,
    df.id_factura
   FROM (public.detalle_factura df
     JOIN public.articulo a ON ((df.id_articulo = a.id)));


ALTER TABLE public.vw_detalle_factura OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16471)
-- Name: vw_factura; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_factura AS
SELECT
    NULL::integer AS id,
    NULL::character varying(10) AS codigo,
    NULL::date AS fecha,
    NULL::text AS nombre_cliente,
    NULL::numeric AS total;


ALTER TABLE public.vw_factura OWNER TO postgres;

--
-- TOC entry 3196 (class 2604 OID 16403)
-- Name: articulo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo ALTER COLUMN id SET DEFAULT nextval('public.articulo_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16414)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 16439)
-- Name: detalle_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura ALTER COLUMN id SET DEFAULT nextval('public.detalle_factura_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16425)
-- Name: factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);


--
-- TOC entry 3362 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: articulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articulo (id, codigo, descripcion, precio, costo, is_active) FROM stdin;
2	edgard	edgard	10.00	10.00	f
3	ABC1234	lapiz	18.82	53.13	t
5	ABC12345	lapiz	18.82	53.13	t
6	ABC123456	lapiz	18.82	53.13	t
1	123	test	1.00	20.00	t
\.


--
-- TOC entry 3364 (class 0 OID 16411)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre_cliente, "contraseña") FROM stdin;
1	Rafael	1234
2	Edgard	1234
\.


--
-- TOC entry 3368 (class 0 OID 16436)
-- Dependencies: 221
-- Data for Name: detalle_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_factura (id, id_factura, id_articulo, cantidad) FROM stdin;
1	1	1	34
2	1	1	12
3	1	2	3
4	1	3	2
5	2	1	12
6	2	2	3
7	3	1	10
8	6	1	1
9	6	2	2
10	8	1	1
11	8	2	2
\.


--
-- TOC entry 3366 (class 0 OID 16422)
-- Dependencies: 219
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id, codigo, fecha, id_cliente) FROM stdin;
1	abc	2022-12-16	1
2	tre	2022-12-17	2
3	pop	2022-12-17	1
6	ABC123456	2022-12-12	1
8	ABC123t6	2022-12-12	1
\.


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 214
-- Name: articulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articulo_id_seq', 6, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 216
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 2, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 220
-- Name: detalle_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_factura_id_seq', 11, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 218
-- Name: factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_seq', 8, true);


--
-- TOC entry 3201 (class 2606 OID 16407)
-- Name: articulo articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 16418)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16441)
-- Name: detalle_factura detalle_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16427)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16409)
-- Name: articulo uq_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT uq_codigo UNIQUE (codigo);


--
-- TOC entry 3211 (class 2606 OID 16429)
-- Name: factura uq_codigo_factura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT uq_codigo_factura UNIQUE (codigo);


--
-- TOC entry 3207 (class 2606 OID 16420)
-- Name: cliente uq_nombre_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uq_nombre_cliente UNIQUE (nombre_cliente);


--
-- TOC entry 3359 (class 2618 OID 16474)
-- Name: vw_factura _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.vw_factura AS
 SELECT f.id,
    f.codigo,
    f.fecha,
    c.nombre_cliente,
    sum(((df.cantidad)::numeric * a.costo)) AS total
   FROM (((public.factura f
     JOIN public.cliente c ON ((f.id_cliente = c.id)))
     JOIN public.detalle_factura df ON ((df.id_factura = f.id)))
     JOIN public.articulo a ON ((a.id = df.id_articulo)))
  GROUP BY f.id, c.id;


--
-- TOC entry 3215 (class 2606 OID 16447)
-- Name: detalle_factura fk_id_articulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_id_articulo FOREIGN KEY (id_articulo) REFERENCES public.articulo(id);


--
-- TOC entry 3214 (class 2606 OID 16430)
-- Name: factura fk_id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- TOC entry 3216 (class 2606 OID 16442)
-- Name: detalle_factura fk_id_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_id_factura FOREIGN KEY (id_factura) REFERENCES public.factura(id);


-- Completed on 2022-12-18 11:53:01

--
-- PostgreSQL database dump complete
--

