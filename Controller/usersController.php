<?php
include_once 'Model/usersModel.php';

class UsersController
{

    private $model;

    public function __construct()
    {
        $this->model = new UsersModel;
    }


    public function getFormInscription()
    {
        include 'View/inscription.php';
    }

    public function inscription()
{
    if (!empty($_POST['nom']) && !empty($_POST['prenom']) && !empty($_POST['email']) && !empty($_POST['mdp'])) {
        $nom = htmlspecialchars($_POST['nom']);
        $prenom = htmlspecialchars($_POST['prenom']);
        $email = htmlspecialchars($_POST['email']);
        $mdp = password_hash($_POST['mdp'], PASSWORD_DEFAULT);

        if ($this->model->inscription($nom, $prenom, $email, $mdp)) {
            header("Location: index.php?page=connexion");
            exit();
        } else {
            $error = "Erreur lors de l'inscription. Veuillez réessayer.";
            include 'View/inscription.php';
        }
    } else {
        $error = "Veuillez remplir tous les champs.";
        include 'View/inscription.php';
    }
}

    public function getFormConnexion()
    {
        include 'view/connexion.php';
    }

    public function connexion() {
        if (isset($_POST['email']) && isset($_POST['mdp'])) {
            $email = $_POST['email'];
            $mdp = $_POST['mdp'];
            $user = $this->model->connexion($email, $mdp);
    
            if ($user) {
                session_start();
                $_SESSION['user'] = $user;
                header("Location: /ProjetPHP/index.php?page=ChatBot");
                exit();
            } else {
                echo 'Erreur de Connexion';
                $this->getFormConnexion();
            }
        } else {
            $this->getFormConnexion();
        }
    }
}