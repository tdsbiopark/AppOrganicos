PGDMP         %                 y            dbOrganicosApp    12.3    12.3 Y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41631    dbOrganicosApp    DATABASE     �   CREATE DATABASE "dbOrganicosApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
     DROP DATABASE "dbOrganicosApp";
                postgres    false            �           0    0    DATABASE "dbOrganicosApp"    COMMENT     D   COMMENT ON DATABASE "dbOrganicosApp" IS 'DB organicos App Flutter';
                   postgres    false    2961            �            1259    41672    certificadora    TABLE     �   CREATE TABLE public.certificadora (
    id integer NOT NULL,
    nome character varying(50),
    registro_ativo boolean DEFAULT true
);
 !   DROP TABLE public.certificadora;
       public         heap    postgres    false            �            1259    41670    certificadora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.certificadora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.certificadora_id_seq;
       public          postgres    false    209            �           0    0    certificadora_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.certificadora_id_seq OWNED BY public.certificadora.id;
          public          postgres    false    208            �            1259    41637    cidade    TABLE     o   CREATE TABLE public.cidade (
    id integer NOT NULL,
    nome character varying(50),
    estado_id integer
);
    DROP TABLE public.cidade;
       public         heap    postgres    false            �            1259    41790    endereco    TABLE       CREATE TABLE public.endereco (
    id integer NOT NULL,
    cidade_id integer NOT NULL,
    bairro character varying(50),
    rua character varying(100),
    numero character varying(10),
    latitude character varying(20),
    longitude character varying(20),
    ativo boolean
);
    DROP TABLE public.endereco;
       public         heap    postgres    false            �            1259    41788    endereco_id_seq    SEQUENCE     x   CREATE SEQUENCE public.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public          postgres    false    222            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;
          public          postgres    false    221            �            1259    41632    estado    TABLE     x   CREATE TABLE public.estado (
    id integer NOT NULL,
    nome character varying(50),
    sigla character varying(2)
);
    DROP TABLE public.estado;
       public         heap    postgres    false            �            1259    41681    grupo    TABLE     p  CREATE TABLE public.grupo (
    id integer NOT NULL,
    nome character varying(50),
    endereco character varying(80),
    numero integer,
    bairro character varying(50),
    cidade_id integer,
    cnpj character varying(14),
    inscricao_estadual character varying(20),
    distribuidor_produtos boolean DEFAULT false,
    registro_ativo boolean DEFAULT true
);
    DROP TABLE public.grupo;
       public         heap    postgres    false            �            1259    41679    grupo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grupo_id_seq;
       public          postgres    false    211            �           0    0    grupo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;
          public          postgres    false    210            �            1259    41757 	   permissao    TABLE     \   CREATE TABLE public.permissao (
    id integer NOT NULL,
    nome character varying(100)
);
    DROP TABLE public.permissao;
       public         heap    postgres    false            �            1259    41771    permissao_usuario    TABLE     �   CREATE TABLE public.permissao_usuario (
    usuario_id integer NOT NULL,
    permissao_id integer NOT NULL,
    permitido boolean DEFAULT true
);
 %   DROP TABLE public.permissao_usuario;
       public         heap    postgres    false            �            1259    41696 
   pontovenda    TABLE     �   CREATE TABLE public.pontovenda (
    id integer NOT NULL,
    nome character varying(50),
    endereco character varying(80),
    numero integer,
    bairro character varying(50),
    cidade_id integer,
    registro_ativo boolean DEFAULT true
);
    DROP TABLE public.pontovenda;
       public         heap    postgres    false            �            1259    41694    pontovenda_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pontovenda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.pontovenda_id_seq;
       public          postgres    false    213            �           0    0    pontovenda_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.pontovenda_id_seq OWNED BY public.pontovenda.id;
          public          postgres    false    212            �            1259    41658    produto    TABLE       CREATE TABLE public.produto (
    id integer NOT NULL,
    tipoproduto_id integer,
    nome character varying(50),
    descricao character varying(150),
    preco_unitario numeric(14,5),
    unidade character varying(3),
    registro_ativo boolean DEFAULT true
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    41656    produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produto_id_seq;
       public          postgres    false    207            �           0    0    produto_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;
          public          postgres    false    206            �            1259    41710    produtor    TABLE     �  CREATE TABLE public.produtor (
    id integer NOT NULL,
    certificadora_id integer,
    grupo_id integer,
    nome character varying(80),
    nome_propriedade character varying(80),
    cpf_cnpj character varying(14),
    telefone character varying(20),
    certificacao_organicos character varying(1),
    venda_consumidorfinal boolean DEFAULT false,
    registro_ativo boolean DEFAULT true,
    endereco_id integer DEFAULT 0
);
    DROP TABLE public.produtor;
       public         heap    postgres    false            �            1259    41708    produtor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produtor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produtor_id_seq;
       public          postgres    false    215            �           0    0    produtor_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produtor_id_seq OWNED BY public.produtor.id;
          public          postgres    false    214            �            1259    41735    produtor_produto    TABLE     �   CREATE TABLE public.produtor_produto (
    id integer NOT NULL,
    produtor_id integer,
    produto_id integer,
    pontovenda_id integer,
    dia_semana integer,
    horario time without time zone,
    pausado boolean DEFAULT false
);
 $   DROP TABLE public.produtor_produto;
       public         heap    postgres    false            �            1259    41733    produtor_produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produtor_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtor_produto_id_seq;
       public          postgres    false    217            �           0    0    produtor_produto_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtor_produto_id_seq OWNED BY public.produtor_produto.id;
          public          postgres    false    216            �            1259    41649    tipoproduto    TABLE     �   CREATE TABLE public.tipoproduto (
    id integer NOT NULL,
    nome character varying(50),
    registro_ativo boolean DEFAULT true
);
    DROP TABLE public.tipoproduto;
       public         heap    postgres    false            �            1259    41647    tipoproduto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoproduto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipoproduto_id_seq;
       public          postgres    false    205            �           0    0    tipoproduto_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tipoproduto_id_seq OWNED BY public.tipoproduto.id;
          public          postgres    false    204            �            1259    41762    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(50),
    login character varying(50),
    senha text,
    registro_ativo boolean DEFAULT true
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �
           2604    41675    certificadora id    DEFAULT     t   ALTER TABLE ONLY public.certificadora ALTER COLUMN id SET DEFAULT nextval('public.certificadora_id_seq'::regclass);
 ?   ALTER TABLE public.certificadora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    41793    endereco id    DEFAULT     j   ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �
           2604    41684    grupo id    DEFAULT     d   ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);
 7   ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �
           2604    41699    pontovenda id    DEFAULT     n   ALTER TABLE ONLY public.pontovenda ALTER COLUMN id SET DEFAULT nextval('public.pontovenda_id_seq'::regclass);
 <   ALTER TABLE public.pontovenda ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    41661 
   produto id    DEFAULT     h   ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);
 9   ALTER TABLE public.produto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    41713    produtor id    DEFAULT     j   ALTER TABLE ONLY public.produtor ALTER COLUMN id SET DEFAULT nextval('public.produtor_id_seq'::regclass);
 :   ALTER TABLE public.produtor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �
           2604    41738    produtor_produto id    DEFAULT     z   ALTER TABLE ONLY public.produtor_produto ALTER COLUMN id SET DEFAULT nextval('public.produtor_produto_id_seq'::regclass);
 B   ALTER TABLE public.produtor_produto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �
           2604    41652    tipoproduto id    DEFAULT     p   ALTER TABLE ONLY public.tipoproduto ALTER COLUMN id SET DEFAULT nextval('public.tipoproduto_id_seq'::regclass);
 =   ALTER TABLE public.tipoproduto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            ~          0    41672    certificadora 
   TABLE DATA                 public          postgres    false    209   �e       x          0    41637    cidade 
   TABLE DATA                 public          postgres    false    203   �e       �          0    41790    endereco 
   TABLE DATA                 public          postgres    false    222   n-      w          0    41632    estado 
   TABLE DATA                 public          postgres    false    202   �-      �          0    41681    grupo 
   TABLE DATA                 public          postgres    false    211   O/      �          0    41757 	   permissao 
   TABLE DATA                 public          postgres    false    218   i/      �          0    41771    permissao_usuario 
   TABLE DATA                 public          postgres    false    220   �/      �          0    41696 
   pontovenda 
   TABLE DATA                 public          postgres    false    213   �/      |          0    41658    produto 
   TABLE DATA                 public          postgres    false    207   �/      �          0    41710    produtor 
   TABLE DATA                 public          postgres    false    215   (0      �          0    41735    produtor_produto 
   TABLE DATA                 public          postgres    false    217   B0      z          0    41649    tipoproduto 
   TABLE DATA                 public          postgres    false    205   \0      �          0    41762    usuario 
   TABLE DATA                 public          postgres    false    219   �0      �           0    0    certificadora_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.certificadora_id_seq', 1, false);
          public          postgres    false    208            �           0    0    endereco_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.endereco_id_seq', 1, false);
          public          postgres    false    221            �           0    0    grupo_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grupo_id_seq', 1, false);
          public          postgres    false    210            �           0    0    pontovenda_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.pontovenda_id_seq', 1, false);
          public          postgres    false    212            �           0    0    produto_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.produto_id_seq', 2, true);
          public          postgres    false    206            �           0    0    produtor_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.produtor_id_seq', 1, false);
          public          postgres    false    214            �           0    0    produtor_produto_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.produtor_produto_id_seq', 1, false);
          public          postgres    false    216            �           0    0    tipoproduto_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipoproduto_id_seq', 6, true);
          public          postgres    false    204            �
           2606    41678     certificadora certificadora_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.certificadora
    ADD CONSTRAINT certificadora_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.certificadora DROP CONSTRAINT certificadora_pkey;
       public            postgres    false    209            �
           2606    41641    cidade cidade_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cidade DROP CONSTRAINT cidade_pkey;
       public            postgres    false    203            �
           2606    41795    endereco endereco_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pk;
       public            postgres    false    222            �
           2606    41636    estado estado_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    202            �
           2606    41688    grupo grupo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
       public            postgres    false    211            �
           2606    41761    permissao permissao_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.permissao DROP CONSTRAINT permissao_pkey;
       public            postgres    false    218            �
           2606    41776 (   permissao_usuario permissao_usuario_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.permissao_usuario
    ADD CONSTRAINT permissao_usuario_pkey PRIMARY KEY (usuario_id, permissao_id);
 R   ALTER TABLE ONLY public.permissao_usuario DROP CONSTRAINT permissao_usuario_pkey;
       public            postgres    false    220    220            �
           2606    41702    pontovenda pontovenda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pontovenda
    ADD CONSTRAINT pontovenda_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.pontovenda DROP CONSTRAINT pontovenda_pkey;
       public            postgres    false    213            �
           2606    41664    produto produto_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    207            �
           2606    41717    produtor produtor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.produtor
    ADD CONSTRAINT produtor_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.produtor DROP CONSTRAINT produtor_pkey;
       public            postgres    false    215            �
           2606    41741 &   produtor_produto produtor_produto_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.produtor_produto
    ADD CONSTRAINT produtor_produto_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.produtor_produto DROP CONSTRAINT produtor_produto_pkey;
       public            postgres    false    217            �
           2606    41655    tipoproduto tipoproduto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipoproduto
    ADD CONSTRAINT tipoproduto_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipoproduto DROP CONSTRAINT tipoproduto_pkey;
       public            postgres    false    205            �
           2606    41770    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    219            �
           2606    41796    endereco cidade_endereco_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT cidade_endereco_fk FOREIGN KEY (cidade_id) REFERENCES public.cidade(id);
 E   ALTER TABLE ONLY public.endereco DROP CONSTRAINT cidade_endereco_fk;
       public          postgres    false    222    2773    203            �
           2606    41642    cidade cidade_estado_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 F   ALTER TABLE ONLY public.cidade DROP CONSTRAINT cidade_estado_id_fkey;
       public          postgres    false    2771    203    202            �
           2606    41689    grupo grupo_cidade_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidade(id);
 D   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_cidade_id_fkey;
       public          postgres    false    203    211    2773            �
           2606    41782 5   permissao_usuario permissao_usuario_permissao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissao_usuario
    ADD CONSTRAINT permissao_usuario_permissao_id_fkey FOREIGN KEY (permissao_id) REFERENCES public.permissao(id);
 _   ALTER TABLE ONLY public.permissao_usuario DROP CONSTRAINT permissao_usuario_permissao_id_fkey;
       public          postgres    false    2789    220    218            �
           2606    41777 3   permissao_usuario permissao_usuario_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissao_usuario
    ADD CONSTRAINT permissao_usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 ]   ALTER TABLE ONLY public.permissao_usuario DROP CONSTRAINT permissao_usuario_usuario_id_fkey;
       public          postgres    false    220    2791    219            �
           2606    41703 $   pontovenda pontovenda_cidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pontovenda
    ADD CONSTRAINT pontovenda_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidade(id);
 N   ALTER TABLE ONLY public.pontovenda DROP CONSTRAINT pontovenda_cidade_id_fkey;
       public          postgres    false    213    203    2773            �
           2606    41665 #   produto produto_tipoproduto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_tipoproduto_id_fkey FOREIGN KEY (tipoproduto_id) REFERENCES public.tipoproduto(id);
 M   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_tipoproduto_id_fkey;
       public          postgres    false    207    205    2775            �
           2606    41718 '   produtor produtor_certificadora_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtor
    ADD CONSTRAINT produtor_certificadora_id_fkey FOREIGN KEY (certificadora_id) REFERENCES public.certificadora(id);
 Q   ALTER TABLE ONLY public.produtor DROP CONSTRAINT produtor_certificadora_id_fkey;
       public          postgres    false    215    2779    209            �
           2606    41806 "   produtor produtor_endereco_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtor
    ADD CONSTRAINT produtor_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES public.endereco(id) NOT VALID;
 L   ALTER TABLE ONLY public.produtor DROP CONSTRAINT produtor_endereco_id_fkey;
       public          postgres    false    2795    222    215            �
           2606    41723    produtor produtor_grupo_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.produtor
    ADD CONSTRAINT produtor_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES public.grupo(id);
 I   ALTER TABLE ONLY public.produtor DROP CONSTRAINT produtor_grupo_id_fkey;
       public          postgres    false    211    215    2781            �
           2606    41752 4   produtor_produto produtor_produto_pontovenda_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtor_produto
    ADD CONSTRAINT produtor_produto_pontovenda_id_fkey FOREIGN KEY (pontovenda_id) REFERENCES public.pontovenda(id);
 ^   ALTER TABLE ONLY public.produtor_produto DROP CONSTRAINT produtor_produto_pontovenda_id_fkey;
       public          postgres    false    2783    213    217            �
           2606    41747 1   produtor_produto produtor_produto_produto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtor_produto
    ADD CONSTRAINT produtor_produto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produto(id);
 [   ALTER TABLE ONLY public.produtor_produto DROP CONSTRAINT produtor_produto_produto_id_fkey;
       public          postgres    false    2777    217    207            �
           2606    41742 2   produtor_produto produtor_produto_produtor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtor_produto
    ADD CONSTRAINT produtor_produto_produtor_id_fkey FOREIGN KEY (produtor_id) REFERENCES public.produtor(id);
 \   ALTER TABLE ONLY public.produtor_produto DROP CONSTRAINT produtor_produto_produtor_id_fkey;
       public          postgres    false    2785    217    215            ~   
   x���          x      x���Ms�H�%��"w5�L=���Y�CRQCJ,���6��L($��Lp����[����^��̴�{7��?��IRc/�u[[��	8"<���x���������Ѧ��v�_vi�����寯?�����觓ES�������j4�����u����
n����ic���P!�o��"��������A���~1���$j���6��}l�Z갯7vg�f�g�o
{��3�;Ȼ�Y��Yc&c�r��nqti��78O�2U]��_����p�ЦXܙrt{gڵٵ͊� ^s]���R���v�xq���գ1�h�E7�a9���őn�ecWm����6,���T;3���F��mZ��Ǣ2˺�mm�6�2�{���,��}
ĺ vkӚ��k8L���f���tڿTY��q�L�]�F_���iR���=UK`āN�5������Δ����ͩi#߈8�{4�n�ÍdO���et%N\�[�a���]����qN�>�m��(��a]�p�x�i�p�P||Gܥ߾��Z[1�.�f�����@���[ِ�Q���zS�e�x.��9�)���z�[�t�2�rH0&��^��o � �T� ß$�rv����)G��Q�j�������O�;��-.�p�]��.��"�k���5���"�u"�Nݸ�x�#xNc���sG�5�E���|[���q�k��X��#�i,��Z��k�IiV5q��D�5�B��O�,����p[W8T�MY|���*���AZD��4t��#]�ͮp�e�rb񢋕[��!) MqoF���Z�EnU%V���ې|��������k2V|��N|%���{�;[��b2�1.pf�D��]�6��W��
�a|�>�uA<�w�;!%
����q�K���'���&~���;�z�sk�%9�6����Jq3�.6�غ�[S=�5�׮½=�0�`��,���΋���H�v^WK+l��h�EyG  w����
l�,;Z��s��U��ZbiN�;Vi#��K��a�n$��m����_;��=�X�3�"�2q@l!�x��"G�?���*Ǯs��)�XP�襕Zh C�V�0B�J���}(����_R&��m�h�@�8ֵ)]��Y��5�����ۭ�D���s]��O������^����νj攔O=l�z�!z�l����7?dZw�t�����,��.����\����B�v�{L,�W�n	���^uV���4�����mc���NƓ��93�C�C��|���b�]w֣o
�����	�ۊ�N&c�_�b���y��x�K��h(Ny�1M���}�XK߻���L�Yg��bc�b�b�q��������p��O�6��ī��z+�{
��� ���5��X�&`�a�ҝ!�� ~i��e6�	h�#�+=X�i�?0r�֘�?O@x���bn�vń2�x�Zb��<a�oZ;�v<�D�Z����h'���MN���<�}[�J̎>ْ!�&�o�In�qL@z�ZY���ˣ2���ɺ�}��,��������E�8����
K��_��I�2�j�B1�8'��c@q{N�x��#W���#� ��v�]�5��,���<��D������Vn��n�����e^��ڸ��]N�YS�7�S}:)��I�̙���7�BJ=�]97X30�~��0�U�o���"5;�do����<��*��ݪR�Ks��@(L�mڪ��8$���mBA��ˉ}tZ38񖷭�7�b���vm쎂��\l엶"������[�C �}�3���a&��{;�Q����8�w����f
R�i)P��0�8����y�|k����Y�/k	�/z��P��ǵ�g�(Y�E�0�i�IH���R���s�����څ�̫{-��чҝ҇ �A̝X� �"�)�����[ؚjg+�I�J��"���X�����Ul��K���?cK*;���K���拭��4sB�2�{;�����3~��筷f�X�I~,��ړ@~Î�_�������<�ɏ���T,R����R��Lb�>���A�l�8��->3�H�ۺ2���W�ƈo4��M���p�s�����Ao,P2�>� �l��������@P
��k���%��-3�L��t��EU8���N�=� M��He�|j(��I*Bj�=�{�4�iL
׍p���\�p�f�{Q(9k6R�B�����s9�P8Q#Y����a�)hn�\(]l��iڕ)ݩ:��LAnr�����ԛ���>��x{C���!W(���ܻ�c�\�ϲ�2]�0q��|�X(���$G���fYok����bQ`�Qm��A���znt[šL�\�%�LAN�մY)�
�����J+�˾�����މ�xۘ%s�D���%�rD�N��2\�9���T+��p�f�j��@3��q4p�}TJ`�{��Z�HʅZ�mj�\BA�����T(#eٻ�@��r?��]���%0�bֺ���en�N��CQ��*�Bqp��)��]�[{�ٺcg_�
��娂#
~�T�f��J<�<ӣr|w�t��>��w��]M����}U�GD<^��=��^0k�f�:`>��g*�>��N��*�u=���E���z�C���_n�jC��(׾	!����H�@��u�4��e>I��kCa����m���p�O���]�m��n�7 B�	gM�{T."�'Pӂb|��i-�(s��z����Oj���0�78i��)�B�CM��
���p(�'��p��]k�^ 
4��@���T�
��/�bM}ͥ"�1(븖b��h�W��.ԓy�8�Z�%'�-��W�m*��&^~�y�4�0M�~6n�n��L�߱��SM���d:_��8k�eTj�Qn�g��4�5��M}^�)_��$�Io�Mݬ��B��S����_�Tu%7�������QI��K*��&�R�z��\>�J��G�Z� �U[�2~W�.�^T�Kf��k6��H��ljC�g#m)M�e/S�9t���r�{p7N�<��,QS�"[2�W��6�e���\=i�{��C�]�7��BՓv|P��'1��<�nW�|VT�����1���0���
���/
T�P\�4����d���h��\>��w<k�k%�O�#�gFo�he6����[�`�f�����%l$/m5��ZI�
,�@B�S��\q;w��0�k6}V���<�[����:[��Z�Cq�n�vh���ߚ�*�ѻ�f�ת�5MQQ	��DlW�,�U�1�r8�h3�ݲ���� w<մ�hݐ�A}��w��|���BQQk��s+�/�\�d��K��ztj����f�*M�KYj�;���L����-~�a�3֯��{K���,�S�WܹX��2+����M�g��O��Eiݡ�)-��@c�n��L���ם%��L��9�	��X�]a�&3p�o�/�����B*��m�½s����6a������f ���g�"(�T&ĭ�J�(�A�;�1ǔ�췲�c_�.L,���D֝@M�,W�I;5{�G_Iy�[��n�}AP3�U�����Da5�P����Ei�]
�E���__��^�mD�g��\rx��W3�3��v����LQ����xڡ��P����ߨ\�L�@�Vt��+�=�%��ʂ�Kf�⼻t�聰d��vL����$===}��#�p�+��f�/V���1�����	w}Q����Ĳ 6Z$`��	�AG_l��)���X�W��v ꐖj3F��1���-�*���Gd>P��C�@B;�8�MA�� �/vR���_֡C=���Z�c�,}0T��<����١��$�u�9�²���mC$�g�o��ԙ��qK���}����O;<Ge�o�/�X�����%�~��3�{��̊�ds�7��+�u��a.�}gC�����`B�<�Pd(�{/ٸ��	��Ñ�P�݄[m����F:��]4���Ol�2�z4V?���K�ƅ5�Ly4V?���    X��u��
F��/ZK���wf^K�9ܕ�q/m�� ��W���;MT�έҤCN��a�<��>6��Έ�S��U	��U(���h�u�� �C��EK%ťF�~߹Մ
ң���kң������<���P\Fڌ����v���\��/�+(k'�{i>[�
s�;���O^uR�7L�A4U�{�^3Y2tZ^0�4ܭ�,����DG��׽t!�Ԫ$䛦�L�6�{)��?	r+�{i��h	-�dhR��>�#\Q���ڹ��c�^�ـ�Ui���V� FWfe�������"A� ͼ���+�W�=�+I�"me��9}E���/��� (�(Ҏv2ތ"mh����(��f>�,����q��(J(y0�[(^��&>ٝ��o��Sm-����<��- n6>Vde���ee���K�.l]!s9�X��Ļ�����(U�b���a$ B�f�bK0�W����3���4;3R�O`U��W@������0��
i�y%*�-h	H�P�l(�-R)���~9�ћ�j�ͮ%�<�E�+��@_��� �gڲ�V���c	8ܦ��"��@ U����k'����[�����7�o��&�O(�g^�jD�d�X���y�����{[�nK��NDF`��K��`��@����(�:$[��y��[�+���W#�K�ƭ�d5pԩCّ�b��2�q�Ph�����삄G��*��mc��3�[�
tE�UG�-�*�*����1��e@/h����A护�"��Hm���C��E^Z�9���$��>��$4[�y%����B��6�a ^(0yՉO�|�+��=R=hQ�-Ȟ�Hu3\dN}�y�����/�Z�z�����U4VAh[ʾv�,�*VIhҏ@�^���C��v��;���x*ZԶ�ߏտB�*&�<��'�q�Q�v����Z�rǜ�b��H�&��8��OTD��%�M�D�Å7��xr��X�����&��U˼?���_��>�P;owĊ��>��sۈ�j�dʿc0�Gvn]�*Bn��T0Ơ�iXQ�h�_Z�v�A����Y����1��;��3�9E�� �o��av��M�����jћŝ�ul�7�``@3EB[{as#�jc��7v�C����w��?�_��9AWǠ��A'�j`�J�
�%�@u� �o���h�c(zv@��y�`�Je/b�7��j��Avߴ���fΜ♪ͻ �l�ܻY����8㙎?(�T���CF���͜Ie��� n��W���V0�<�̼�-�ut��	�v��d��Yo���A����,�G�z2�@&=�Qp?k�Y���x�H:�Nvc��=��\f����k�����ǝ�A��Yw�髗⨅*Vf����������X�s	RD��A��4��1��(�E]߈���>Ej��bǽ����dvk0�O�G��2N��.^Җ��#]��X�tJ����]�>�=32$�I^�vq[�d`�_�{�SQ^��EЮq����NÉ���� 0:q��_�평�{������pG\	���CU�U�ڊ��kb^��i]}&��{/�{c֦$�1bU�F��G�T��_�Sh�U��n�r(�S��!��v0�䅨�B<��X��f��}�-g�e��'`w�d�{1x���sg�@'��n�!jC���ᵢ�萖}*��È{��*.�Op�h��~�;�ˀ�M�06���^y�2�&1����~�ZLي�8��d��;K��0��*x^��W�Ay \
K%`���m�u�d�� �oۅaHM������+���ww(��	�6��`កp����<���z�J�1�3���%c~$��d�%���BP�	��_�Rj��)�
�����^�X�p���	M���p����� 	x�N}�	��O�!	
;���h�� p��
"\I��4׍�g�f�>$���Ŭ�"�%J������5e�'.�/E�(��iGo[�����T��U_��H�[�4fOQ��BO��	�M;��BQ��^���Im[]zCA:�p�6>)��H�R�;S�4C(.U\���uG��%S-�tU���x�޴V����R�PX}$P��}[5��RoD�����iP����~	Ey!s?�%�B��e5� �-�O�|� �Oڦf<��P�/��f/?]���
�y��.��A�,�0��G�j�^���>歩�t1/<�
�H�(<�]:wP�6�bT�i�:ɵ/V��u���������z��PXtk�y��+n\���%�ڊ�L����8�P֟�C�^��}�̳���U7)��(�v!j�L}e'r���畤e�7�R?q�ˠ�&R�E`�!w�z���;�s
J=���U&�)�pOU�ݶXP^��эa��nj�cv{����H���Ŧu�Z=�QS�����U%�v�Q^7E���P�����ّۜA����T�Z�z�1��Q�r��v��[�\�q�n ��MS,�òC��+��ДG�\(:c��	
�)��g@Q����[�]�E|���� Ba�+�H��x}���.,���P����vy�l���=�aũz��dʚ���s����^kl���GB�i�� CQ�hX0[�
y�Z��|Բ��q�jA�;ՐY-�_T�ccڮ�=����&���c/"�%(Ca^DjQ������p�ķ�z#����.��;�?0.��l�s�^��4���KC����{�1��� �A.(鑚��3�Zz��A�1S��!��0T=L�d�9��`���Ky�����2i�t���Ft�Jl��Y���oiMU���#�tHCM@�����=����a.�ۣe�
sTH�ݜ��9A��S�n�AQ:�fhdjms9m��n͆�өvԣ��@���hZj��it�=
�.h� @pt�0�X�+��J펔)0Xm�^ϩ�;�i�s��z)��2p�L-�6]�-�z���{�GU��F�MͼFm�^�����
wh�5��VыI<��oV�e ��E�[�}hl��)(�j�������ܢ���
�J=�J"��z�f���lI�.�;��L��t��	�Ӹk<��~�����n�(6�}��`K��E=��Pe�fՊY���^�M�3����n�>�E����q�P�C�h��h&#�D�Mk���?���j�i#5��J�GH#�D[���Nw�}��]Q��E������ڝ���{B��+�|��S�$�����{8,w0����I!��P�X	*���B(P���0��i�]��B�~Miw��G�3�d#�=�4{j@S��G#�+} ���n�Ӣ*��f?jg@+��B�쨟�oŤ��Y�Р�p�(�M1��kq]�7�����$2J��[)(�uY�g3_<oˁ�^_!�"��w���2��3�-kM�/^�h%�p{ԡP뀭���
�1�g����Gxx�_��
ϵ �+v�bP Lr�Z�۴��w3-����O���w
%�����
Fe�* a�)�<Y(5����Nq�������m���e�hq����Z{J�bS��߻(��P(��t(�X�gH.H�,M �2j����[�bQ�W-���P�����H���=ͮ��P���"���>��o-s�Z�e��m����B�Z��4��c�P+(ת���v�"W_
F�V��^��8����}�)�@������!�n���M�5�|�S?(wW�ē��4ʲS����x*c-T�)�ď�ҷ/�vndn\�o2�[N���y��6����>���l�\��\ԇ�k ����
��(k�]�ʝ��E�"l�dS�	��^�����8��e��S(��j|_(���gY��R]�Z9
B>�i7����U����gS�E)��3�c(
yw�&�Ҩ�BaȢ�-�kU�ӣ}�dSq�|_��U��H���:��R��&�鴥w���}�pg����v����Δ#��i���{���P�f���;�G��ŪP��'̗����]�jL�
��D����o-s�^���s�o�j��E����\h��a��    }׍��)����Y����)V(�}Pv��EU�:�(�ߨ�I��ͱ���~.N�K*�Kz��
�z����j�g+Uq��~/��c|��>W_�E��7Ä��y�^��̔��$�(�I�+�ә
�Ȟ���E ���͡&����"e��C�)�(˲*֢�� �b\T�@~��ڮ:v8�
:�-���dKq�*z�'�ߨ�|�b�!A�I������R�巵��<up��4dԢ)|�
C�߲8D�����[��ĥ]o���r����K��ϕ�*�����IY��8��z�P�_c������^僖���xx�$�J˸8�2��V�/uj-�k��r��C� ;]���M�Nr:�:��9?�좭�/��:?�H�o��E�f>�>��䈐Ą���z�F�|۲��CA�gy厞��Q�����R�l�M�8�PS�ޗ+k.�ƈ&QJ����P$��(�/%�h'si�v}�u��
D�E�}?�4ƀ-W�\�g�e2�<e�XP��<�+w> ���y�9��Щ�<�؆�v@�������N������G�ܹ����)�Li���'�!?:}j���kk4�$O�1ښM7�:8�\L)���,��9�t�G�
���N'鱏x6�\8C=�Y��*��X�oh�m'�	��Ă�,�llA�0�� �T�`$�;��u��B��hܧ�ح1���K=�º6�F��Ba�[�\&��#m�o��
6��x�Baڌ�b�e���l�x8�����	���H���D[�7�~V{E����]?sG��X����p�Sݴ���됛W5p�5'^���47QG�\�@h���&Hc�p?^��k�O��+���UR� ��z���[�Kh�s�0 <�~nk��E��KJ��W��˂�P쯗�oԵ � �s9�p������'9	(�l��! Q�(J����oj�/n�m�(b�O�֬�rhh�b"��@����fr�.-�̀8�K~�2~ޜ�c@��z�m��j��M.��ET�0�Mi�x*�%)�,������w�<�B"-{�6�
���u���\�0i*�A�L�#��Pj�-~!&�������SUuET�Twnc'^�J�l���
eL~$��Q%aC� �3m�S�W�����^%=�P�Ԅ�����6��š|U��,�����fE���Qt�mW����".8��UEZ�Op0q'�cr@8���:$$"�j8�!L?w0J�J��*���˨�H����E�z�����q�G�?PؗfU�U�@Q�e'8<��坟wl�p�#�s�NƇ־�0��p�9�
S_'Z�D�쀾�Ѭ��ULd�b���
x=�	�E����w,�G=�h:X���P,�:��#N�"t"�@&�Y�;+��Yi�z�Qd2V�gƝi��yl*?�#�C�37;���<�����0w�$�������:�j�<��pX-���}7P0��Z����t��cWE�7{_4��W�Y �tJN�R�����TI���uP��sبþ-��`l�a/��~�C��V�����𸲷 r�����.de����-� N�`�<����:$��Tk�f��w��u�%��T�d�6�Si�i���U�����0t`�}�<N�Fy���3QR7�y�K:�j�TfMm�Z8�+�C�K�x��wi�x�s&�
�b��ɠ��z(����0	�{��s��C�;�q�Tq|Y��f�:�M�2X��.:E5��.���p)m��1�Y�=	P���t�!ywLU[g�e�@���M���n�F&�S	��_Z;�Fҁ����ڂR��3��s�eNa���'�l�\�b2z;��<�f~����m}\ݍ���d�k?E{���L�7�f1�ġ���BT6�Y9t�\lͼ`=;4��jw�AI'�Z���Z�"0E~y}��#?LY�&�ǁV�O�H=�0C�9؇iڇ��`3�����v���h��7�Ge���e�U�A��l����OnG����Ϭ�uM�}��Wi*F�P���ɱ��\�d|���㫇|ܓ���^-�\fG�8S�@�k��_0��d|�m�T�1��c�83U�x&�n�1_��pO[>���d���dr<��}h�b�*K���U�!�d�"U҆:lW�Lf����gEū�lG7n��8��D��J[M�L�mD���f!��)����'H ��l ���L��ǌO�?��S�FM�%�&�|2�fx��3������V���-�b {��.\,?��1A}��5�����Mvq�A�n�=��LƁ`�B���Z-\�K=��������p;�T����R�,d���6l)���0�f����ݡ~���!Q���&�v�Q��2���u ��H=�П���M��j%�Dsߕ��#Umk+���[[���6�U�V]�\8�w�z[p�����(�	G���H.���;�,�)����H#u�H�S�/��0��b�s��֟�w���v��y:$~�-t�TU5�n��}w3U��6���t�"�������U=�L\b���£�� 9��ⷶ;�#�V��7��¨2V�	8[}�޶^�+���o���WOF����(8@�A�\�+�PH��L��PI�����9-�vH4�vS`�aY���w�y^�j7A�A�^@-�=b]ӥL.\R����t��Ƣ,:8�@n�M�ND�9pA@��Q�R>�j�����$B� ��v"nl�h�c�(܂�L�}7b+}�N�i��}��AȜ]nGG���}D��10R�i˻���,:����݌�1KK���8�ǲ5�X8[���L��N�
w�=�Pdp�*<�k�:Q:��}�b7c8��:��"{�.,v��k?�:).uފ���E]�Dm��x��ݰ;O_�f7˹�o��t�\��)��Hp%euoL��L�G]h�M �<~E��ӱoK�!���&���"ng���Բ>���^֪U�)���34�@�[�cmO��~O��[h)�S��v[W��zξ����v����Pb�u�ᦲ��.[�8����=�O��/����2w�)�6?��V2;� ���7�D�M'~�6y��N�ή�KEZSd~n��{J4�J�	���4�(��,RҪ�xUX���z����ZV�]c)��s����w6�Ŝe����r���T��,:ц��ө����sj+�"�𮨬��Ƃ����1�
�i���yM})S�{�ڦH.�k���ps���OH�K�M��]�p#:��]�R0t6~�u�Sq�Y�[�T/I�S�	��`��.�}a%��`q�K�\X�d��.n�"��ͭ�B����ݕ�ɴ*
p"���8�q�L���5�͘�:��{�G|,�8(�:���B���j��#}�y2�F�v��Mp���@L#����Ń?�H[������㪧���25 
����n�`00��
$�/ZU�k6�E���vZ
�CW}���}[�Eݸ*���bt\�`�B�ა�?����k�^������챐��[�ֆ���o�kK�ڧ��M|`�79ع�UG���xݞp���n��w��f��uP�v'�muE�6mq0m)�{���]�n̚���nr0uj��H�B��z��-���0�=i?A���98�n(�q���t�ok��:GX�=P@���G�L�a��R�U�����'7��9:SX����������8Y �p4���q�$!��k�����##W�oK��nb���Gb�����Q���L�X�ء́Bc
�;�n����`_=7n�X�f�Fz|+jcG2bȊ�; ����C��[���w�=h'>4<\T�?(/9js�
�X�oZ�O��8������Д#�(�o��ϼǮG'E_
����4���z�E�Ɔ�F�٠�PS�Cw�3EB'h�p��;�g�<�]��:;43[�f�f�7�o��"�.]|5;45u�H�{q��O�CK�~[ߛ���I�e�y[f�S4�l��)�0�    �13�0��QY��d���V�X��}69�՞A��QVfϬ��Eg.���{0�9
?����գN��&��꼩�z���3���S�t8�d�L��|�~B@��މo�]C�E��+i���G��t��ƒ�_X<��Y��z�������7k�B1z��}VS!v��'gS��e��T�gqV���)��K��4�js���_q��h�"�R*�E��,i9CZ��~�˭�n��jn�F��֮�������B{Yc��	?��)�g�<�m�y@��y�۶ڵ#1C�u2W�4��ֲA���e���$�e�������&�K�\>:�=�tVW�2�tP]��:O{��!7V�N��w�*�gH�|�K�E�c�,��@t��zڕ���!<�Y)��g�6R�Q�4��C�ϼ��>��-���<9q��������3��GN{�Y��4>�G�t�@�$��G���4�"u��ֵ�#���B��q@��m��&_.����;�/�Y�)������9�y����{���.�=�N~������Fa�}qS4��ڲ�yR!�m�E�)�``ߗxf��'��:��8�p�zփqǈuשz�àg��_u�*�ѕ%=�����SZ�p�p<��E���kO���ks_(�l#�?.�
�Ϫ� ,\����LC~�iv��Jg���1�Zv�A������p�D��E���-{�C��6�}�kŮ��o~���'�%��>�`�����L{0.�O��{�3�i�p�ӱ�͢��͊��t0p��nS�7�N:��ˬlc��Kg c�}��4~�F8.�������F�odf�7nӱ����j��TRxm�.6�[A	`4�����ô�z=o��#k�;lZ��F���0;-��}�^�Q;|4����ẇ!����y��/��Kr�ƙ�z�(����3o٭-�hu��䆹;GN@����!�O;���,xց;�*���[R�[��#F:�]җD�E�}�:��1ד��X8�[�)������zA0�k���r*Z�����*[��Ӏ���/j��]��y��H|N�_��o�ٴi�E�9�`�S���#e#{n�)ɧ�{7Ŧn�U��`?�Ѻ���|�g���M;���:�����*�t,�f���W���w҇�]V�n�����Hx4��(9�ggފ�{�Ё����T�l��!��'�}����Ӧ]�����Hǝ��j�sZ���Ç�5\�����(�7��tE���`��>���G��`*�0?j�
�����#�s�?�I�������#����%�&L""l�DW0LF�[�"�t�0�S0?������za�k��W�'�d��\0ǝu!@T}j0v�c�&y"YC!c��Б�j�ģ��;�&i=-�3H��У��`tޣe���X�(w�.�`�� ~��|nq�:H��h�ȫ �F���g���n�8������̉��Ѧ(����ؼ�Z��rG���R�h�NL�}�F0x��C�'�;r`)�i"�r;�����8�P�#��,��^5�̦ݑ+�
��KAD���2� ����.ɋ�đ WuI]S5��vG52�\qRݩ)�B�`���$�Fgwf�9Q�NԬ������#QQ������{^ͳz@|���d"�U�;�����!��'�6$}�)���i����;_�r��x�C11wU�{"b@/��89���#��m���z�v!WEo�����n��-���k��R�so)�#�L=�H�;;{���nڂZc�:ܮ�g�j�$��S/�" 
���ʿ�}/�8�-�\?{v����*�b��n*��
�^��Vk�xk�-� 4uvg;m�`�J�T���*�K±�ro�P�����H��p_1��r��]R�c<U�I��s~1���l9?���亐y#u3z����� ��@�`�5��ϖ�w�*��I�^�����`F+99;�s;��bc��*`�g�s3� ��U;.��e/M�x����g�K#�c��E/�Q�#JK=ep�g����_X��q%��]�{��vGpjY��#$w��9h���S��vM��H�ۢ�*���|6� /�=3r�U{đ���;i�jE���{�N4[(�.��A��z�J�׍� �j)�i��n�b�X�}`��X)~i��yb��E�xA��J�;�����3��r�����^(�D~d�m��CY��v��;�$�#��̓-a�mX�?���FbE���x=�(+ѱ�7�(J��cxא�V�k}f��p�k���[!��G�y�c�cMp���W�T|�aWW�����UY�M��V�4-R����Ӕ��[Am����B����`$|�m����4{��yN��ܐ� ��E�ٮGWuC��1r�`�c�����8x26:S�h��+��qc��Ƀ�I�q�
كs+�d��B����+�����g���rgP$έ����u�d���IPN]�B���B�f&���D�S���~��ux�o�fG�����:?A�Cn.�v��z�0�1��<��C�A��j#è(ls��+~H�[�'w�����ʌ^����9��$H'�׍F&9�`������,&��`�]TKc)* A^�7 S`��tp�Q����1,���Z�1�i����r��=�
Fn�u�*T�qD�3%�'Yx�>��
9�t+|S�m�	�}tȪ� ��y`��y���u����0f��(u�@0X��l�a���L�"��B����L��\\Nm	�e#:#�pj0zr��B �pd��MJ�mxݮ���&H5��_sS�O$����&�	$^qwOQ�	2o	JՎ�b�mS�<Tbr2xԃ�I��^+ʏ�y)�j
I��h�*A"B�_��d�$�����[���tp�d�hIq�{(����ɤ(Н1(n1A�A�4,��M�QP�N�WO�AX��<�@�� 2xjD`�)�K�08�)l�u��L��ȭ��t�����3zk��$Q��������j�E�H /�D*w����Fz9�!AڠG���܃��ɌHq�~Vn(<wp�E��M[ ��ޚҲM�	Roͺ(ٳs�������XG�����`d��=�:��FAu�#)��>k
��$�f�9�勻�D�A��^Ք3&:��X2Jt�ـ3&r���Y���c��r�	 ��@�J3^	�~�2�G�8.������mM�$���KK���o[���R�$=��o�dSu!�����E쾣P�?�8�v_*wQ��3��-�կ�[�@�_��s�|��*���"��MFN{$�y������������Uo&`��D�p�T	������]�x�"�: [R����X�fG.�`�/��7������w��//����5�l��_T��Y����h��0!fN�8 �/$�Bg���p��dA�_�pC��	8y���"�nT�uK*o� �/6,j�(��.�p�w��y��X�$�~�i���S@��е$�~�c�5î8�@qm�>�泃�EJ�~��¬�[��;h#`
��]!��]s��Ϧ�V����ݷsjOA�_�b-y�}5:;X�;;ȯ&ޯ�s�ູ�I�A��A�����ֺ^q��;�|�v����P-���Ov�zM��ԻU=���t��jcVv��H�W�bQ����;,�jH�ޗv�ؖ\W�ޙ�r�i����m����cg�E�3Sj��&����ޏg�B��L:Sj.�Lg�=-�h0Y��띕�ɜ� ���\�ʕ������yH����� ����D~$`�߱}�i���כ�����S�/�[���M�����T����Ũ���߹����@h�X�@g�+~kn��-8��N)�lEZ2T���n�D�X��o[�:Jcu�~(��:垧S��:�骮J�RM1)�l����gz�RE5��U�,�gv[�B��A��[-ݘ,ME��
R2�&�l�_+�5��`�ߵ�~(|�����pdc
���l��y��vȖS7J�s�k��%�SPݗfiHՒ    T��Yu�ʂq�Ճ��R��~<r-?;³�^)hoE��:��t�}
�[���������q�;Lr�Y�N��"�L=J���DF��Km����/��:���M�_2`��g$��Xh�$��RP��E�V�%W������Y�{ �o����H�;������/� ����S]q��)8�˖�xJ���O��`�/��o�g��l�R����Yܙ�!�V�߀r����|�s�o;,� ~eJw�;�*�J�"�9p�!/�Pw-y����ɞ�3��<��������%���K����[V}0�?aș�1�8����M=����A��/��ƹ��f�u��gu����pMAէd�Ogu����|2����ǚ���&�b;^J0��{튆_��I��n����ª��DC^�!pq_6��3�uM�xf���7TQe6U��2�t⡏�$����{�0����BFf�W��^ބ�w����ݞ��*����v�L�l��:��3b�\R(-~��yA�f ���^g��I1a�q�=�,Ij��.��`bܡ(++~UW�5�2�����E6���R-��q�c�O(����M��@�{+�Hp�\��Hp�\�g�39��G���Y�h�i4�ŝ��*$r��p$}�Ei�}l97���0_P�����u�*�57%���P�%�Te�֯Z��1����2S�/��֏�F���G)���j2����nxJ7���T-'ϐ�KO�:d���UF~`�օ�	���y��ԓY����k#�A�{�k���ٞ&w���D�Ɂ}M^4���$9�W�?�\EC��k�Z$U��N_�k睁�b[p$n�`LL�V0�"�3�Y(��C��b����{ـ�f���!O�`�?���ߖ?����j9x���zc��Ff:3��J��~�`�; ?{,��A�v��i�Z�T�F�Cc0x���;Oy�cE��"�k�g`ց}é�d�ԁd;c3���<� �~F�e��i�9�\�	���؊�,����B�Xw(yRw
b�!�����)�-d���d կ�Pϐ8uy�d7F��5��<��]�u�y�u�,�=��T�=�m�f�,�x�!G����P���|[�7v�a��`��/GK9T>V����c���0A�|��䞬��P�*�8{�E11}���Wm	��S9�|2�pQ��~�D��;,��կ�]sFB��,-��LW�);t#��`i�j
r��=��!�A�w�J��:М�J6]��et�*��;`���%�;vϑ��S�6�����~!#�|���)����8��Y��+�&�
��iꁤ6|>U�jdv/E�S���T��A�_[�l�9��k[���:馩L���Yi��{oE�i����ʀ�h9y��p? ^�^=䀙��w���s���Ҁ˥r���*�h쁤�D�G����� %9�<�y,?-���p�Q�d�|�'��<Rj�w�S��% �����+A� Ձ�"���[Z��^8�V����z��F�x�aK�u�֣�;�q�9�uC�.�ל�d�S� �+\JC�;�ۯk��?�ի�m͋�������`�QEI=\0�l�q�]P��4�56j�]�f�n���ƏNE���.s0�GF޵ۅ��u���o�v�]�����=����;#7/�2������n�eO��l�F��ÖX���_ڢl�X,����H*��;�u[9h��b�pSvs��7Ų%b
2,�������zw�M��\8��A�үC~���o�Yܱq�v u��E���~cE嫛�����r��
)� 
��N\N0�9�2a�B&y^S 9�w҅�9hw��-�=��Tן�c�$�p���M�����TȒ��$�\f�w��@�9���α�|	�:אP��M�6֡�V/�4�tN��^sYZ��w�[��>GA GK9p�v^ps]p�@��ޡğ>:'�D�.V� �ρ�tw������+8\��ދ0��!���ѩ{�sJ�e:�.��%���L~hGK��
ggm�Ck��j��:S�ޔ��>Wg#zac����Ϭ�ִ���؜������]���M�p���ЛA�`�D֛��p���9�𻶴T��t<=���9��m�L�r�*��p��1^�-��̞��{��D?0�t3S����~Z!���=f����[���쬤O��,��Q���؆l�[n*�3�?5�
Y�5��O���-��q&&OMhxsF�O���,���=Q�'��MP�1;,�.�3C�Ng$yad�ʌ����C����hqnj�������#( Q/(�0��l�����VW|b1Ae%e��~�(�����"���w_�p��.�zp�b۰�|���[N���I~h��Q��Z�E���쇖���Tg'����bG>�x�cC̍�����~����b��g�А��,��i��37\d���p���铏:�z-��--����$/�Ԭ�3�vf\ [�/�V`�U�H7����/��Z�F���\�K;�����v�S�k(r1:����ǒ̞�!,�����fb�p���w��=�3*�|�3���9ޙIdf�Ҕd?�5d�N�&�Qd�i����u*ՑDp�t�Ԛ�W��C٘��qE�0��	���و��p���n�2(g'~f�(ݮH�&8�3�i�#;���3�P���/�\�j��q6�����=s���Z(x��<��!�k�ʑ��ԝ�RN��!�#�9��2���6.ݱ�2��0��|&)�,}aD��o������_a'O�����b����䅕w�X�32}aDVK��yﶗ�;d�M����zeW�[%�Jjg��W��=�����#����A�{޻�M�fH~����ƚNƽ�~,�f��~?=������q2��ؚ����8Od�v��x�c;��$S���>G?6F��9C���&��Ƕ�r����l��Mƽ��ZÈ�9h������2�)6��Lz��sf��l�bG5 :3�s���m�ΊRz��t��J��S u����Y�XP燉�Ɋ];'7�fƊ��6�vA!�}�N�;�̮9�4�����������6̀y�n���V;�L��qU/����b4dN�36Ucw������ٱ�� �/��غ3���TǨ�����W�0�$��鄉&��(G�٠o^_���%�����Ԁ{v'v]7�o�=h�˛@�|�mŚ�EL4����5�3��h����;�_�
e8�+��l)�)
����s��f���z��+�f���S��f��R�vH�V]��U�s 1uk�mI&&�I�[�IE � ݘ��,r�X��A~Ia�!c�tҭ�����3�hXqV���z/�k"Wt[���lK^�jf6���[ݺO��]A��B���G��sЙB�%
���z!�rF_�!cEj�檾�<J><���������p�f��V�2�$�:AVG���#��`!�I0\	�OG��ܶ���T6��;��n2R�CM�9�xկT��% �kr.%���� -�:��r��d�O�u=o�7��,�'�V��A�DI�A�6r%�6�V8A���t �̈ ['~4�1BģY���h���92�6A�c �=A��r$;>���þN�䀜����c1�Av�y4\�h�|ȥ!�,����N���ݺ����
E��d��p�b�1.��(�(>Yi,�~+��,��^��Nd�/�����@|�����y��D��<rH���A�A�d�$uGk�������r���q`�)�E�-M+W'd[\�l��.f��.~�4;EZ�\<y��`q����ѽ2(�v�V�����)�m���FG@���i�!c }!��\��ĝ@�Wh�0���0'Z}iZ_�;iL)-��;���
��?���ۖ�N<�.�������=͍C��N륤긇���ZAݻ�~;ģ�ޟ���Q
����ٴ���9��	� 7fQ�d��s�!�,�ٝ�Ζ>?���.�����`�    L�uU������H�k�� nQ�έu ���/J�ġ΋zy���:��vt�#
�䴕C<e&�Q^�ܧ�]�5u�`�_�˺!s��o�_w@F�$Xv_(��A�.��֝�\���!��l�'�a�nq�k�e�|������j�}3?���f~��C2f�~� 2�k�f�4e�^�(e��6ԓ�Ӕ�%��Yʻ�{0:I���H�F.{��`���
q���Zfa�XD�?H����>>�"U��ƪ��@�*�����F㼞���:�_��^���Z�q�u���ϝ �������Ф��q�i܉J���^�J����u�kT�*�U�#�x��s4�<eЂMt2�����|R0�S�x_���A�\F��m��3���p��)�<�CK��7�(�T�[��������3�U���{�����`���ʵ㡮j�0
v�V�k��;���Ֆ<����-db
�\��k"�P�VRK������BVO�ǚ�ӞG:�V�`$�!�ޔuS�w0�W=;A�c)t6�����`����0�-�v`�Ro)��C�_r`0Yk���=���AWܳJP��CS�n�]�=�*uUTG��`,\����T���"s���.�S�+��M(}�+�Nەo��O���3W&k=zWl[l�C>0��BOU������(�_�x��y�y�T$uW.����WRc���w��J˸�l�tW�"����|�3��b�����3���:���rt��G}c�����ɷ�]��G9�,�Y���.)'����q�>~F��\ �}Y40S`��i
����n�;VW���H]<���jK�O?�]|lB�]c�\����π��Sm�p���`3+��~��ѹ5kT�q���[���Pq�7EiG�(Haŝ�H��m���o�[��kq7l�K����Q]����60=�D��p�R�U����#<�z4� 
"U����=��DY�N�=�4�J30�kH\�{0��2S
���Q P[��˿k�߹]|�;w��S�t�8hKC�C]���a�����lꇍtf`�	��J�<�jl�;�n�:���m#�ǒ2�#�Ő�>�s����D�H���.��H9�9!�"eYE�{��U�U���
]ڇ#�`[���������K��"��~l�q�nY�����b���~r���}����*���]'�tF�a��О��E�����_E�qG��g�oFw{^Ot��.Up�M��&?�2�>���DP�A������Y��P:�H���?���lt�����/���	�'��C��C[Q�_�e�{��`:e!=T��bʁ��L'W��Plȁ������
���p{��'��N��kj�ׁ0�y��D"�-L�,욢�D�x�H�&wY���b����s�	�_ڢ9�?C����ǯCC��fA��f�-e����H�2eCe�vP�$����<�LL� 8��B��t�;y�j	��'�k?� �R����	���0������/�����ݾB�����/gvCy���ݎ> ���>.hF����������l�UN?@$�-ͽC���>Ҏ�	iw�zp�"���XI|>��Y�cYz���{邅f�ѭI�N�r�έ�DfSp��Y~�'@�{4 6؄��W��B�+릱��!qk�ʵ`���]H���|d�5[�q����T��!�aM�T�m�u�{^���XD�g!�����N�h��+Q�D��B�7�
���hu*��<w$PW���O���Z��M�3�t'�L4��ViM�c�A����U����G�P���E9�?t��_t���0��?�$��ؤ�.G_s������L���Z"���胁�(Ĭ}���M���#�MM���m�KjW�[h)��]�[�"�v���U�Dnym��9�/�~8y��C�0mc�}ʡ���t��`�T�Y�Q8_��>1�E#Q�Q��o��"�`�n��m�����v#��ԥ<��6��:n�
����#�ʈH��_u�Z}1w(�Ӧ����Տ��`C5�s��S�>p�Ɇ���4�2�4Ù�9" _�[K�O�'6�3�J�`���ؑ��2"O�o�m�.͑mL�F��ZA��;��k_z
�}�����1%�{�H�����F��?�Zv�{�:ૈ#og�g��ö��ڵs�A��
gmc�p��T�͡)�)���? �w�h��z���ƂZ��v����o��#_��'�3��JM�gﭴ� { "Ӫ�6�U�>x�^݆ġ�c���o�
����1Z4�(4��zT�ܺ� �%���/m5�q!Ipᎉ-���������ص"�3s�P�Ȥ�����VK�	�CI�ʎ{3(��kٝu��o� ��������Ւ��)�PTd����P��}4]ia0n�k#�u��ȩG���;W����uF��W��.���`t���=(.uUK�%y��Ѭ�)?u�|�A�*�M��]R^���:-[���ܼ���2G�{:�֮���� rOf��x-=
[�5�}��M�1�Ѽ�`�a��wn}�z0N�D��
`�?4��][�͋�}h�*��A�fH�����f�c���2K
m�<��<Z��`6�ۊA��5Ѫ��(�0�T�I~�¢XCTM�6���-+��%�cFb�ץY����|^ J�z��9�œC���U�H��TM���'u�R�H��5b��7�R&�pl^�]��W��`d�ͮ}r �oچ?Q�~�tiGc?]�|0,1��>�CN���1�]:�%�Q�[#y�Awr�4�a�Ì��4m�6��_�����!��d����p|6M��aĴ Y65��K?��5���#g�pOK��%*&�W2�g����Lg�Y*�z���(�P����+��Lä}mv�yC9��<���9ϧ��t2$���7���sö޶f�=���4�#>ؘ.���`��_r4PŅ�EU���u���.�P*�?���̿�)ɇ��P�f֫��L\�"��Y��u܋U��El���h����+�����vi͐�%��ɥ*V)��A��updx����w,X��4 �p1R^룯?�C�PUX��4,�R�B9*0
FOh!;(��v�`�jt ;]R@e��z���w���B���M�%	|9��Fc��n�W�)Tk�7>�C�F�xK!U�C��W�"O G�rH��n�88���9ԬC�Sc���3)�&��呩
���q#�r���=����(�pn�O�ux(�p����q-��G� 3/��s��!�20ya`t�E��mL��8Ĉ��n��
拂��.�0Hޠ�EN/��N�A�P�T�aY���)Z��ߢڵ܊�\�9	��*���9��v�Q��Xx
���F{ڂm��D����.-���S��f^7�:&����y���H�]ieС0>��@s���2/)4/�Eɼ��K	*����������VTMha�s,G쾗xU�����,��"��B��ݻ֡����Y����#����P	:9�:X��P"e�L�^�ʔn룀�p�d��=Q����
F�o5�/����KUI6}�u��\�V�W-�Cե������^��K߫W/�3I�%�w"�N-�j���(��U�,��=�z�S�U����B��N(?���_엺�^��������F���逸�T���O��-����`u�J�i9Y¯D�j%�\ʈ/V�'g��R[2��O2ω�ʿY[����K�b��Y3��$�:��������۟�n���P�����m<�No�܇~�5����?T�PP���oAB��1�A�5�Cёj�-�j��A�r&tݜ�7@��m%���eI��fTG�č.��@�_�͢-��$�����t�(?b��#�8�����м���P�i&�a�B�`�N�X T���4�q�:#(Q�Z��ݡ��[U63M�8��}�9/���>��7�j�Jӕ2N~I��{T����R q'��3(0�@;R�SW�ǂ�aP�f�^Q<��X0T��^I�@K^Jy������Z���O����C먑�b����"�Dˡ    +6ː��
za�SA���82�5���(��2��V����

����P�Mc�Gy����RcՃvRgʱ-ZU_���`\H**��O�Q~��;�)��jz�����m���i0%���V"��#�%e�N��`t���������2_�e+�����C�@���Eۍ�'���2��r�sn�E)��f���
*�ε��㐓ܗ4�d�!ɵ�YT���}�[���!��pd k�������.F'�PP��v��Ga���ے*RH�Jޖ����������Ål�MK.J���۝]ϙ50պ�z�߬J��3�Sp�� .:�1�:�Rt���_ϩx�%�]�X(J+��)dQl�:b
�j�ت�F�W��vMnȩ/��_�ֶ`�Vɯ��W����I�0գ���եZ&o��@S���@$�]d�6E���왕��>�B�Y�s�OUUCM�G���`J��v��n-w�J}�|���}Զ��y��8�SfU�g�b������4�L����#!�`p_	OS��^�(l/9X����T:��k��;n���GO��C�ƍ�V�١1Ct
�dy_:;�\6T%=T���\Fz�c?ŀ7�S;T�?mh,����b�慎"��M�����ZE��D�Fn�o��\�����-�Q��k��7��t=d-$�(>�U#���o̚�U����H�I��Q�Ҍ�(3��4:���T�A�/��*J��[ͼ�2�i<y����F�*p/+�]�ʬ*��ƽ�v=)���:^Ľ���������\_�?�X�~u�G�9Jc��ʭ���p%�	i�V�!g�����X�-�"P4]ϓ"?���bYs�S�L;t�5H8��X<ǫ�W���,_hN��&
,���To��?("%Ձ�u˭�:��]s.�jI��A<R
��y�����������I��T�~a�`��[TҎC�$n�V�9d-]��"10h�K�T~)�}�aFFr�k���¡3c.Z��G��P(�=�s-�ѭ���J9)+h��ܸUA}"�&�S���#!��֬~�J06�[���R`4�wI#u����w��~�s�ȇ�8Y�t��p�jU�(��G$���S?1׆#��#��糨:��`$��֑�-j���N��>�F���7�Ō`|���\l(WC.��>�gH�;�ϐ?8-�R�yl�X0��ώ�!�gu��re��ȃ<!�X���/<��K=�\*�q������e����^��-*���X����@8m��k��8���cJyUo��2�u��s��k�y��2_$�>�o������%K�gja|ٮ�̮�M��p��s��N�za�V���6��.�]Wm���I�w5�Z-o6���`�ﻐR#j[ɴ`^��\��\�S�����!7�L�午�N�j��ձvEE�ߙ��K*�B���D�ڋ r[� ���`��$?ٙv^�0��T��f�-�8m�X�>0�V�w~�f�j����\�oCǁ7k�Ɉ���.<e�y��z*����C�4��@�JPi��}���B ��٠��,:�AS���AC���h�8Uv���֬��<�f���J��][q?V����^����K�[���5uˠ�e"cK���`��[~ᛯ�Ah{��u7 &��*�^7��
��n��t�Tb܏DoE�i���X1�p��v_l��vA��o����Έ8�*/�@�/�;��^���p�pt�Tn0.Vܦ�q�[�ֹ��e���������`,)����4ճŰ/���Vm0���o-� �ߙ:�)�v���9�j�yk�����
Fk�fP�ޛyK�%�*ϻ�[Us��p �7_p�z�BD� !�����-�%�������|vԮ�*��d�v>B����ޝI�c���W�vЬ�U�&��o��{m���D!�Y�Ŭ�^��o���_��i��
��c~<����ĵ�5y����q���6�|!}j�;��O��bc�%���7��fK> m��}�w0L�,Z���q貐�����wadM=S���Nyg�(���A���&��|;Ih���t�)S�Q+�M�7dT�U��AR
Zoj2ײ�Zx|PЕBk�F�+/<r���K�w[���+/?v9Q_n��D-|y�w��W�?�ӡ���� ��g5��sl�j(��Ǖ/����"�`���s�"�(l�C�~P<���O�.�a�WO�����ԇ����~=��5��4��9rX-G�-ѯ�:��kC�8<��9�W�o8G�U�?�͋�V�d�)h� 
Id�\q�l){dI%��.Ҡ�I}�[5��[0�J�?Ry64lH�h���k�L��u�2JtkO�	��FV#j�'�N���S����tRr��6w�h���<�66R5sLXe�k��V{���T�^�8:o5�_�x�glл��?ڍ��30�-ec,�u1Ǭ�����rW���M�
a��������MlD$��+�%�-u��hU�}��	�A��N�;ԬT�,'��]�d�;l�ͫd�[d���h�F�ZQ���5Z���d�gf]ƒ��
��m#�u>Z�^�6>�����<&�p������N�A΁$?��.X�$��9���U�C���>}1� ��AOX��_�k���X��׃ww���zíis�Ы�O{;�5��?˯�ߨ�����ux
C5箵��6�W���Z��Iu"�����6T���Y"L�Ā����X06��#��i"u�Քi��^�%�
�>%1�?�` ��ݘ*�����EN�הx]?��Pj[��QJ�b���{�:4`�pCq��Gq��Ǧ��w��g;p����\��NkX��`;����߿��T�ٟ�v_������B_p<N��b_q�^BG޹�8IhN�|��??G^�/3�����~�ӯs �������"�����|�5Α����FD�����c��N��'��ȹG�����`#?v�oG�i�/�K�G�׹��Aa��Bk��>W��>'��yLr�s҇�wp��t]n�gD�H{y�H#^#��	�ҳc���Y�U�[��q5��Y*cco�W4?H[̼q�U�#�dgg5��w�(��L��tY_H/V�۴V��ksg�/͗�{JR=�«���wO��/��{�e{w�U�;��������c9���D�?��[���8�Ǔ�EY���_�I]Y�`��Go��ԡ�%������F�t�Tw�"�e���3T4��9���,"�A��������hށ&9j[o�����ڦ.��ж�3�1Z�� �*���t25�Z�/v��rP���;I����Cfϼd�������A�.[X�|f₯ʽ[5���f��`<j�m�)�كF�`�x�\����A�ct���à�#B{�M !��n�>���w���F
ƭ�G�/�5�V?u��H��'�ᰨ�w�ٵ�����_ �����pib�MX��b�:o�X��.s����r��|ňg6�t1�@���8�+� �KZ&�{d/.K�ձO�K[�;�6_�쌋Ի�� y!��vMޥ��������%��h���y�`,��Ͼ=��T�?�{Ҟ���q���:���)�8��ݑ����k[��7꼍̐����/GqCW���0�A��#/�e���V�`$ZP����%6�X��eז\����E���ܑ`�#��j�wv�lm%����������H��;����o���]��'gb�1P�?�0�lv�UL:�J#�΃�����H]��ۉ�|�A�m�ہ+�	���]1T�����h��-��tXmA�r9��n[��ޟ�mɧ�;"r�����ٵ��ړ ����qβ�A"'w6��X�����#��Ei���bC$2�����&n���"
,���.-E� �1�������vI�7t���F�Bx`#����I������Yf�s�,J�]��/�D��R�TQ�Yr�q&�*$=�7��}�[º�MR�ҧ�D��ܟ�����7~lm_Uqoyo�ly�q��sR��ǃ    �"���}8"�+ �fwF��J��ڍ�<�w�:\�Of�4�LLP�$�_r�^��ԓ�6��D�=��Fj���h�p(��i�ש��e�DݭC�E����D�N��(j*I���:/�CC�4�eRQ	2
�2R�-42e@׽;3{(���)䧝�t���k������+�o��Lᜃ.*c����`-2$�I ��I��QL$A�d�"�CN�
�`�6�m˱�+&ݔ KqS�ʺl�9x�hmC�ٛ��:3m[�o �|� 2-��IF�I�sT��d}���,�.�#��F�3��G�$�0��A�U0|l;�Ү�`��uI�%��mv�c�Lg[��L�^���D��b_�|���>���+�rv��wZ�t�q��
�EZy:�B����F�$���(CC_�_�W�q���T�%M:հZIț��6Qv�'v�De�xbm^���M����b�Ȋ���rfge��J�Kz:㕽#���y�"�N�x2#�n�c�����}}>��1�*���b����`����Ο%��c[1U~�|��̭9t\4�VOqOg��c���
�oj.ה,��r�/����CW%�#u���J�?ͮ]HYR������GX�r���7٘߉l)gAghl�شG���9�B7��jg�~ݴ6��ř����.2 F��O"�.i��jvyBv槶;���P�e>�JV����?J�ns�|��/$h>��Z��"I��E�8lF޽x�?LU���P��6n� s6š�i+�<�ځP��L�u[%���B0Z���]i�����F|W�(�s�&7�!�<�
�C�g�0�W�l�<;FWݤ-�}�h�ۛC�jh0��?��,v0�V�Ͽ�I���ֶԳM�Z9��z�U��7��d��``�lҤ(zh'��I�n3(�#�F�{���0_o�D	�'��R$F�Q��^h�i;��ӈ�LK}�)2!�[�)��;��r�,R�#K���ͩ4�Z��-e>u<5펻i���T�|X�qYG�4����7���*����Zx�q��/���ҍu���gCw�Ltِ�O�j����)�C۬�g�&Ϟt�Jc˷#u3H�������Ҿ�җ4�yK���	ڮ3.��,ޒ�H�UJ7�rli�[�_�s�����2�m�c��E�i�m���4�����m�#�ȡL�?�4ʋF�H>:L�FqQ���%��#o���c{
{������G�`\�q�j�`��c�U,��d�i���-���o�\2R�|O�[�r�C٫$���I��aȔ�tj�=c�'W�<�XSS����g}��8�*\`!�ʺ/�60����.�;�k9���;i�	F���]mj��Z(�h���*d-���[��A��vpk؞r�B��w�^�r2ؚ��:ؔN�>��C?���X�?�hc�J��(���n�`���ɽ��;� ��R>�Z�1[r/e����=	�sI1"��s}n�R4%�¿ܙ�m�������3�����ʻ�r�pEf��-<���6�z�ԟ�Y[�`m��D�A�3������v,yĚ�>��ݮ%��!��Z��4�t_7l���B������Ѓ��;��/���\d#�Q"�l��R����DM�����<r_� S�]�<~�0���Mu"�-�^Bg�;�.��n9<Q@q�WV�`-?~�.qHL-������5��F>�Uc����V�`�jsg�-�����;5��'����n݈T�x]��Z��eub�Dd&\KE!!�>����j^��XW����tl�)v�X�v�r?dވ&��p��6������;�:�Ͽ�:l4��n��Wg�V�2��n��P�rҌ�Q�r�*t��"C�`:�/8N<��yv�SE@��P3�t����62d�4�q_D������/*�/�#V��?4햄#�p���J�ޚ��)��f��2�(6���,\6�)���0���ڎ��z@�_���v�,�
�o�]z� ��i��ʐNpнv�SХB���:�gH%�i9� C�r��Kz\mُ�`�����@]p��g*&̐, �ԑHq��ZV�F��Ǽ���T�3C��}��X[6�����A���I��:���p��<q0hN@���e
����;��}}�D�'�I����`�Fh�����~/B�A�����V�Q�;h}g��J@�%�q^��9�*���^��:����a��8)5[<{0)5�<-�USfϔY��M�:��.z����rAܳ��z���A��oe�2��u�����������^ ���*,T�f�i����{h�6�o�2Z���; �dU�B���6b1,tdw�:0��q��l��r�4����=N�F�C���vUU*���ۉb�3S��@��_��A��\YLcx�L5�:9(p���G.S��������Ub��5\��P�ws_(N&[�p��&,���2��~e#�p�W���J%��T&�Y*���@R#z@Y�� R�>R��2S��v�CYUԦ��G��61���;SU剂A�}g�'.���3=^�H�Tus�Kmmk����՟Z��U��O�
����nz��P�W:j��g!��2���MMJԐ��/��sm�<p�E*w��5[�*�	����1���
9\?�'�E�b⠕�Բ�7չ�}Y��c~�]˅\8�_x_�ܑ�©�"�����6�/�N2�f�ݦ:P'j��v�`8���}��ss����vSn)"<��'�ou�@0n�qǒ��s��Ԙ�:���Q�/�gG��./���^��w%U��'*`�@S�Eo�¯Q�z
]a�+;�G�������ː��������,;]�r���J-� ��*3�A�?��C��y���ޜ=Y���GѡITO�|̚�y��j�z�E�yq��]s�<�?�q��=�~�<b��x[r�V�zWt�{��#͞��@��؞�Tu��Ǯ������;`�c�c��<Sy5�>�zK=�L��������٨!G�hO�V���ZՐENy��i�uSr�g+o�6{b���b���w��d�.K���e��\]���W����\sqZ�.�Uf�@��{t��.�9V�߯KM}=�ޯKi������ꛊz���=.&ϐ�}���ߩ��]
uʋ��U\!F^�R"<�n*��ۼ(���{I��4/�*pso��<��(�`���!8��ʭ(�k����{+Գ�H�q�JHN��\�^7��`6\�<#���F�|������=�� g���A�q�O����59������^���|�TQ]��Z�R��.�'��h����\�Č?� ܮ��Bx�(s�w�8�W0il�LjBU��A��U���,�G_7d3x2��]��TI�� �����\��h��;[���U��/U}T�-I!�`�o��Fg��o�i��g��:*z �S����.����X���M�V�M��
��oʣ�c�p����Ua�`*í��G<$�$�l��,�������4_�N�fc]�[��ŧ��Ol�Aܪ׷}_rm�9R 7M�'�$�MSoHڷ@
��%��o���V�>��B�k��_;�^����v$lEe.�ժ�{7dj=W(P\SWn+����Uʖk�+��������S:�wR).+(�:���([����a&�t2��,�Q8�m}����$�G�.�(/NF������+�|�ru�s�9DR`M�F]����=�>�N��7zpD=B�|��耢�x�ҋ�Vt�W9ӊR�R�S!k3s�\��,��/,���E�E����M�"�+�靖K���߾��BҲ"f�]}�7��r��p�nf��d{��� 2]=�ƽ����Yd�����O��d��L�9/Y��F���Ol\���m�5�h�D���f6�HQv��� 5M�P�W�xd���J�e-��g}yRVd��̩���*��{Gyg�P���1VҧVX�˳'6"�l>��D�Y���K���ķ͞�_�0�Cs�I�NO���2��B'&��|�pʲ���ơ8� �_(y:�l]`S~����@ �'	�|`�?�,���udI������R�r&��    �E�:��;CU}��9(
�ܶ_�f�=)�/�-���{���Z���@��-�/(y��Eސ�9%�|��H�vmvԷ��ȭ��mb���Gn������"na4���#+rۺ�g�#�z�Gn�:� $���P@��(����<�W���m��Q�ɐ�D+��u*��i/IRn;B�C��1<��bȂ8�*�iC��'R��@��e�)���0����O�n��#d: zߏע�	鎏�A��D1_��)$�T����[�uJ�m�%�\�x �~Տ�	�#��m{���v�ƹjt�
�Cn�P�ַ���v���.�� Z?�$��vo�a{ny=�y�&��@p[��Z��М��������ޝ���s��qY}jڭ�܅���~�݊t��<�ۓY����u�vT�q=�)F����s��2I�o̦#��/z-�N4�q*
ں�r�1�6�P���-m�*tU��2�4�(U�R/FN�8�l~9�p_rף�y�`��6�f�F�W�P��R(�j���b���u7��ˆzΚ�������	"��3�I}D06�$	�Ւx8Dִ�љ��4��j.y��1G.C��鬝`��QX7�B;O����9��O�]/�0/��l�i U����t��C����Ԟw��)��(�Y&`��ڰ�aaڮ��6Է�j�֎�1�R��!�d�����VH0-Z�,�`:���ϝ/fڠV����r��3lSRq�i������PP4�ة>u0�0��P�M0.\Yw^"3=��L��`�6(�Gl|Ce0r�PXO{k��}�Yߛp��C�Oe���6(��6��}E�82u�ڟ������n���z�U�G��ž7�	h�������BK9�K�\�,��s��L0��{#��B�ݦ�����r�Ⱦ�M�o��I��	��㉌��ͅf?��1�������3�F���Ӂ���_�ghHC>Iu^����حFq�u�A�s���q��hO�x�<����r+�d��&v��Ok.��g�L43��)����{�}i�@a��nΝ���3$��LUQ���Ld�!�`���2�љ�e�οm}�$���p�1s�����UB�|i��\g��D�1bc�ۚ/�V�w�8�B>�Rn8�of�3K1�Ui�;�S�������]�x�Ǧ�6�r�x=�`4�؍���(0��50�����G须�%Q�pq�����^�=��W˯F��9��_�[�z�z��*�e�~|�r���J��M������(fn@��f�9���n=g+�=��ŷ�(�U��'��ʖzE �_�(��T��B{J���s���jH�2�oj�^����
��ǧ�Pؖ_�.P8P�{h�X�ZXx�~�p�ť}o�!���zh��~�\�f�G���Eڬ׽����tE8���5����#gd��ֺo�CAܗ2d�1��ǈ����y�c=S�1B��˟;��d����ۯe*&��@�c�ω��Q8&�Im�d���jMM9k�����<�k�W�%X��.�6�p�8������������zr�sO1��졜]vd�� c�W|z����H��QSA����PN/`�ߴݩ��e�����J���Wkb4D���Ȇ#1����-��W��w��p����ڇ� y�~R��7���*�=?r�]�����/T���k��H�n�μB;���TR[$��K�UO�����p��#��7�2/��io�K��p�R��L��TD�����>������&&�گ0��r�Ծ��/���7�+��7K^:�o��.ɕ$�ݦ�����g�C���F�v
��%�%�i����eE.��ŀ'i�E�Pm��}F��ܬGI����&��v�q;����_��ￅ&�7HR��R�\�z��E��g8�+غs�P6-�ͽ�-ɗ,�b�UJ�e�uPQ�Ν�R3�5��r�7Xz鸦�Y��ګ=�y����R������$:j�$�{��}�(�:�����d�^8~�C���[߾���o�_��|�ƍ����8�
��|��RC�(�?�{6
]�
_��Ν��{�o���Z:!���go,�^.��+���B�&��~9��#uKaUѱ�#�Y܎"�X�������=��=���N���(��B&������=.������̗*�v�W�w^*E�����"�Wh��u��@��qC�,���][r�J�O�����j��˦����h��C9��!�^��˙ױ�,,z�ʮ�#U/h�T����ҡ�,dK�~��5�}Y^��-�^^�-*"����./�������� 4�!Y^̟ظm�mQ�ne����$�KuF�q���h5!�!�,%O�/>�u�ch�e2����7������#y\�Ӡ�=jQ_&O�x"6�w�����<n�����_}K��?�ʚ|5��"�����.Aa�5�������$�Y�J%�_W�?,v���6ץ�y3�e�SjD$�T� ���HS9�F>�hd�.���E%���䌐���jy`/�B�>��'���#�p��o'Ql�(,��f�`DXfZO�*X�(T����:�.3���>��y�z����+�bR�j�#+��h,�C��b�Oʿ�Zn.��T��]u3U%�v���VJ(�o?����Sl�����.��%�Ͽ��%�CǸP�߹o�Bf�&M�R���A��~sm��Ǣ�(*������j�i�Ԙ�"�	�`���_-󭼍:Q()��e[�t¡��h�S��iTlA�x1��砂�( j�����q����ǃ�!��x�H\v���Z�`�f=1�"�����0r��PMl>QĎ���}�<e�3a
�д(��rg`�%)u��Y��t`r�+�=dqޡ\��Z�}s�Kg���:x�����;�����Uw����~�~�p�(�7��I���!ngp�wfς�kx^�|�m��#ˀ��^�]Uj�eؙ����Q_�I���~�Y3���(�S�.�r����v8X� ����\YԱ���쨔A-m2���Aj��oq��Q��&������Jf��v�)^v_�5�y G1��R��^/��䋋��?�|@'��Eےy��mi��k@�Ղ�����3��|8v�&V�*
뛉ٯ^�ظ�(���/vo�J�
�>������˘�p5�yHʘ�}��dLR8XO��ƶ�p8���f�6{�)B���\P�Ҏ(�t�on�Z-&��Y��{	a��Y(n�p�#�+d4�����������0m3�O�j�a�_ B��=��r�=H���8Ԉt���A�����w0R���l,y�:?��&����'�i��=u	c�᪳�R|�'�*�;�QG��nS�6�4	ŉ/i_߇��0���]�	�`�/�8^s�ƣ*7�(�[*n'#�)�Z�BS���>�%�z+u��1ؖ�ƤS00}��c�+��=�'g
X�f�T�c����}	^6�Ak�����f�~xF6-y�g�vQ��c��vn����UF�2� |T1�^h)�j�FK�ޕ��������0r #��l��i����U�.�֒�%2?f~����L���`�	��|����9|�m�kK���;Ϋsm��R7��i�|�?�Ê&祗ͩ������MLGv�[X<�:����&
��p�Z. @�`0 �-}�j �������n���a�]��t�𦫹u��%f���RjQ�_�ӕ����s�Z��S�NV�=�箤֩b>=C����=��`3��f��p��N���#/�@�H,<0�޴Ի�_<6A���/'=����#�[[o��ܦ�d�����:��Y�M̍�����UI.Ms�HiSh6�{S'����0�M0;���g�?ے
^�1xѝ,�q,T�}�s�%/6�nOᔽ��1?�O��H����m����Ā�\O\\�3*hA��ߛ�;=�W����e/�-�㈷�L|����y��^}��#w�e69��G>�t�m8�x�=��C��8�/
F�J�W��ϐ    *��޿U��p����m��o��V�S7m3muzε1Գ]yM�n��ۦ��N�L�I�\��R�����	^��ZF�_<��[��p�w�|s��d�+rH��Y�Y�/������Kw�~���L=�ٟ̓�*��`x>��`��ّ	�J��(/��ԭN��O���՟�ڈޡ�M��q�g���LkU�6�<�e��ް`p:�Y
ǁ�G��'�_m\qq��§>�h�9;�\qRF�7�c�v�o¯>[�Ҝ���!}��]� ��Β���v�˹��J�.d8L��Q�R��~_�I�7"�F��l�0!��$@��S��N���]�r�Y�ҩ��rB<������g�~m+C=�L�fOV�+��C�g}�s�s8xV���3���z"q��~��c���n�\z��ܮu�6 p�Ч��b����̝�J�i���m��ѭ�u\���<�������ܯ��T��J�h�]g9����qW�ݻ����8�t�,�{K"I�%�����H�n,�o9�ң���l���DQ��jb������jj3TuQ?�߫&�3��7��e�e(�LՖ�������C��Mj� �m��ڍn=�w�q�t1ljR����c}j���^_-������x��m�65Ȃ�w��g���������# �/�;n�y�ZP�p�
�PrH���}ٚ���Aտ>Ji!�W�KνDh�'?d���݆��qr�H����u�����gp�Da-E�9\:�".>��ο�i!R��mà�ߘ]'2�����x}t6V��|u�nͩk��L�7AsA`�ߘ{�9���+��h�ª���v�7쨤����*����������>IC��.�dr\ڦ�[T^s��+֝�N\��aŊϽv�~4l��Ӗ۲��f���>ˈ
��hMk�nM%�y�\*��6��_�����80��e-��T�3�(�d����ey:�YY���w� �i[�
�� q,��[ �/��r�H|��G^����\W�������w�D��8$��3k����e7(Y�����T�.���,��2�f�q���oh4	F�_��s\������s���kP��{cO�����6�:������Q?��e8�p��z��"��������B.{��8�G�sx�ptt��w'c7Ñ���_s_��u{������@�0H�Qpx�{��~�D(R��οS UY���]��&i��+�t(/����	{9�5q$��,��(��L�9��|�P���z�;�mT����5SI���q}/
-u�-{VI���m"L)�C�P�h�pg��+��{B�X�<��
/�O����p����kx�OζM�����"��ݼWO'_N��-a�N��E����ǲݓDޓ��qZOLuP8s�kc���kw(�蚊�*u �ok��|�T�MT��e�9�!)TY��g��*�~�

�_����:n�+t�|ݔ��%�Bϻ��梘BGϻ���	^��5�q���r�7f�}�^sG3����C�z����5'��Z�"�$k� il@��ʞ&*�/ߟ����p������d���p?��B�s}�{[Y?Y�y�/-E�'*��WĒ�{�s{�L��P��s�q[-����=Z"��ˮv^�UD�-�u/���I3��_P�C@q2&˕,ro�� �`t1Aw'�"J~<�ɴ\�?��N
{�[r��;��A,Uj�]WYw�ܺ z�����ۗߝ���B�_����2�DD4Ý�]�ԍ�>-�ꐗ�{�:�-���WW�6�u#� ��@�#�����#I�N�)"1�������$:��0�iOL6(�����-U���k*��[�v]��ri5x�uK�����n��氃��4��W58�*��P���]N��^���]�qE���E���'=�օP#d.=�H{�?Eq��f=T�'��4�����W�^������\1L
��r�����מ��lE�s��=���Bg���ɘM(�F����4щ8$'�&� ;FĂi�*�K�x9���p,y��wɌ�����=T�Y�E�i�Hg;�U���A,>�^%*r�f���י�(��>��Z��
�:e�KG�z:��X��z�Qv#U|/�'έ�ֳ26`=����g�.=Z;��#��X�6��7��� �v���@������.�8�FSK-��ʭ����ׁV��<�I���N�ݐ�տƙ}9��5-���g��2�}���|�mJ�xL�q|�;�����{�艒}0~��kAR��Mwd���5�UG<5��N�sE�οE�S:qxx�KA��7�R�h��)H��w�]�5���������1��"�S�;n�ET�MYݑk3X��Z�dw�2�i��഼�����{d�(K~g+zM��`��M����^n�8�7
�F���]�:����.�8�Z$/JĆm�JU�A�
�����eS����U��?����`vP�c��oEW�*�/���9�|�] �?Hȡ��)]�T� m��v�<�B?ǅ�:�>�J���a���{�����|����-�X)F+U䅌��aa1X�c����tcL�XM�육���t����(6:]&S#.n�w�˞���P��'�.G��-������-?ړ���c
�E�=���\���������qj��ŀ4T���,�p䧶��[���Lŭz������3�*M��'�N4ڦ9p6�_=���ge���i�P�d5L�|��]@��MW� ���r��x��t��K;B�q75L��4��R��j��Cي_�7�]<�J��=Y��]$��Ȅ������LT�]L&��;�x8k�w�]��D�j�8Ux4"��TEsog��PL�t6��:�m,�ؐ�\���ܧ�M�����-�G6��M�����T��.'
������2`@�$�w7�%l�u0�&��M�昲q�p�����q�p?�+�G
��
<���y�a/��D�䱍�kIّ2[N��ɞ!}<<�C��*�^�cܲ����J��*i	�2�LY�x��y
ˉ��oQ�A�^���rK��d������i���f(�F�҇s\�2<��c-Y�#��%U�e:�z[��Y��wm�m)����f���k���T;��gk2dK>`(3�����[��'�}ٴ��w�����ex���#sKY�����,W�:����<|������_��gț|�:S�NL�H�|��а�vL$N�x���;��T���~f:�s:)�P~�J �"�@�y�"�$�5?w�E�Z��Q��F|�Ȏܚ;���p���G�K���ɐ"�-[f��-)�2C���N��`$�m��w/�!G2��E<kdKn��9P/�#��$�����>6�H��p܊���v��pz���F�Is`dF���61dDq���~>�>���G��#r���{��FN�q8�Z���<P���m�ɦfHx�va�bns5�ے�+Ȑ� ���\[�H�T�r��'���Zn��̐���Q'g�-~��ʅQH\��v��ŁK��!�g����l�8Y�~���,��ޔ����GSs�n��
E�f�ܒ{1uT���A�7dH3|,�sDx.f晳����l;�';�q������Ѿ;q�-♗�)?}"�9���6Se3
���+�$;C92@�	�@�B��9R:G��Ȏ"���4!�i��`�Ҝ��f]:��Z�,�cs�DJ��
Zr��i�]k��(f2G��z�Գ��g��P4f��ɣ�
�~O�14s�6F�p?�yl}����p�q��fSRТ�">��r����&棉7�]�x1��5mM�u��'��f�0�Zkb������d�E� �2��ˤ�K�a�y�3��<����c1���PЩ%�Y��'y�:�լ����@��:R �@�*�r?n;�3X����۞���*G&Ρ��_���r0u�t>����\<m�+�    umC��N^F�Nf��35hJƨ5�sK��⡑a$����,ڹ4��!��e��_l���y��TD��Y��Dq0#/�U�p�\{��Lm���� V�R��!��pE+�z ��n_ֆ�ˍ�u�����f���hj��y�2�ԅC�ߜ�Cm����X�`䃁��*q�$���~��7��:U��ݕ-��_�[h�����ֽ���4t�o�MO��؅b�^"#�s����;��:0ή�Mz�C���`~�%���uD��=�����~��a-<r�P'��8��u�r���ɰKY))W��Y��r��\��n�5k��Z��`��~��=,ǙR�ԷN�@]����U�"^���-��Dd,;΋{�k&c�yq��I��E�����q��S���}��yd: �v�ْg������g���F�P���7miO��,�ӿ&��`���j����^a<�����"��3�6n��s�n&$/̝uZ�`{�`$ܫk�����G�Uyܘ��=$�[�M}�&��Ĉ:�q���K��܃^MF.a��/��cn�0�� �=�{� �a�Q0VG��cF��ˮܖ�5cjD���Z�`���0�#"R�/7�c̹ �~�V&7�����Em�\Q0sJ�2�ivCYW0�����uN�Ҵ���3sv�P�ſ4ǃab���e��Z���:8B���Kq1���Sq1�h;�'~lDk6�|=I�C����V$�����W��)@�;��m�Q�H������oy�-T�mw�sEm��\<���ݤP��Aa'�v��SAU�j�{)[c��B���A�8�*����B��뭱��Z�;�Np�*���P�̇�a^
�?�$Y�������U�߭ ���T�_F�P�DQ'��!l]�~��n=����~J�.t.2?%�Pr+F��DL���~Vġ!���9Wg칌| w�\GEl�J5Ѵ
����Q��"�q����:4|#�����P��J�����w���eԹ6�h��Rh����|�P�w+Q��xJ��AE��ϋ ��q:pa�	���t<���`h����[��dP�W庩g7��v�ƌ��Y�� +�m���V&�D|B�ɯwF�8�,9�A�P(���^N��7�$ 
����D�r�)4+��O^�_����Bl��[���!�,�-�~8�E�H�(���J��*�o ��p�.���U�%�
��p��N*�$����T��QƩ��I�����̭��*��jk�Nfp/g1�WqP���]�3}�|0tJ�m����<���d����A"��-9.�X�����c��~�#��A���V��H�$��'a���~A����������P�&O�K�nS�R���sC~8+զ��F*�9h�l��ٳ^����V�J}΂��K�Z�p�J]�Ɩ�`� J}��'�GQ��@�.�H��uEd����戄��jRkƈ��)�txj��
��Ŕ�դ}�{2�3��%���,ҿ\��[C�ns���X|5�\��Fk��l���~����U?��T�UD6P���`�~��&s��T{�(��R���d�Q0Zu�E��j檧?���l�B���X<���/�l,�x_�%C��Ue����<R�>UMa[5�5u� �o����pZ0
���y0:�эN���f��y:~)�6܅���渁y��
�q����S�,�"v1y.���w<��?w\=�TWXT�)��
�ˈ��K�T%������V���n��y�53w䊛�ʭ�-�[�wg}��Q��5	���R��<�xd����A�U�R�l�<O��o�_l����Ԙ��[]��7J�݋���=)K�N������d>��SԽ�Y�k�������A+�n>��D�J���rE��A*��Ѓ��D������z�+��6�N�y�?�$�Ȳ�yQ<��>����f8�y�P���>��D�@�x�{)���;L��|�:I��|Ծ춻������S��`������C��`C�cC1bpJ/o(���8N\-�|��x'��
�	���6�ʍ�u@�^�꼵|5�\��ݹ�峝s��wG�p�Z�]%ǹ���մ�z
�:\�C@e��bc5(�tl�n��T�����t����=�� �8�/G��4��Z6myg��L�l\���^�)��[���5�6��v�5_���kB:�[��< ,U��[��K�Gj���9�|O�b���Om����j���ÑEHs�NfSAsմ1��$߉���
^T�0�w�R6�]`<�"6[2�1�6�_��aˊ����=��б��W�J�O.�	����3u^ �O�
HH�ф���5t��FÕ��145�}Go�Z[m��Px@EG��Z�����"��5X�k_�!�f�A�m���0d^��i�>��W*�ݟ���g�"�5��m`����Ͽmg=xu�`����~�	�i�j��Ħ�X4����J�@��pv����j��ה���e�D/���y~�p�����8����D����P�0�!�KA}��i�e<�eY�.�r��/B�Qx�괢)*�����p�:W�U_k�Gƣ�Y8����T�dփ�a(R+�=�'V���[
�>�uݨϖ~��l�_ֲg�7��`�V<s�6C��W������}�Z��ZR�����'�iU��ƭn�/n��V�U���>]n���%�1�k]���UbY��=P�,��w]k�%}��_F�I���7:`�m���0��$@�?����.+(�Q�aH�Z����#;%��-ih�Ԑȡn�:�1ThMن^3�~4���k*ʣ��C݋`�V՟� ����x��`���yR���衰0�O�b٦ⶡB+1�Ck���n��L�+�5���Q�b�+�G��ƶ���;N�}iN>l�'�w�{��q��Uw�-n;�?�BY��z	����|���8Glb2��'e݆�6�3��L9���#?���<�f#Cы!i�C�h̳���K�[�o��	�=?�k݉�
(��/�UCY�fm�2�%�)��8o��tYr'�?����'������={U�B�d�m*�����.�x�(�xS�CkF��`|�l�c��gQ&�&N���iD�H��q�u0TZ�6s�y��t13�/���b�'c[
�Ext���A�?X��fj����jK���:[�	7zr�7�ogS��`�` ��K#b�9p���֓Z�`0m_�vc��)��{Q~�4>}k���=����H�Q&VaN��*�l�g��P��-fcqH�}�G�`�
>.�kf9Xj�����P���H���)�,J�	x��r{����=K�Ⱥ��^h��T=�>E�恼j�U~6{ңT�-�,Sء�1HHj�̂�E�<1ѤҦ�����v�e�K�+K�}B�������R%�%)���`��ͩkg�� 1W��|�t0�s<�=rK����c؃Qpi�"�ӵ�SE��9G�@*8'����Tq���t
�e����ŝf�c=�(�*Wk[S{�d������S�.�.Ҩ�J&�k���R�P��\)��|�n�Nu���i0L��J���YmL�8�F��^L�J}Bპ|y�cВ��:�B��J�1�x��F��T:���"U�7]K���/��P�qa�j�k������6�Ñ�F��{���e{�͎z��o+��P�!+1�
*o�k��Ax,�B�f��x�P�M�V����T�����O%*�@|cO�ۨ8�D��8����Kq�$pOiS���R[M�b�V�\2ב�ٜ����$p{A/���Imɝ����BQ@?�`�)5}%}��~���K�u���7Ѭ�r���m���{TKE���$����=���DƇ`���\$�����+�BU%ޙ(�r��j���@�����ݍ�l-�#I�t���2��QuxwlXS_��*7B��olǭd*o�8/dHץ
�;܉r{�7_nS�w�~���
?�fZ�Aٙ�v���x��Z^Y��1޻\�F0�懦��4_���h#8��c��N    P즷J<�zx �_�˓�BC^m6E�4[��c�^'G(��X���F���V�lRݪQ�.�CH(���({��d"W+�>�Mw�F�W�YCd0N��8-�ƪw�z<ڿ(������d����B}�4
1#ջNv�-�+��R�L���a�S$f/Ͽ��av��*}�ɕ�w̲�;��K7T.a�E�U�/ٴ�J䛊��d���_�5������7������Q>��nzXIי;mc���Jᇙ5��Jx�?s�ۯ�A.��T�����&۴\��JՓN�;�!)r�}�h0ҏ�9
5"�@��4u1(��#{q�`���Y��@�c���t�S�q�U�=�+e�M9�)9�[�6��?¬@��j�-�x�2�8zy��m�熠�_5�&��c��Uӵ��?z%��ܺ��U�O�d�(A�ڭه~�U0M9նa��ҟ<{c�#��@�;��b����4)Z
d�+0��n��] k�3��Yp�]t�_6%)�(}<H���̴�T$� ��Xs���LΪ�=`-2|1�
��``"xl ��m*�-Q��Ell ���vs8��,H��p�����:®���rs��FJI�Y�h�(����\��63����;
�8���M(۸W�]~Y��8�6 �'Q����;���%4;����p1��K�n���1(�K:��~iZ/�Ô0w�~����"��/]|�e��k�=n0�}�礟!��a�c��`�/ݿf�#���;��
F�_��A0p�@��p?�P��q�0wE�?���qI��r�9�*w�\3�6G�Z��Lm���e68q��2�R�Gm�b��G��G��zו'�y_j�Z���{Rk��s�;YնZ���U�}�=�$��䏪3����_��.�ᅍ�p*���o/�W1Q�lzI�`�Bq�����,9]�E+\Q�P\�?��8X�a�w鐩"�䀙�� ��:���5��s�ٹ
��ú�Q��-<��Eo��v;�GRk��u���@l�8rѐX{5�``�?H�M�����N\��C�0�<���ϼ��:0Up$������:����I��;����t��*R����oTǧȼ����&���p�Cǽ���1�9�`t�h�W�ǔ08����.��=��0��ǡ�L�@�� ���z1���!W�^	��s�v�^�ܠ�,�c��z#n�cw�~���6�~���Qof�J���A���Q+������&bYȽW:����qO*�>�s�����%�ޝ��U���58�w�u�q�y�c߈��xEy8�r@�n�D�c�����7�E�7�]ْAb�jTk�6����yr�ߚ���w��;N;�\�ܕ.�M&9c1u��8�L�P��\9��u�:�ٽFnљ��Gs���~���)O����<0n�v[�o�!uhsDJ�aul�P�7f�5�;4�}�N�6 /�ٻ��sG�a���V��;urN�Q���*���n����(����ݍ^���p��3UTX���ܑ"\*p�
Fbxs���`��d������gS��=����ET0S �t@N_5-U��`p�Q .7W��T�8����*s��m�b�����o��v�/J���X��o{o��A:<���p��%WP��W���ۆ�I����U��t����ʣ�~S��8�l�*�ns���B.{$Mc�T���R�NEr��9���k��\$����Ԟ�\�xh��K�T}?�cK.ԍ�apZ0Џ����?E>Fɡա�JSo���L����65��/�DȷV�[�J�V�@,�ـ�V��4<���,�J&$�����p�Xx��WQQ�G.9��G�JԡI�%c��DS
[���&' �{ �,,p��MCыI���;AG�3S�-M{�%Y����e�&�d�ۅ��g̵o;�\�;Cf�����Vygc9���8�j�Zs�vWR��]��G�%�?��B��Rkzլ�r3�φ_��@�~ֺ��0!�U_k;�3T\�d�k'ҹU
�k;Н^�����ԧ������(����d���D�6���ͽp�Q�	6�}yWF�7���EŨ�آD�]\K����C���uְ�Awh�L�#�6q)�ī��ۆ�Ы��k����ʁ�!4T��'�Kt�'}o��\<y���Ί	�t��E7`���"H}bO�I1�܏��ȈB9���f�}��{Y�)8|��y��h?��1��P?��UI9&���7�UQ�	B��zkFY�`�xԏ�-�g
6��܂��b8hhD�
Z�ǣ����9`��^�,j�S��w����.����%p�@�ܵH@��w0�2�����$��u�9d��=4}c6��b��|���Px�D�`	X�kw,�\�Tw@
��{�m�uG>�G��1�E�����c�2�\^;Y�Jջ$c��Ku*I�����=�.?R��R���6�kG��R}�I�.]z(��I���G�|h���`(��1-	��cʶ&���cf/H��;�1�#�wA����_A��eb�Ø�(�?L��m*J����ae�1���.q��a�����3?�^��"���+)��k�r��%*��N�U:.�;��`�]<g��(ꒌC
2^��f���צ�{r�N��_c�檞R0�@R�B
>��4�L���DM=�*5M�l�QI�4�[�;�&�����A�2����,<�x��;���҃��4Qw:�Ze��;�~]�L3���{w@2�N��_7��l�n����D�u�?��H��4�"8�MuJZ��i�`�
RХ��#̥;}�?�idol��V�VV�[P@��0�7ee�m��l�!i�^t��5i�{T[�wC�,�H�]�h*����L��Z3W�a{��S颙`���z�(&>�>1�լI#�C#��Ė� �'F��nK�T)�����2r�Xj�~�6{{<r�)���wf�}#`��k�K����~�:��*��J�����/� A�ߘO~rt0��h�q'����;!J��?��$Q
������ޔ��`��>w�R�ܹ��'��:q~V�g@���L�p1J����(|0�������mQ�1��3Kɳ��8�����Z�NA��V�mD�h�E��2�}�gO���o�]��������w8��zC.�su��Os�����F�9d�R6������/�ִ�zXD�P
�]F�roT����
���nm]QrȅG�
��I�F��P0̗5;�c�����IA�5���lmv
b��_�����k�n��e~%w�_ȡ�=JX˞��,,�:�TG��͝a�xK�&���|˖Ч��]�KR�����t�ɰ��t�Cj�9p6�e����q���p��'�n!e�xbi�aC�?6$���1�q�xd��� y�R�|�Zv^�5��MW���9���M��讗�Y���<��bt׷GQ�����^���j���G��=��>�}�]�nJ��L{73R.���b��b>5S�ՆS�wFF�����O6�X>�!.}<�����X+�=�_�ў�vMYIF��=������f��!?�ɒtb`˵�gI6k7����9OO�伤92�����/����ZW �%�4�^a�g̒�_b%e���`���C���Y�;����h tDq�Yڻ,u�̐W�v?ODqٌ�!��̀F�%e��d����t�Rđ<C��h)IW�-z�XJ��=\{�_ɌJ� .��!A���s�N�����ΐ���*g��]����ZO��g�dxK������f�hE��_iQ������F8��,˞���˲,�k;$�e�c;Gz>��2��t�E�f���ڥ�;�h}�,����;.���n7������X��yQ�DA�EMM@#�ʝ��Ao��6���P���;Eey�/ntIV�d���잽��?��g���-���康���p�'�yUg�!2)�`яEA�J�3�O�'߻���投V]�"$C��C)�L�O����]��;(\�Vw�i>C
�C���1
�jچ�.� I  �1��mݡ���%Y�!W�ۓ:^R$�{��9CN0��0C>��=��8C"D��ބ�C���K"rk6\[\�L�-�˩�	��[C�� G��dH���;�p)p����2$<n���=�E> I͞l��%(j�]� -0'
�-�#��}P�@��X�7�Tj�=�i.ՁN��T��X��I���Kw�nd<n�f�hw���� �q����J�Nd?h	�)�[�_s�'���v/Tr�/'��2�:n��Y�J6C��-��~���������M����V���mg;f������R_
�ec
�3$+��rs�p��=��ʐ��im�Pi�#��ه�D�׆�#����sá�}~�mr$_I���O-[#�#��%ɜ#��0��N�棩d��~v)�`��y���:�)�"G��|�[�l�G��J�;ΑP�P���r�	��$>�m��(��	��ek؎�	���q�A9��먓O�$�D�9����'���,���T����cs��9�~��P�A�����ޓ������S?���!MKE�9���붜QY��ŵ��:k�i�V0\<�W� a���2똳2����P��~�h0P�������p;�ɊP���n�,�_�T�P6����5{��S��9Z���D04�����G䷚��b���#��uB��ϥ��}Dp�V��;u���Pm/���[���/l������x�]/���9H�
���l˪�v����Z}?v���\�M�M����O�����־�' ����C��,�_$L�S�sbl�[�	�}��_w(�p~c�9�q3n���t�E���\m�c�
<�KP�i�0��ͱ��
�a�$o�a�r0v�1��lQ��-ɛ^M��(D�X����q��"�e�_;+[�)���C�_|�����ٙ���?K�|��`>�	A�;��!��'�i��Dmt �_Y��\u]?������8���dE�-��Օ�r��Iب���H���F|���8f��#9�`8f��H��'��@�i��y���\TGژ����n�f�l��Yg�6VT�N�2��d�v�~�����0ٶ;X
����6�`�Z�1~Ti0�O+�ԗ��+����+�-����:���g���l����;_n��;�ެ*�j"��U��|)�mQe����m5�P�bP|��+�l^ʿ����=��?�r9�*��(���W���p �Vz)mz1\���(Yu+;/.F�c-���BŇ���x3�?v�ec���@�!*�-�l��c��(:�qc�Z)���_/R���M�R�Fq���)�ǎ���D�C�P�o>�*�����S$��W�"�J}H�D�y�e�H&�P�"_��R�i���j�j�#V=5��{֪��sg����`�JϚ��6�E��W�J{��;-G�VG}^�ȋ�?��
��?�w�*i$�9c�*��|���llSkmQ0|��yOn�����*����r�e25�no��Fr��t�1��*2��7��}i0�o��6l"�M�����[�܃?45���e5��|C�6�9���4�8\dc��o���T�I��7>�|l��&�X;c��m��G�(K�CKB9�����8;Cg��W�ohh�ц�Sݹc`oj���-�W>�(��Vח�8[�
�����c���o'��J�{K�Y��[
��ʰ�8���ÿq>*���=�=9�v8EE�v����ŀ�!

d=n���
d�/R�*���P����ٯmCw�\k	=<o��ۓ��*Y�Z�r���4
�Ϗr��#�$	��	@����áZ�rҦ:_�������^�U      �   
   x���          w   �  x����N�@��<�v����Q�b|�b���I�����hm7��Nw��/vfƦ@L������o&+tR�*+�:v����6M;��g��D��藚ζ�L默��O���j���al%�.�� ����RF]ԛw�n�����9�Z h>�A7X�0�#.�k��i�m�z0;`O��A��bm��/�����D��;�M���9�t-��,�!�{�?x�\R1�GM�o����l��U�Ow�V.�nD�uP)&m��y*�I���K鍯
�ӆ}*�B�fݸa%�H���M��K���TZ��c�#�*�b�#8c�Z=
G�ň�xW\>�<V�B�F�m�Q�J�FLvU���nh�J��%���a���OԱ��B@-	��IJbi�?UB��ĵp.Ƥ�6��9e-�#&�j��3[ǽSK3��@��j��<�6�N&�R��      �   
   x���          �   
   x���          �   
   x���          �   
   x���          |   a   x���v
Q���W((M��L�+(�O)-�Ws�	uV�0�Q0�QP/I-.IUGb�� P��-)*Mմ��$l����1PSqb�:�B2�a jH+P      �   
   x���          �   
   x���          z   �   x���v
Q���W((M��L�+�,�/(�O)-�Ws�	uV�0�QP�/J?�(/39_]G���4UӚ˓8�F@ݎ�E����9�7��c�1��d�o��Z�RZ�XL�fS�f���2����&�#��� ��w*      �   
   x���         