
<?php
include_once 'bdd.php';

class UsersModel
{
    private $bdd;

    public function __construct()
    {
        $this->bdd = Bdd::connexion();
    }
    public function inscription($nom, $prenom, $email, $mdp){  
        $user = $this->bdd->prepare("INSERT INTO users(nom, prenom, email, mdp) VALUES (?,?,?,?)");
        return $user->execute([$nom,$prenom, $email, $mdp ]);
        }

    public function connexion($email, $mdp) {
        $query = $this->bdd->prepare("SELECT * FROM users WHERE email = ?");
        $query->execute([$email]);
        $user = $query->fetch(PDO::FETCH_ASSOC);
    
        if ($user && password_verify($mdp, $user['mdp'])) {
            unset($user['mdp']); 
            return $user;
        } else {
            return false;
        }
    }

    
}