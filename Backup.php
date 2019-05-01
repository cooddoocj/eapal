<?php
/**
 * Created by PhpStorm.
 * User: oberdanbrito
 * Date: 30/08/2018
 * Time: 09:04
 */

/**
 * Class Backup
 */
class Backup
{

    private $_connection;

    /**
     * Parâmetros de conexão com o banco de dados
     * @var
     */
    public $ConnectionString;

    /**
     * Possui a lista dos nomes dos esquemas que devem ser copiados
     * @var
     */
    public $Esquemas;

    /**
     * Nome do diretorio de destino do backup
     * @var
     */
    public $Destino;


    /**
     * Backup constructor.
     * @param $ConnectionString
     */
    public function __construct($ConnectionString)
    {
        $this->ConnectionString = $ConnectionString;
        $this->_connection = pg_connect($this->ConnectionString);
        $this->obtemesquemas();
    }

    /**
     * Busca a lista dos nomes dos esquemas no banco de dados
     */
    private function obtemesquemas()
    {

        $instesquemas = <<<SQL
select schema_name from information_schema.schemata
  where schema_name not like 'pg%' and schema_name not in ('information_schema')
order by schema_name
SQL;

        $this->Esquemas = pg_fetch_all(pg_query($instesquemas));
    }

    /**
     * Obtem o dia da semana e verifica se o caminho existe
     * Caso não exista ele cria o caminho de destino
     */
    public function VerificaDestino()
    {

        $dia = Array('dom', 'seg', 'ter', 'qua', 'qui', 'sex', 'sab');
        $this->Destino .= $dia[date('N')];

        if (!file_exists($this->Destino)) {
            mkdir($this->Destino, 0777);
            echo "O destino $this->Destino está sendo criado neste momento\n";
        } else {
            echo "O destino $this->Destino já existe\n";
        }

        $this->Destino .= '/';
    }

    /**
     * Executa a copia do esquema no formato plain-text
     */
    public function CopiarEsquema($Esquema)
    {

        exec('pg_dump --file "' . $this->Destino . $Esquema . '.sql" --host "' . pg_host($this->_connection) .
            '" --port "' . pg_port($this->_connection) .
            '" --username "postgres" --no-password --verbose --role "postgres" --format=p --no-owner --no-privileges --inserts --column-inserts --encoding "UTF8" --schema "' . $Esquema .
            '" "' . pg_dbname($this->_connection) . '"');


    }

}