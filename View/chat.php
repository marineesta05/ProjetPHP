<h2>Bienvenue dans le chat, <?= htmlspecialchars($_SESSION['user']['prenom'] ?? 'Utilisateur') ?></h2>

<?php foreach ($exemples as $exemple): ?>
    <li><?= htmlspecialchars($exemple) ?></li>
<?php endforeach; ?>
 
<?php if (!empty($chatHistory)): ?>
    <?php foreach ($chatHistory as $chat): ?>
        <div class="user-message">
            <p><strong>Vous : </strong></p>
            <?= htmlspecialchars($chat['message_utilisateur'] ?? 'Message non disponible') ?>
        </div>
        <div class="bot-response">
            <p><strong>Bot : </strong></p>
            <?= htmlspecialchars($chat['message_chatbot'] ?? 'Réponse non disponible') ?>
        </div>
    <?php endforeach; ?>
<?php else: ?>
    <p>Aucun historique de chat disponible.</p>
<?php endif; ?>

<form method="post">
    <input type="text" name="message" placeholder="Entrez votre message" required>
    <button type="submit">Envoyer</button>
</form>

<a href="index.php?page=ChatBot" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; text-decoration: none; border-radius: 5px; margin-top: 10px;">
    Retour à la liste des chatbots
</a>

<style>
        body {
            background-color: #c8e5e9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
        }

        h2 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
            margin-bottom: 20px;
        }

        ul li {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .user-message, .bot-response {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
        }

        .user-message {
            background-color: #e6f7ff;
            border-left: 5px solid #007BFF;
        }

        .bot-response {
            background-color: #f1f1f1;
            border-left: 5px solid #28a745;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            max-width: 600px;
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            font-size: 1em;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color:rgb(120, 163, 208);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3; 
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color:rgb(120, 163, 208);
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }

        a:hover {
            background-color: #0056b3;
        }

        .chat-container {
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .chat-container p {
            margin: 5px 0;
        }
</style>
