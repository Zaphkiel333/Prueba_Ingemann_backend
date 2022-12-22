CREATE DATABASE ingemann;


CREATE TABLE public.articulo (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(10,2) NOT NULL,
    costo numeric(10,2) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.articulo OWNER TO postgres;

CREATE SEQUENCE public.articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articulo_id_seq OWNER TO postgres;

ALTER SEQUENCE public.articulo_id_seq OWNED BY public.articulo.id;

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre_cliente text NOT NULL,
    "contraseña" text NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;

CREATE TABLE public.detalle_factura (
    id integer NOT NULL,
    id_factura integer NOT NULL,
    id_articulo integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.detalle_factura OWNER TO postgres;

CREATE SEQUENCE public.detalle_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_factura_id_seq OWNER TO postgres;


ALTER SEQUENCE public.detalle_factura_id_seq OWNED BY public.detalle_factura.id;


CREATE TABLE public.factura (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_id_seq OWNER TO postgres;



ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;

CREATE VIEW public.vw_detalle_factura AS
 SELECT a.codigo,
    a.descripcion,
    a.costo,
    df.cantidad,
    df.id_factura
   FROM (public.detalle_factura df
     JOIN public.articulo a ON ((df.id_articulo = a.id)));


ALTER TABLE public.vw_detalle_factura OWNER TO postgres;

CREATE VIEW public.vw_factura AS
SELECT
    NULL::integer AS id,
    NULL::character varying(10) AS codigo,
    NULL::date AS fecha,
    NULL::text AS nombre_cliente,
    NULL::numeric AS total;


ALTER TABLE public.vw_factura OWNER TO postgres;

ALTER TABLE ONLY public.articulo ALTER COLUMN id SET DEFAULT nextval('public.articulo_id_seq'::regclass);


ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


ALTER TABLE ONLY public.detalle_factura ALTER COLUMN id SET DEFAULT nextval('public.detalle_factura_id_seq'::regclass);


ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);



ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT uq_codigo UNIQUE (codigo);


ALTER TABLE ONLY public.factura
    ADD CONSTRAINT uq_codigo_factura UNIQUE (codigo);


ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uq_nombre_cliente UNIQUE (nombre_cliente);


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


ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_id_articulo FOREIGN KEY (id_articulo) REFERENCES public.articulo(id);


ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_id_factura FOREIGN KEY (id_factura) REFERENCES public.factura(id);

