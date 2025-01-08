<?php

class Bdd{

    public static function connexion()
    {
        try
        {
           // $bdd = new PDO("mysql:host=localhost;port=3307;dbname=news","login","mdp");
            $bdd = new PDO("mysql:host=localhost;port=3306;dbname=chatbot","root","");
            //echo "connexion BDD OK";
            return $bdd;
        }
        catch(Exception $e)
        {
            die("Erreur de connexion : " . $e->getMessage());
        }
    }

}