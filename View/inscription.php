<h1>Inscription</h1>
<form action="../index.php?page=inscription_action" method="POST"> 
    Nom : <input type="text" name="nom" required><br>
    Prénom : <input type="text" name="prenom" required><br>
    Email : <input type="email" name="email" required><br>
    Mot de passe : <input type="password" name="mdp" required><br>
    <button type="submit">S'inscrire</button><br>
    <p>Vous avez déjà un compte ? <a href="connexion.php">Se connecter</a></p>

</form>

<style>
body {
    background-color: #c8e5e9;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    padding: 20px;
    font-family: Arial, sans-serif;
}

h1 {
    font-size: 2em;
    color: #333;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 80%;
    max-width: 500px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

form input[type="text"],
form input[type="email"],
form input[type="password"] {
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
    font-size: 1em;
}

form button[type="submit"] {
    padding: 10px 20px;
    background-color: rgb(120, 163, 208);
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form button[type="submit"]:hover {
    background-color: #0056b3;
}

form a {
    display: inline-block;
    margin-top: 10px;
    color: #007BFF;
    text-decoration: none;
    font-size: 0.9em;
}

form a:hover {
    text-decoration: underline;
}

p {
    font-size: 0.9em;
    color: #333;
    margin-top: 15px;
}

p a {
    color: rgb(120, 163, 208);
    text-decoration: none;
}

p a:hover {
    text-decoration: underline;
}
</style>