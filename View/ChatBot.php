<h2>Choisissez votre chatbot</h2>
<div class="chatbot-cards">
    <?php foreach ($chatbots as $chat): ?>
        <div class="chatbot-card">
            <h3><?php echo htmlspecialchars($chat['nom']); ?></h3>
            <p><strong>Caractère :</strong> <?php echo htmlspecialchars($chat['caractere']); ?></p>
            <p><strong>Exemples :</strong><br><?php echo nl2br(htmlspecialchars($chat['exemple_phrases'])); ?></p>
            <a href="index.php?page=chat&chatbot_id=<?= $chat['id'] ?>">Démarrer une conversation</a>
            
        </div>
    <?php endforeach; ?>
</div>




<style>
        html, body {
            height: 100%; 
            margin: 0; 
        }

        body {
            background-color: #c8e5e9;
            display: flex;
            flex-direction: column; /* Permet d'empiler le titre et les cartes */
            align-items: center; 
            justify-content: center; 
        }

        h2 {
            margin: 20px 0; /* Ajoute un espace entre le titre et les cartes */
            font-size: 1.8em;
            text-align: center;
            color: #333;
        }

        .chatbot-cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .chatbot-card {
            border: 1px solid #ccc;
            padding: 20px;
            width: 250px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-radius: 10px;
            background-color: #fff; /* Couleur de fond des cartes */
        }

        .chatbot-card h3 {
            font-size: 1.2em;
        }

        .chatbot-card p {
            margin: 10px 0;
        }

        .chatbot-card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            font-size: 1em;
            text-decoration: none;
            color: white;
            background-color:rgb(120, 163, 208);
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .chatbot-card a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .chatbot-card a:active {
            transform: scale(0.95);
        }
    </style>

