CREATE TABLE oficina (
  codigo_oficina TEXT NOT NULL,
  ciudad TEXT NOT NULL,
  pais TEXT NOT NULL,
  region TEXT DEFAULT NULL,
  codigo_postal TEXT NOT NULL,
  telefono TEXT NOT NULL,
  linea_direccion1 TEXT NOT NULL,
  linea_direccion2 TEXT DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  apellido1 TEXT NOT NULL,
  apellido2 TEXT DEFAULT NULL,
  extension TEXT NOT NULL,
  email TEXT NOT NULL,
  codigo_oficina TEXT NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto TEXT DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama TEXT NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen TEXT,
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente TEXT NOT NULL,
  nombre_contacto TEXT DEFAULT NULL,
  apellido_contacto TEXT DEFAULT NULL,
  telefono TEXT NOT NULL,
  fax TEXT NOT NULL,
  linea_direccion1 TEXT NOT NULL,
  linea_direccion2 TEXT DEFAULT NULL,
  ciudad TEXT NOT NULL,
  region TEXT DEFAULT NULL,
  pais TEXT DEFAULT NULL,
  codigo_postal TEXT DEFAULT NULL,
  codigo_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito REAL DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado TEXT NOT NULL,
  comentarios TEXT,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto TEXT NOT NULL,
  nombre TEXT NOT NULL,
  gama TEXT NOT NULL,
  dimensiones TEXT NULL,
  proveedor TEXT DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta REAL NOT NULL,
  precio_proveedor REAL DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto TEXT NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad REAL NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago TEXT NOT NULL,
  id_transaccion TEXT NOT NULL,
  fecha_pago date NOT NULL,
  total REAL NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);