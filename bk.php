<?php
/**
 * Created by PhpStorm.
 * User: oberdanbrito
 * Date: 30/08/2018
 * Time: 08:19
 */

require_once('Backup.php');

define('HOST', 'ec2-54-225-129-101.compute-1.amazonaws.com');
define('PORT', '5432');
define('DBNAME', 'dbu32ump51i16k');
define('USER', 'hronsnruwxdwem');
define('PASSWORD', 'c0ae91a6933f2a9ba6b72b494e9e3a7e2c1568d054e884be79a5cac3c8af19d7');
define('DESTINO', '');

$bck = new Backup("host=" . HOST . " port=" . PORT . " dbname=" . DBNAME . " user=" . USER . " password=" . PASSWORD);

$bck->Destino = DESTINO;
$bck->VerificaDestino();

foreach ($bck->Esquemas as $key => $value) {
    echo $value['schema_name'] . "\n";
}

$bck->CopiarEsquema('config');