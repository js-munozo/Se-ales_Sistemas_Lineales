%% Trabajo Realizado por:   Johan Sebastian Muñoz Ossa  -  jsmunozo@unal.edu.co

clc; clear all, close all;

% Lectura de la imágen y visualización en los canales R-G-B
image_1 = imread('D:/Universidad_Nacional_de_Colombia/Señales y sistemas lineales/Trabajo_extraclase_1/drone.jpg');
imshow([image_1(:,:,1), image_1(:,:,2), image_1(:,:,3)]);

% Ver el nivel de gris de la imágen
imtool(image_1);

%% punto 2

% BMP, CUR, GIF, HDF4, ICO, JPEG, JPG, JPEG2000, PBM, PCX, PGM, PNG, Pixmap
% RAS, TIFF, XWD

% Documentación: https://la.mathworks.com/help/matlab/ref/imread.html

%% Punto 3
figure
% Lectura de la segunda imágen y visualización en los canales R-G-B
image_2 = imread('D:/Universidad_Nacional_de_Colombia/Señales y sistemas lineales/Trabajo_extraclase_1/tigre.jpg');
imshow([image_2(:,:,1), image_2(:,:,2), image_2(:,:,3)]);
imtool(image_2)
% conversión de espacio de color RGB a escala de grises
figure
gray_img_2 = rgb2gray(image_2);
imshow(gray_img_2);

% thresholding o umbralización, mediante el método Otsu
figure
thresh_2 = graythresh(gray_img_2);
bw_2 = im2bw(gray_img_2, thresh_2);
imshow(bw_2);

% Lectura de la tercer imágen y visualización en los canales R-G-B
figure
image_3 = imread('D:/Universidad_Nacional_de_Colombia/Señales y sistemas lineales/Trabajo_extraclase_1/paisaje.jpg');
imshow([image_3(:,:,1), image_3(:,:,2), image_3(:,:,3)]);
imtool(image_3)

% conversión de espacio de color RGB a escala de grises
figure
gray_img_3 = rgb2gray(image_3);
imshow(gray_img_3);

% thresholding o umbralización, mediante el método Otsu
figure
thresh_3 = graythresh(gray_img_3);
bw_3 = im2bw(gray_img_3, thresh_3);
imshow(bw_3);

%% Punto 4

% conversión de espacio de color RGB a escala de grises
figure
gray_img_1 = rgb2gray(image_1);
imshow(gray_img_1);

% thresholding o umbralización, mediante el método Otsu
figure
thresh = graythresh(gray_img_1);
bw_1 = im2bw(gray_img_1, thresh);
imshow(bw_1);

disp('\ntamaño de la imagen 1 original: ')
size(image_1)
disp('\ntamaño de la imagen 1 umbralizada: ')
size(bw_1)

% Una imagen en general 3 dimensiones [ancho, alto, canales]
% para la imágen original la cantidad de canales corresponde a 3 (RGB)
% para la imagen umbralizada solo se conservan 2 dimensiones [ancho y alto]

% Sin embargo se conserva la misma cantidad de pixeles, solo que para RGB
% cada pixel varía entre 0-255 y la umbralizada contiene solo 0 ó 1

%% Punto 5

disp('\ntamaño de la imagen 3 en escala de grises original: ')
size(gray_img_3)
disp('\ntamaño de la imagen 3 umbralizada: ')
size(bw_3)

% Tienen la misma cantidad de dimensiones y de pixeles en sus dimensiones

%% Punto 6

% Creación de las imágenes con diferentes patrones y tonos de grises
auxBw_1 = false([256,256]);
for i=1:20:256
    auxBw_1(i:i+10,:)=true;
    auxBw_1 = auxBw_1*0.95;
end

auxBw_2 = auxBw_1';


figure;
subplot(2,1,1); imshow(auxBw_1);
title('Imágen de lineas horizontales en escala de grises');
subplot(2,1,2); imshow(auxBw_2);
title('Imágen de lineas verticales en escala de grises');

%% punto 7
% La imágen en espacio de color RGB muestra una gran tendencia de intensidad por 4
% colores en específico (donde están los picos mas altos), esto genera una
% imágen con 4 colores bastante intensos. Cuando se convierte a escala de
% grises se puede notar una mejor distribución de colores en el histograma
% con una leve tendencia normalizada, por esta razón la imágen se verá
% mejor en escala de grises que en espacio RGB.

%% Punto 8

% Graficar los histogramas
figure
imhist(gray_img_2);
figure
imhist(gray_img_3);

% ecualización del histograma
eq_img_2 = histeq(gray_img_2);
figure
imhist(eq_img_2);
eq_img_3 = histeq(gray_img_3);
figure
imhist(eq_img_3);

% Comparación entre escala de grises y con el histograma ecualizado
figure
imshow([gray_img_2,eq_img_2]);
figure
imshow([gray_img_3,eq_img_3]);

%% Punto 9

% Se observan más detalles luego de la ecualización del histograma debido a
% que los colores mas opacos se intensifican y los colores más intensos se
% vuelven mas opacos

%% Punto 10
% Lectura de la imágen clasica en computer vision : "lena"
img_lena = imread('D:/Universidad_Nacional_de_Colombia/Señales y sistemas lineales/Trabajo_extraclase_1/lena.jpg');
% ecualización del histograma
eq_img_lena = histeq(img_lena);
% normalizar los valores 0-1
eq_img_lena = rescale(eq_img_lena,0,1);
% modelar  el histograma hacia una dispersión normal de los datos con m=o y
% std=10
eq_img_lena = norminv(eq_img_lena,0,10);

% Se observa la diferencia y cambios en el histograma
figure;
subplot(4,1,1); imshow(img_lena);
title('Imágen original');
subplot(4,1,2); imshow(eq_img_lena);
title('Imágen ecualizada + normalización');
subplot(4,1,3); imhist(img_lena);
title('Imágen original');
subplot(4,1,4); imhist(eq_img_lena);
title('Imágen ecualizada + normalización');

%% Punto 11
% Lectura de la imágen
img_placa = imread('D:/Universidad_Nacional_de_Colombia/Señales y sistemas lineales/Trabajo_extraclase_1/placa.jpg');

% Ecualización del histograma para mejorar la lectura de la placa
eq_img_placa = histeq(img_placa);

% Adición de ruido para desmejorar la lectura de la placa
gaussian_noise_img_placa = imnoise(img_placa, 'gaussian');

% Se mostraran 2 figuras: La primera con la imágen del vehículo luego de
% aplicada cada técnica de preprocesamiento de imágenes, y la segunda
% figura con los respectivos histogramas.
figure;
subplot(3,1,1); imshow(img_placa);
title('Imágen original');
subplot(3,1,2); imshow(eq_img_placa);
title('Imágen ecualizada');
subplot(3,1,3); imshow(gaussian_noise_img_placa);
title('Imágen con ruido gausiano');

figure;
subplot(3,1,1); imhist(img_placa);
title('Imágen original');
subplot(3,1,2); imhist(eq_img_placa);
title('Imágen ecualizada');
subplot(3,1,3); imhist(gaussian_noise_img_placa);
title('Imágen con ruido gausiano');

%% Punto 12
% aplicacion del ruido en la imagen
gaussian_noise_img_1 = imnoise(image_1, 'gaussian');
salt_pepper_img_1 = imnoise(image_1, 'salt & pepper', 0.02);

disp('La imagen con ruido salt & pepper está en canal RGB')
size(salt_pepper_img_1)

figure;
subplot(2,1,1); imshow(gaussian_noise_img_1);
title('Imágen con ruido gausiano');
subplot(2,1,2); imshow(salt_pepper_img_1);
title('Imágen con ruido sal y pimienta');

%% Punto 13
% aplicación del filtro de media para quitar el ruido, el filtro de media
% indicado en la guía medfilt2 corresponde a un filtro para 2 dimensiones,
% por esta razón se debe transformar la imágen que está en un espacio de color
% RGB a otro formato en 2D como escala de grises o umbralización, sin
% embargo se elije separar los canales del RGB y aplicar el filtro de media
% sobre cada uno de ellos.

% Se debe aplicar en cada uno de los canales de la imágen
red_channel = medfilt2(salt_pepper_img_1(:,:,1), [5 5]);
green_channel = medfilt2(salt_pepper_img_1(:,:,2), [5 5]);
blue_channel = medfilt2(salt_pepper_img_1(:,:,3), [5 5]);

% Se reconstruye de nuevo la imágen
mean_filter_img_1 =  cat(3,red_channel, green_channel, blue_channel);

% máscara de tamaño del filtro 5x5
auxMask = ones(5);
% promedio de la máscara
auxMask = double(auxMask/sum(auxMask));

% aplicacion la operacion convolución del filtro sobre la imágen
% se usa padding = 'same'
convoluted_img_1 = conv2(rgb2gray(mean_filter_img_1), auxMask, 'same');
convoluted_img_1 = int8(convoluted_img_1);

figure;
subplot(3,1,1); imshow(salt_pepper_img_1);
title('Imágen con ruido salt & pepper');
subplot(3,1,2); imshow(mean_filter_img_1);
title('Reducción de ruido con el filtro de media');
subplot(3,1,3); imshow(convoluted_img_1);
title('Reducción de ruido con la convolución');


% Se debe aplicar en cada uno de los canales de la imágen
red_channelg = medfilt2(gaussian_noise_img_1(:,:,1), [5 5]);
green_channelg = medfilt2(gaussian_noise_img_1(:,:,2), [5 5]);
blue_channelg = medfilt2(gaussian_noise_img_1(:,:,3), [5 5]);

% Se reconstruye de nuevo la imágen
mean_filter_img_1g =  cat(3,red_channelg, green_channelg, blue_channelg);

% máscara de tamaño del filtro 5x5
auxMask = ones(5);
% promedio de la máscara
auxMask = double(auxMask/sum(auxMask));

% aplicacion la operacion convolución del filtro sobre la imágen
% se usa padding = 'same'
convoluted_img_1g = conv2(rgb2gray(mean_filter_img_1g), auxMask, 'same');
convoluted_img_1g = int8(convoluted_img_1g);

figure;
subplot(3,1,1); imshow(gaussian_noise_img_1);
title('Imágen con ruido gaussiano');
subplot(3,1,2); imshow(mean_filter_img_1g);
title('Reducción de ruido con el filtro de media');
subplot(3,1,3); imshow(convoluted_img_1g);
title('Reducción de ruido con la convolución');

%% Punto 14

% aplicacion del ruido en la imagen
gaussian_noise_img_3 = imnoise(image_3, 'gaussian');
salt_pepper_img_3 = imnoise(image_3, 'salt & pepper', 0.02);

disp('La imagen con ruido salt & pepper está en canal RGB')
size(salt_pepper_img_1)

figure;
subplot(2,1,1); imshow(gaussian_noise_img_3);
title('Imágen con ruido gausiano');
subplot(2,1,2); imshow(salt_pepper_img_3);
title('Imágen con ruido sal y pimienta');

% Se debe aplicar en cada uno de los canales de la imágen
red_channelg = medfilt2(gaussian_noise_img_3(:,:,1), [5 5]);
green_channelg = medfilt2(gaussian_noise_img_3(:,:,2), [5 5]);
blue_channelg = medfilt2(gaussian_noise_img_3(:,:,3), [5 5]);

% Se reconstruye de nuevo la imágen
mean_filter_img_3g =  cat(3,red_channelg, green_channelg, blue_channelg);

% máscara de tamaño del filtro 5x5
auxMask = ones(5);
% promedio de la máscara
auxMask = double(auxMask/sum(auxMask));

% aplicacion la operacion convolución del filtro sobre la imágen
% se usa padding = 'same'
convoluted_img_3g = conv2(rgb2gray(mean_filter_img_3g), auxMask, 'same');
convoluted_img_3g = int8(convoluted_img_3g);

figure;
subplot(3,1,1); imshow(gaussian_noise_img_3);
title('Imágen con ruido gaussiano');
subplot(3,1,2); imshow(mean_filter_img_3g);
title('Reducción de ruido con el filtro de media');
subplot(3,1,3); imshow(convoluted_img_3g);
title('Reducción de ruido con la convolución');


%------------
% Se debe aplicar en cada uno de los canales de la imágen
red_channel = medfilt2(salt_pepper_img_3(:,:,1), [5 5]);
green_channel = medfilt2(salt_pepper_img_3(:,:,2), [5 5]);
blue_channel = medfilt2(salt_pepper_img_3(:,:,3), [5 5]);

% Se reconstruye de nuevo la imágen
mean_filter_img_3 =  cat(3,red_channel, green_channel, blue_channel);

% máscara de tamaño del filtro 5x5
auxMask = ones(5);
% promedio de la máscara
auxMask = double(auxMask/sum(auxMask));

% aplicacion la operacion convolución del filtro sobre la imágen
% se usa padding = 'same'
convoluted_img_3 = conv2(rgb2gray(mean_filter_img_3), auxMask, 'same');
convoluted_img_3 = int8(convoluted_img_3);

figure;
subplot(3,1,1); imshow(salt_pepper_img_3);
title('Imágen con ruido salt & pepper');
subplot(3,1,2); imshow(mean_filter_img_3);
title('Reducción de ruido con el filtro de media');
subplot(3,1,3); imshow(convoluted_img_3);
title('Reducción de ruido con la convolución');
