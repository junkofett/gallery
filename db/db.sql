drop table if exists usuarios cascade;

create table usuarios(
  id                bigserial     constraint pk_usuarios primary key,
  nick              varchar(50)   not null constraint uq_usuarios_nick unique,
  pass              varchar(32)   not null,
  email             varchar(100)  not null,
  descripcion_usr   text          ,
  fecha_nac         date          not null,
  fecha_reg         date          not null default current_date             
);

drop table if exists seguidores cascade;

create table seguidores(
  usuarios_id     bigint  constraint fk_seguidores_usuarios_id
                            references usuarios(id) on delete no action
                            on update cascade,
  seguidores_id   bigint  constraint fk_seguidores_seguidores_id
                            references usuarios(id) on delete no action
                            on update cascade,

  constraint pk_seguidores primary key (usuarios_id, seguidores_id)
);

drop table if exists fotos cascade;

create table fotos(
  id            bigserial     constraint pk_fotos primary key,
  foto_url      varchar(200)  not null,
  usuarios_id   bigint        constraint fk_fotos_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade
);

drop table if exists fondos cascade;

create table fondos(
  id            bigserial     constraint pk_fondos primary key,
  fondo_url     varchar(200)  not null,
  usuarios_id   bigint        constraint fk_fotos_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade
);

drop table if exists etiquetas cascade;

create table etiquetas(
  id          bigserial       constraint pk_etiquetas primary key,
  nombre_et   varchar(24)     not null 
                              constraint uq_etiqetas_nombre_et unique
);

drop table if exists categorias cascade;

create table categorias(
  id            bigserial     constraint pk_categorias primary key,
  nombre_cat    varchar(50)   not null,
  padre_id      bigint        constraint fk_categorias_padre_id
                                  references categorias(id) on delete no action
                                  on update cascade
);

drop table if exists imagenes cascade;

create table imagenes(
  id                bigserial     constraint pk_imagenes primary key,
  titulo            varchar(100)  ,
  img_url           text          not null,
  thumb_url         text          not null,
  usuarios_id       bigint        constraint fk_imagenes_usuarios_id
                                      references usuarios(id) on delete no action
                                      on update cascade,
  categorias_id     bigint        constraint fk_imagenes_categorias_is
                                      references categorias(id) on delete no action
                                      on update cascade,
  descripcion_img   text          ,
  fecha_subida      timestamp     default current_timestamp,
  nsfw              boolean       not null default FALSE
);

drop table if exists comentarios cascade;

create table comentarios(
  id            bigserial     constraint pk_comentarios primary key,
  usuarios_id   bigint        constraint fk_comentarios_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade,
  imagenes_id   bigint        constraint fk_imagenes_imagenes_id
                                  references imagenes(id) on delete no action
                                  on update cascade,
  texto         text          not null
);

drop table if exists notificaciones cascade;

create table notificaciones(
  id            bigserial     constraint pk_notificaciones primary key,
  usuarios_id   bigint        constraint fk_notificaciones_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade,
  texto         varchar(200)  not null,
  notif_url     varchar(200)  not null
);

drop table if exists puntuaciones cascade;

create table puntuaciones(
  usuarios_id   bigint        constraint fk_puntuaciones_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade,
  imagenes_id   bigint        constraint fk_puntuaciones_imagenes_id
                                  references imagenes(id) on delete no action
                                  on update cascade,
  valoracion    numeric(1)    not null,

  constraint pk_puntuaciones primary key (usuarios_id, imagenes_id)
);

drop table if exists carpetas_usuarios cascade;

create table carpetas_usuarios(
  id            bigserial     constraint pk_carpetas_usuarios primary key,
  carpeta_nom   varchar(50)   not null,
  usuarios_id   bigint        constraint fk_carpetas_usuarios_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade,
  padre_id      bigint        constraint fk_carpetas_usuarios_padre_id
                                  references carpetas_usuarios(id) 
                                  on delete no action
                                  on update cascade
);

drop table if exists favoritos cascade;

create table favoritos(
  usuarios_id   bigint        constraint fk_favoritos_usuarios_id
                                  references usuarios(id) on delete no action
                                  on update cascade,
  imagenes_id   bigint        constraint fk_favoritos_imagenes_id
                                  references imagenes(id) on delete no action
                                  on update cascade,
  carpeta_id    bigint        constraint fk_favoritos_carpeta_id
                                  references carpetas_usuarios(id) 
                                  on delete no action
                                  on update cascade
);

drop table if exists imgs_etiquetas cascade;

create table imgs_etiquetas(
  imagenes_id   bigint        constraint fk_imgs_etiquetas_imagenes_id
                                  references imagenes(id) on delete no action
                                  on update cascade,
  etiquetas_id  bigint        constraint fk_imgs_etiquetas_etiquetas_id
                                  references etiquetas(id) on delete no action
                                  on update cascade
);

drop table if exists ci_sessions cascade;

create table ci_sessions (
  session_id    varchar(40)  not null default '0',
  ip_address    varchar(45)  not null default '0',
  user_agent    varchar(120) not null,
  last_activity numeric(10)  not null default 0,
  user_data     text         not null,
  constraint pk_ci_sessions primary key (session_id)
);

create index last_activity_idx on ci_sessions (last_activity);