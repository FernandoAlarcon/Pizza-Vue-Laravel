<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel
 
Este es un sistema Crud realizado para la creacion de Ordenes de una empresa de pizza, el software es meramente funcional, visualmente solo es comodo, no tiene gran cosa, el proposito es poder compilar y poder notificar al usuario al correo electronico y ofrecer interactividad de forma dinamica.
<br>
<b>Compilacion</b>
<br>
<p>
    - Para compilar y ejecutar debe primer hacer el Git Clone, quiza tome unos minutos.
    - Una vez clonado, ir a ./Databases y tomar la base de Datos y exportarla a apache MySQL, no es posible generar migraciones en esta oportunidad.
    - Modificar el archivo .ENV en caso de contraseña con el ROOT o el puerto (Opcional)
    - Ejecutar desde consola npm i para descargar las librerias de Node generar el /node_modules
    - Ejecutar desde consola php artisan serve 
    - Ejecutar desde consola npm run watch-poll o npm run watch o npm run dev para compilar el JS (VUE)
    - Ir al Puerto 8000 o el puerto que te indique la consola
    - Listo ...